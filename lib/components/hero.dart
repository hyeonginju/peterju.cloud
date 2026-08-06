import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../models/translation.dart';

class HeroSection extends StatelessComponent {
  final String lang;

  const HeroSection({required this.lang, super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'hero', classes: 'hero-section', [
      div(classes: 'hero-inner', [
        div(classes: 'hero-tag', [
          span(classes: 'hero-tag-dot', []),
          span([.text(AppText.heroTag(lang))]),
        ]),
        h1(classes: 'hero-headline', [
          .text(AppText.heroHeadline(lang)),
        ]),
        p(classes: 'hero-desc', [
          .text(AppText.heroDescription(lang)),
        ]),
        div(classes: 'hero-actions', [
          a(
            href: '#projects',
            classes: 'btn btn-primary',
            [.text(AppText.heroCta(lang))],
          ),
        ]),
        div(classes: 'hero-links', [
          a(
            href: 'https://github.com/hyeonginju',
            target: Target.blank,
            attributes: {'rel': 'noopener noreferrer'},
            classes: 'social-link',
            [.text('GitHub')],
          ),
          span(classes: 'social-sep', [.text('·')]),
          a(
            href: 'https://velog.io/@guddls64',
            target: Target.blank,
            attributes: {'rel': 'noopener noreferrer'},
            classes: 'social-link',
            [.text('Blog')],
          ),
          span(classes: 'social-sep', [.text('·')]),
          a(
            href: 'mailto:guddls654@gmail.com',
            id: 'contact',
            classes: 'social-link',
            [.text('guddls654@gmail.com')],
          ),
        ]),
      ]),
      div(classes: 'hero-stats', [
        _statCard('5+', lang == 'ko' ? 'End to End 프로젝트' : 'End to End Projects'),
        _statCard('50%', lang == 'ko' ? 'AI 토큰 비용 절감' : 'AI token Cost Cut'),
        _statCard('60%', lang == 'ko' ? '운용비용 절감' : 'Operating Cost Cut'),
        _statCard('4', lang == 'ko' ? '배포 플랫폼' : 'Deploy Platforms', 'iOS · AOS · Web · Windows'),
      ]),
    ]);
  }

  Component _statCard(String value, String label, [String? subLabel]) {
    return div(classes: 'stat-card', [
      span(classes: 'stat-value', [.text(value)]),
      span(classes: 'stat-label', [.text(label)]),
      if (subLabel != null) span(classes: 'stat-sublabel', [.text(subLabel)]),
    ]);
  }

