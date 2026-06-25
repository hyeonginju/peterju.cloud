import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../models/project_item.dart';
import '../models/translation.dart';

class SideProjectCard extends StatefulComponent {
  final SideProjectItem project;
  final String lang;

  const SideProjectCard({required this.project, required this.lang, super.key});

  @override
  State<SideProjectCard> createState() => _SideProjectCardState();

  @css
  static final List<StyleRule> styles = _SideProjectCardState._stylesList;
}

class _SideProjectCardState extends State<SideProjectCard> {
  bool _hovered = false;

  @override
  Component build(BuildContext context) {
    final proj = component.project;
    final lang = component.lang;

    if (proj.isPlaceholder) {
      return div(classes: 'side-card side-card--placeholder', [
        div(classes: 'placeholder-inner', [
          span(classes: 'coming-badge', [.text(AppText.comingSoon(lang))]),
          div(classes: 'placeholder-icon', [.text('📱')]),
          span(classes: 'placeholder-name', [.text(proj.name)]),
          div(classes: 'placeholder-tags', [
            for (final tag in proj.tags) span(classes: 'side-tag', [.text(tag)]),
          ]),
        ]),
      ]);
    }

    return div(
      classes: 'side-card ${_hovered ? 'side-card--hovered' : ''}',
      events: {
        'mouseenter': (_) => setState(() => _hovered = true),
        'mouseleave': (_) => setState(() => _hovered = false),
      },
      [
        div(classes: 'side-card-top', [
          div(classes: 'side-card-logo', [
            span(
              classes: 'side-logo-text',
              attributes: proj.logoColor != null
                  ? {'style': 'color: ${proj.logoColor}'}
                  : {},
              [.text(proj.logoText ?? proj.name)],
            ),
          ]),
          div(classes: 'side-card-tags', [
            for (final tag in proj.tags) span(classes: 'side-tag', [.text(tag)]),
          ]),
        ]),
        p(classes: 'side-card-desc', [
          .text(lang == 'ko' ? proj.descKo : proj.descEn),
        ]),
        if (proj.url != null && _hovered)
          div(classes: 'side-card-action', [
            a(
              href: proj.url!,
              target: Target.blank,
              attributes: {'rel': 'noopener noreferrer'},
              classes: 'visit-btn',
              [.text(AppText.visitSite(lang))],
            ),
          ]),
      ],
    );
  }

  static final List<StyleRule> _stylesList = [
    css('.side-card').styles(
      backgroundColor: Color('#FFFFFF'),
      radius: .all(.circular(16.px)),
      border: Border.all(color: Color('#E2E8F0'), width: 1.px),
      padding: Spacing.all(28.px),
      display: .flex,
      flexDirection: .column,
      gap: Gap.all(16.px),
      cursor: .pointer,
      transition: Transition('all', duration: const Duration(milliseconds: 250)),
      position: Position.relative(),
      overflow: Overflow.hidden,
    ),
    css('.side-card--hovered').styles(
      border: Border.all(color: Color('#2563EB'), width: 1.5.px),
      shadow: BoxShadow(offsetX: 0.px, offsetY: 8.px, blur: 32.px, color: Color('rgba(37,99,235,0.15)')),
      transform: Transform.translate(x: 0.px, y: (-4).px),
    ),
    css('.side-card--placeholder').styles(
      raw: {'cursor': 'default'},
      opacity: 0.6,
    ),
    css('.side-card-top').styles(
      display: .flex,
      justifyContent: .spaceBetween,
      alignItems: AlignItems.start,
    ),
    css('.side-card-logo').styles(
      display: .flex,
      alignItems: .center,
    ),
    css('.side-logo-text').styles(
      fontSize: 1.625.rem,
      fontWeight: .w900,
      color: Color('#AACC00'),
      letterSpacing: (-0.03).em,
      fontFamily: FontFamily.list(const [FontFamily('Impact'), FontFamilies.sansSerif]),
    ),
    css('.side-card-tags').styles(
      display: .flex,
      flexWrap: .wrap,
      gap: Gap.all(6.px),
      justifyContent: JustifyContent.end,
    ),
    css('.side-tag').styles(
      fontSize: 0.75.rem,
      padding: Spacing.symmetric(horizontal: 8.px, vertical: 3.px),
      backgroundColor: Color('#F1F5F9'),
      color: Color('#64748B'),
      radius: .all(.circular(4.px)),
      fontWeight: .w500,
    ),
    css('.side-card-desc').styles(
      fontSize: 0.9375.rem,
      color: Color('#64748B'),
      margin: .zero,
      flex: Flex(grow: 1),
      raw: {'line-height': '1.7'},
    ),
    css('.side-card-action').styles(
      margin: Spacing.only(top: 4.px),
    ),
    css('.visit-btn').styles(
      display: .inlineBlock,
      padding: Spacing.symmetric(horizontal: 20.px, vertical: 10.px),
      border: Border.all(color: Color('#2563EB'), width: 1.5.px),
      radius: .all(.circular(8.px)),
      fontSize: 0.875.rem,
      fontWeight: .w600,
      color: Color('#2563EB'),
      textDecoration: .none,
      transition: Transition('all', duration: const Duration(milliseconds: 200)),
    ),
    css('.visit-btn:hover').styles(
      backgroundColor: Color('#2563EB'),
      color: Color('#FFFFFF'),
    ),
    css('.placeholder-inner').styles(
      display: .flex,
      flexDirection: .column,
      alignItems: .center,
      justifyContent: .center,
      gap: Gap.all(12.px),
      padding: Spacing.symmetric(vertical: 24.px),
    ),
    css('.coming-badge').styles(
      fontSize: 0.75.rem,
      fontWeight: .w600,
      color: Color('#94A3B8'),
      letterSpacing: 0.05.em,
      textTransform: TextTransform.upperCase,
      padding: Spacing.symmetric(horizontal: 10.px, vertical: 4.px),
      border: Border.all(color: Color('#E2E8F0'), width: 1.px),
      radius: .all(.circular(12.px)),
    ),
    css('.placeholder-icon').styles(
      fontSize: 2.5.rem,
    ),
    css('.placeholder-name').styles(
      fontSize: 1.rem,
      fontWeight: .w600,
      color: Color('#94A3B8'),
    ),
    css('.placeholder-tags').styles(
      display: .flex,
      gap: Gap.all(6.px),
      flexWrap: .wrap,
      justifyContent: .center,
    ),
  ];
}
