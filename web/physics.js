/** @format */

// Matter.js Physics Pool — "Sea of Thoughts"
// Cards drift freely with a layered depth (pseudo-3D) feel. No gravity.
(function () {
  let engine, render, runner, mouseConstraint;
  let quoteBodies = [];
  let cycleInterval = null;

  const MAX_CARDS = 20; // how many quote cards float at once

  window.initPhysics = function (containerId, quotes) {
    const container = document.getElementById(containerId);
    if (!container || typeof Matter === "undefined") return;

    const width = container.offsetWidth;
    const height = container.offsetHeight;

    // Engine — zero gravity, free floating
    engine = Matter.Engine.create();
    engine.gravity.y = 0;
    engine.gravity.x = 0;

    // Renderer
    render = Matter.Render.create({
      element: container,
      engine: engine,
      options: {
        width: width,
        height: height,
        background: "#F0F9FF",
        wireframes: false,
        pixelRatio: window.devicePixelRatio || 1,
      },
    });

    // Walls (static boundaries)
    const walls = [
      Matter.Bodies.rectangle(width / 2, height + 30, width + 60, 60, {
        isStatic: true,
        render: { fillStyle: "transparent" },
      }),
      Matter.Bodies.rectangle(width / 2, -30, width + 60, 60, {
        isStatic: true,
        render: { fillStyle: "transparent" },
      }),
      Matter.Bodies.rectangle(-30, height / 2, 60, height + 60, {
        isStatic: true,
        render: { fillStyle: "transparent" },
      }),
      Matter.Bodies.rectangle(width + 30, height / 2, 60, height + 60, {
        isStatic: true,
        render: { fillStyle: "transparent" },
      }),
    ];
    Matter.Composite.add(engine.world, walls);

    // Quote bodies — only MAX_CARDS float at once; the rest cycle in over time.
    quoteBodies = [];
    const activeSet = {}; // qi -> true while that quote is on screen

    function spawnCard(qi) {
      const q = quotes[qi];
      const depth = Math.random(); // 0..1
      const scale = 0.7 + depth * 0.55; // 0.7 .. 1.25
      const fontSize = 9.5 + depth * 4.5; // 9.5 .. 14

      const textLen = q.text ? q.text.length : 10;
      const baseW = Math.min(230, Math.max(120, textLen * 6.2 + 40));
      const cardW = baseW * scale;
      const cardH = 48 * scale;

      const x = 40 + Math.random() * (width - cardW - 40);
      const y = 40 + Math.random() * (height - cardH - 40);

      const body = Matter.Bodies.rectangle(x, y, cardW, cardH, {
        restitution: 0.8,
        friction: 0.02,
        // very low air friction so gentle drift never dies out
        frictionAir: 0.008,
        render: { fillStyle: "transparent", strokeStyle: "transparent", lineWidth: 0 },
        label: "quote_" + qi,
        angle: 0,
      });

      // Lock rotation so text never flips — cards stay upright & readable
      Matter.Body.setInertia(body, Infinity);

      Matter.Body.setVelocity(body, {
        x: (Math.random() - 0.5) * 0.6,
        y: (Math.random() - 0.5) * 0.6,
      });

      quoteBodies.push({
        body: body,
        quote: q,
        qi: qi,
        w: cardW,
        h: cardH,
        depth: depth,
        baseDepth: depth,
        depthPhase: Math.random() * Math.PI * 2,
        fontSize: fontSize,
        wanderAngle: Math.random() * Math.PI * 2,
        fadeMul: 0, // 0..1 lifecycle fade
        state: "in", // 'in' (fading in) | 'alive' | 'out' (fading out)
      });
      Matter.Composite.add(engine.world, body);
      activeSet[qi] = true;
      // keep far cards behind near cards
      quoteBodies.sort(function (a, b) {
        return a.baseDepth - b.baseDepth;
      });
    }

    // Shuffle quote indices, then show the first MAX_CARDS
    const order = quotes.map(function (_, i) {
      return i;
    });
    for (let i = order.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      const tmp = order[i];
      order[i] = order[j];
      order[j] = tmp;
    }
    order.slice(0, Math.min(MAX_CARDS, quotes.length)).forEach(spawnCard);

    // Retire one alive card; once it fades out a fresh quote fades in (see
    // the lifecycle handling in beforeUpdate). Only cycle if there are more
    // quotes than visible slots.
    function retireOne() {
      const alive = quoteBodies.filter(function (it) {
        return it.state === "alive";
      });
      if (alive.length === 0) return;
      alive[Math.floor(Math.random() * alive.length)].state = "out";
    }
    if (quotes.length > MAX_CARDS) {
      cycleInterval = setInterval(retireOne, 2800);
    }

    // Spawn a replacement from the pool of quotes not currently shown
    function spawnReplacement() {
      const pool = order.filter(function (qi) {
        return !activeSet[qi];
      });
      if (pool.length) spawnCard(pool[Math.floor(Math.random() * pool.length)]);
    }

    // Mouse control (drag + click)
    const mouse = Matter.Mouse.create(render.canvas);
    mouse.pixelRatio = render.options.pixelRatio;

    // --- Scroll fix: let page wheel/touch scroll pass through the canvas ---
    mouse.element.removeEventListener("mousewheel", mouse.mousewheel);
    mouse.element.removeEventListener("DOMMouseScroll", mouse.mousewheel);
    render.canvas.style.touchAction = "pan-y";

    mouseConstraint = Matter.MouseConstraint.create(engine, {
      mouse: mouse,
      constraint: { stiffness: 0.16, render: { visible: false } },
    });
    Matter.Composite.add(engine.world, mouseConstraint);
    render.mouse = mouse;

    // Click to open quote modal (vs drag)
    let lastDragPos = null;
    Matter.Events.on(mouseConstraint, "mousedown", function (e) {
      lastDragPos = { x: e.mouse.position.x, y: e.mouse.position.y };
    });
    Matter.Events.on(mouseConstraint, "mouseup", function (e) {
      if (mouseConstraint.body) return; // was dragging
      const pos = e.mouse.position;
      const dx = pos.x - (lastDragPos ? lastDragPos.x : pos.x);
      const dy = pos.y - (lastDragPos ? lastDragPos.y : pos.y);
      if (Math.sqrt(dx * dx + dy * dy) > 8) return; // moved too much = drag

      const hit = Matter.Query.point(
        quoteBodies.map(function (b) {
          return b.body;
        }),
        pos,
      );
      if (hit.length > 0) {
        // top-most (nearest) card wins
        let best = null;
        hit.forEach(function (h) {
          const item = quoteBodies.find(function (qb) {
            return qb.body === h;
          });
          if (item && (!best || item.depth > best.depth)) best = item;
        });
        if (best) {
          const idx = parseInt(best.body.label.replace("quote_", ""), 10);
          if (window._dartQuoteClick) window._dartQuoteClick(idx);
        }
      }
    });

    // Release a held card when the pointer leaves the canvas. Matter's mouse
    // listeners live only on the canvas, so dragging out and releasing would
    // otherwise keep the card stuck. We only release on leave (not on every
    // mouseup) so in-canvas drag-vs-click detection stays intact.
    render.canvas.addEventListener("mouseleave", function () {
      if (!mouseConstraint) return;
      mouse.button = -1; // engine treats this as "no button down" → releases
      mouseConstraint.body = null;
      if (mouseConstraint.constraint) {
        mouseConstraint.constraint.bodyB = null;
        mouseConstraint.constraint.pointB = null;
      }
      lastDragPos = null;
    });

    // Continuous gentle wandering — blend each body's velocity toward a
    // steering direction so cards always float on their own, stay off the
    // walls, and spread out instead of clumping.
    const driftSpeed = 0.5; // gentle base drift speed (px/step)
    const sepDist = 165; // cards closer than this push apart (padding gap)
    const sepStrength = 1.1; // how hard the separation push is (additive, not normalized)
    const wallBounce = 0.9; // springiness when a card meets a wall
    const wallKick = 0.6; // extra inward shove off the wall
    Matter.Events.on(engine, "beforeUpdate", function () {
      // lifecycle fade — advance fade-in / fade-out, recycle finished cards
      for (let k = quoteBodies.length - 1; k >= 0; k--) {
        const it = quoteBodies[k];
        if (it.state === "in") {
          it.fadeMul += 0.003;
          if (it.fadeMul >= 1) {
            it.fadeMul = 1;
            it.state = "alive";
          }
        } else if (it.state === "out") {
          it.fadeMul -= 0.003;
          if (it.fadeMul <= 0) {
            Matter.Composite.remove(engine.world, it.body);
            quoteBodies.splice(k, 1);
            delete activeSet[it.qi];
            spawnReplacement();
          }
        }
      }

      quoteBodies.forEach(function (item) {
        const b = item.body;
        if (mouseConstraint && mouseConstraint.body === b) return; // don't fight a drag

        const p = b.position;

        // 1) base meandering drift (heading slowly random-walks)
        item.wanderAngle += (Math.random() - 0.5) * 0.1;
        let dvx = Math.cos(item.wanderAngle) * driftSpeed;
        let dvy = Math.sin(item.wanderAngle) * driftSpeed;

        // 2) separation — ADDITIVE push away from nearby cards (kept at full
        // strength, NOT normalized away, so a real gap opens up)
        quoteBodies.forEach(function (other) {
          if (other === item) return;
          const dx = p.x - other.body.position.x;
          const dy = p.y - other.body.position.y;
          const d2 = dx * dx + dy * dy;
          if (d2 > 0.01 && d2 < sepDist * sepDist) {
            const d = Math.sqrt(d2);
            const f = (sepDist - d) / sepDist; // 0 (far) .. 1 (touching)
            dvx += (dx / d) * f * sepStrength;
            dvy += (dy / d) * f * sepStrength;
          }
        });

        // blend toward this target velocity
        const v = b.velocity;
        let nvx = v.x * 0.9 + dvx * 0.1;
        let nvy = v.y * 0.9 + dvy * 0.1;

        // 3) walls — reflect velocity AND re-aim the heading outward so the
        // card actually turns around instead of drifting straight back in
        const halfW = item.w / 2;
        const halfH = item.h / 2;
        let bounced = false;
        if (p.x - halfW < 6 && nvx < 0) {
          nvx = Math.abs(nvx) * wallBounce + wallKick;
          bounced = true;
        } else if (p.x + halfW > width - 6 && nvx > 0) {
          nvx = -Math.abs(nvx) * wallBounce - wallKick;
          bounced = true;
        }
        if (p.y - halfH < 6 && nvy < 0) {
          nvy = Math.abs(nvy) * wallBounce + wallKick;
          bounced = true;
        } else if (p.y + halfH > height - 6 && nvy > 0) {
          nvy = -Math.abs(nvy) * wallBounce - wallKick;
          bounced = true;
        }
        if (bounced) item.wanderAngle = Math.atan2(nvy, nvx); // turn the meander inward

        Matter.Body.setVelocity(b, { x: nvx, y: nvy });
      });
    });

    // Custom rendering: rounded cards with text, depth-faded
    Matter.Events.on(render, "afterRender", function () {
      const ctx = render.context;
      const t = engine.timing.timestamp;
      quoteBodies.forEach(function (item) {
        const body = item.body;
        const q = item.quote;
        const w = item.w;
        const h = item.h;
        const pos = body.position;
        const angle = body.angle;

        // Oscillating depth — opacity slowly fades in/out so cards appear to
        // drift forward and backward in space.
        const dyn = item.baseDepth + 0.4 * Math.sin(t * 0.0004 + item.depthPhase);
        const depth = Math.max(0.0, Math.min(1.0, dyn));
        const opacity = (0.32 + depth * 0.68) * item.fadeMul; // 0..1, faded by lifecycle

        ctx.save();
        ctx.globalAlpha = opacity;
        ctx.translate(pos.x, pos.y);
        ctx.rotate(angle);

        // soft shadow for depth (nearer = stronger)
        ctx.shadowColor = "rgba(37, 99, 235, " + (0.06 + depth * 0.12) + ")";
        ctx.shadowBlur = 6 + depth * 14;
        ctx.shadowOffsetY = 2 + depth * 4;

        // Card background
        ctx.beginPath();
        ctx.roundRect(-w / 2, -h / 2, w, h, 10);
        ctx.fillStyle = "#FFFFFF";
        ctx.fill();
        ctx.shadowColor = "transparent";
        ctx.shadowBlur = 0;
        ctx.shadowOffsetY = 0;
        ctx.strokeStyle = "#BFDBFE";
        ctx.lineWidth = 1.25;
        ctx.stroke();

        // Text: quote snippet only (no source on card)
        const maxTextW = w - 20;
        ctx.fillStyle = "#0F172A";
        ctx.font = "500 " + item.fontSize.toFixed(1) + 'px "Noto Sans KR", sans-serif';
        ctx.textAlign = "center";
        ctx.textBaseline = "middle";

        let textLine = q.text || "";
        while (textLine.length > 4 && ctx.measureText(textLine).width > maxTextW) {
          textLine = textLine.slice(0, -1);
        }
        if (textLine !== (q.text || "")) textLine = textLine.replace(/\s+$/, "") + "…";
        ctx.fillText(textLine, 0, 0);

        ctx.restore();
      });
    });

    // Start engine & renderer
    Matter.Render.run(render);
    runner = Matter.Runner.create();
    Matter.Runner.run(runner, engine);

    // Resize handler
    window.addEventListener("resize", function () {
      resizePhysics(container);
    });
  };

  // Called from Dart — parses JSON and initializes physics
  window.initPhysicsWithData = function (containerId, quotesJson) {
    var quotes = JSON.parse(quotesJson);
    function tryInit() {
      if (typeof Matter !== "undefined") {
        window.initPhysics(containerId, quotes);
      } else {
        setTimeout(tryInit, 100);
      }
    }
    tryInit();
  };

  // Called from Dart — stores click callback set via JS interop
  window.setPhysicsClickCallback = function (fn) {
    window._dartQuoteClick = fn;
  };

  window.destroyPhysics = function () {
    if (cycleInterval) {
      clearInterval(cycleInterval);
      cycleInterval = null;
    }
    if (render) Matter.Render.stop(render);
    if (runner) Matter.Runner.stop(runner);
    if (engine) Matter.Engine.clear(engine);
    quoteBodies = [];
  };

  function resizePhysics(container) {
    if (!render || !engine) return;
    const newW = container.offsetWidth;
    const newH = container.offsetHeight;
    render.canvas.width = newW * (window.devicePixelRatio || 1);
    render.canvas.height = newH * (window.devicePixelRatio || 1);
    render.canvas.style.width = newW + "px";
    render.canvas.style.height = newH + "px";
    render.options.width = newW;
    render.options.height = newH;
  }
})();
