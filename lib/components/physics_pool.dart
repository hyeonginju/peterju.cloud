import 'dart:async';

import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../models/translation.dart';
import '../models/quote.dart';
import '../util/physics_js_web.dart' if (dart.library.io) '../util/physics_js_stub.dart';

class PhysicsPool extends StatefulComponent {
  final String lang;
  final void Function(int idx) onQuoteSelected;

  const PhysicsPool({
    required this.lang,
    required this.onQuoteSelected,
    super.key,
  });

  @override
  State<PhysicsPool> createState() => _PhysicsPoolState();

  @css
  static final List<StyleRule> styles = [
    css('.physics-section').styles(
      backgroundColor: Color('#F0F9FF'),
      padding: Spacing.only(top: 80.px, bottom: 40.px),
    ),
    css('.physics-desc').styles(
      fontSize: 0.9375.rem,
      color: Color('#64748B'),
      margin: Spacing.only(top: 8.px),
    ),
    css('.physics-wrapper').styles(
      position: Position.relative(),
      margin: Spacing.only(top: 40.px),
    ),
    css('.physics-canvas-wrap').styles(
      width: 100.percent,
      height: 640.px,
      position: Position.relative(),
      overflow: Overflow.hidden,
      backgroundColor: Color('#F0F9FF'),
    ),
    css('.physics-canvas-wrap canvas').styles(
      display: .block,
      width: 100.percent,
      height: 100.percent,
    ),
    css.media(MediaQuery.all(maxWidth: 768.px), [
      // hidden on mobile — physics engine is not started there either
      css('.physics-section').styles(
        display: .none,
      ),
    ]),
  ];
}

class _PhysicsPoolState extends State<PhysicsPool> {
  static const _containerId = 'physics-container';

  // Below this width the section is hidden (CSS) and physics never runs.
  static const _mobileBreakpoint = 768;

  @override
  void initState() {
    super.initState();
    // Skip the heavy Matter.js engine on mobile — the section is hidden there.
    if (kIsWeb && viewportWidth > _mobileBreakpoint) {
      setClickCallback((int idx) => component.onQuoteSelected(idx));
      final quotesJson = _buildQuotesJson();
      unawaited(Future.microtask(() => initPhysics(_containerId, quotesJson)));
    }
  }

  @override
  void dispose() {
    if (kIsWeb) destroyPhysics();
    super.dispose();
  }

  String _buildQuotesJson() {
    final parts = bookQuotes.map((q) {
      final text = q.textKo
          .replaceAll(r'\', r'\\')
          .replaceAll('"', r'\"')
          .replaceAll('\n', ' ');
      return '{"text":"$text"}';
    });
    return '[${parts.join(',')}]';
  }

  @override
  Component build(BuildContext context) {
    final lang = component.lang;

    return section(classes: 'physics-section', [
      div(classes: 'section-inner', [
        div(classes: 'section-header', [
          h2(classes: 'section-title', [.text(AppText.physicsTitle(lang))]),
          p(classes: 'physics-desc', [.text(AppText.physicsDesc(lang))]),
        ]),
      ]),
      div(classes: 'physics-wrapper', [
        div(id: _containerId, classes: 'physics-canvas-wrap', []),
      ]),
    ]);
  }
}
