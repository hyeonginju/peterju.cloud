import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../models/translation.dart';

class SiteHeader extends StatelessComponent {
  final String lang;
  final void Function() onToggleLang;

  const SiteHeader({required this.lang, required this.onToggleLang, super.key});

  @override
  Component build(BuildContext context) {
    return header(classes: 'site-header', [
      div(classes: 'header-inner', [
        a(href: '#hero', classes: 'header-logo', [
          span(classes: 'logo-name', [.text(lang == 'ko' ? '주형인' : 'Peter Ju')]),
          span(classes: 'logo-dot', [.text('.')]),
        ]),
        nav(classes: 'header-nav', [
          a(href: '#skills', classes: 'nav-link', [.text(AppText.navSkills(lang))]),
          a(href: '#projects', classes: 'nav-link', [.text(AppText.navProjects(lang))]),
          a(href: '#experience', classes: 'nav-link', [.text(AppText.navExperience(lang))]),
          button(
            onClick: onToggleLang,
            classes: 'lang-toggle ${lang == 'ko' ? 'lang-ko' : 'lang-en'}',
            [
              span(classes: 'lang-option ${lang == 'ko' ? 'active' : ''}', [.text('KR')]),
              span(classes: 'lang-divider', [.text('|')]),
              span(classes: 'lang-option ${lang == 'en' ? 'active' : ''}', [.text('EN')]),
            ],
          ),
        ]),
      ]),
    ]);
  }

  @css
  static final List<StyleRule> styles = [
    css('.site-header').styles(
      position: Position.fixed(top: 0.px, left: 0.px, right: 0.px),
      zIndex: ZIndex(100),
      backgroundColor: Color('rgba(248, 250, 252, 0.92)'),
      backdropFilter: Filter.blur(12.px),
      border: Border.only(bottom: BorderSide(color: Color('#E2E8F0'), width: 1.px)),
    ),
    css('.header-inner').styles(
      maxWidth: 1200.px,
      margin: Spacing.symmetric(horizontal: Unit.auto),
      padding: Spacing.symmetric(horizontal: 24.px),
      height: 64.px,
      display: .flex,
      alignItems: .center,
      justifyContent: .spaceBetween,
    ),
    css('.header-logo').styles(
      display: .flex,
      alignItems: .center,
      textDecoration: .none,
      gap: Gap.all(2.px),
    ),
    css('.logo-name').styles(
      fontSize: 1.25.rem,
      fontWeight: .w700,
      color: Color('#0F172A'),
      letterSpacing: (-0.02).em,
    ),
    css('.logo-dot').styles(
      fontSize: 1.5.rem,
      fontWeight: .w700,
      color: Color('#2563EB'),
    ),
    css('.header-nav').styles(
      display: .flex,
      alignItems: .center,
      gap: Gap.all(32.px),
    ),
    css('.nav-link').styles(
      fontSize: 0.875.rem,
      fontWeight: .w500,
      color: Color('#64748B'),
      textDecoration: .none,
      transition: Transition('color', duration: const Duration(milliseconds: 200)),
    ),
    css('.nav-link:hover').styles(
      color: Color('#2563EB'),
    ),
    css('.lang-toggle').styles(
      display: .flex,
      alignItems: .center,
      gap: Gap.all(6.px),
      padding: Spacing.symmetric(horizontal: 14.px, vertical: 6.px),
      border: Border.all(color: Color('#CBD5E1'), width: 1.5.px),
      radius: .all(.circular(20.px)),
      backgroundColor: Colors.transparent,
      cursor: .pointer,
      transition: Transition('border-color', duration: const Duration(milliseconds: 200)),
    ),
    css('.lang-toggle:hover').styles(
      border: Border.all(color: Color('#2563EB'), width: 1.5.px),
    ),
    css('.lang-option').styles(
      fontSize: 0.75.rem,
      fontWeight: .w600,
      color: Color('#94A3B8'),
      transition: Transition('color', duration: const Duration(milliseconds: 200)),
    ),
    css('.lang-option.active').styles(
      color: Color('#2563EB'),
    ),
    css('.lang-divider').styles(
      fontSize: 0.75.rem,
      color: Color('#CBD5E1'),
    ),
    css.media(MediaQuery.all(maxWidth: 640.px), [
      css('.header-nav .nav-link').styles(
        display: .none,
      ),
      css('.header-inner').styles(
        padding: Spacing.symmetric(horizontal: 16.px),
      ),
    ]),
  ];
}