  @css
  static final List<StyleRule> styles = [
    css('.hero-section').styles(
      minHeight: 100.vh,
      display: .flex,
      flexDirection: .column,
      justifyContent: .center,
      padding: Spacing.only(top: 64.px),
      backgroundColor: Color('#F8FAFC'),
      position: Position.relative(),
    ),
    css('.hero-inner').styles(
      width: 100.percent,
      maxWidth: 1200.px,
      margin: Spacing.symmetric(horizontal: Unit.auto),
      padding: Spacing.only(top: 80.px, left: 40.px, right: 40.px, bottom: 40.px),
    ),
    css('.hero-tag').styles(
      display: .flex,
      alignItems: .center,
      gap: Gap.all(8.px),
      margin: Spacing.only(bottom: 24.px),
    ),
    css('.hero-tag-dot').styles(
      width: 8.px,
      height: 8.px,
      radius: .all(.circular(4.px)),
      backgroundColor: Color('#2563EB'),
      display: .inlineBlock,
    ),
    css('.hero-tag span:last-child').styles(
      fontSize: 0.875.rem,
      fontWeight: .w600,
      color: Color('#2563EB'),
      letterSpacing: 0.05.em,
      textTransform: TextTransform.upperCase,
    ),
    css('.hero-headline').styles(
      fontSize: 3.5.rem,
      fontWeight: .w800,
      color: Color('#0F172A'),
      letterSpacing: (-0.02).em,
      margin: Spacing.only(bottom: 24.px),
      raw: {'line-height': '1.15', 'white-space': 'pre-line'},
    ),
    css('.hero-desc').styles(
      fontSize: 1.125.rem,
      color: Color('#64748B'),
      maxWidth: 640.px,
      margin: Spacing.only(bottom: 40.px),
      raw: {'line-height': '1.7'},
    ),
    css('.hero-actions').styles(
      display: .flex,
      gap: Gap.all(16.px),
      margin: Spacing.only(bottom: 32.px),
    ),
    css('.btn').styles(
      display: .inlineBlock,
      padding: Spacing.symmetric(horizontal: 24.px, vertical: 12.px),
      radius: .all(.circular(8.px)),
      fontSize: 0.9375.rem,
      fontWeight: .w600,
      textDecoration: .none,
      cursor: .pointer,
      transition: Transition('all', duration: const Duration(milliseconds: 200)),
    ),
    css('.btn-primary').styles(
      backgroundColor: Color('#2563EB'),
      color: Color('#FFFFFF'),
    ),
    css('.btn-primary:hover').styles(
      backgroundColor: Color('#1D4ED8'),
    ),
    css('.btn-outline').styles(
      backgroundColor: Colors.transparent,
      color: Color('#2563EB'),
      border: Border.all(color: Color('#2563EB'), width: 1.5.px),
    ),
    css('.btn-outline:hover').styles(
      backgroundColor: Color('#EFF6FF'),
    ),
    css('.hero-links').styles(
      display: .flex,
      alignItems: .center,
      gap: Gap.all(12.px),
    ),
    css('.social-link').styles(
      fontSize: 0.875.rem,
      color: Color('#64748B'),
      textDecoration: .none,
      transition: Transition('color', duration: const Duration(milliseconds: 200)),
    ),
    css('.social-link:hover').styles(
      color: Color('#2563EB'),
    ),
    css('.social-sep').styles(
      color: Color('#CBD5E1'),
      fontSize: 0.75.rem,
    ),
    css('.hero-stats').styles(
      width: 100.percent,
      maxWidth: 1200.px,
      margin: Spacing.symmetric(horizontal: Unit.auto),
      padding: Spacing.symmetric(horizontal: 40.px, vertical: 48.px),
      display: .grid,
      gap: Gap.all(24.px),
      raw: {'grid-template-columns': 'repeat(4, minmax(0, 1fr))'},
    ),
    css('.stat-card').styles(
      padding: Spacing.all(24.px),
      backgroundColor: Color('#FFFFFF'),
      radius: .all(.circular(12.px)),
      shadow: BoxShadow(offsetX: 0.px, offsetY: 1.px, blur: 4.px, color: Color('rgba(15,23,42,0.06)')),
      display: .flex,
      flexDirection: .column,
      gap: Gap.all(4.px),
    ),
    css('.stat-value').styles(
      fontSize: 2.25.rem,
      fontWeight: .w800,
      color: Color('#2563EB'),
      fontFamily: FontFamily.list(const [FontFamily('Fira Code'), FontFamilies.monospace]),
    ),
    css('.stat-label').styles(
      fontSize: 0.875.rem,
      color: Color('#64748B'),
      fontWeight: .w500,
    ),
    css('.stat-sublabel').styles(
      fontSize: 0.6875.rem,
      color: Color('#94A3B8'),
      fontWeight: .w400,
      margin: Spacing.only(top: 4.px),
    ),
    css.media(MediaQuery.all(maxWidth: 768.px), [
      css('.hero-headline').styles(
        fontSize: 2.25.rem,
      ),
      css('.hero-inner').styles(
        padding: Spacing.only(top: 60.px, left: 20.px, right: 20.px, bottom: 20.px),
      ),
      css('.hero-stats').styles(
        padding: Spacing.symmetric(horizontal: 20.px, vertical: 32.px),
        raw: {'grid-template-columns': 'repeat(2, minmax(0, 1fr))'},
      ),
    ]),
  ];
}
