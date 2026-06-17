import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../models/translation.dart';

class SiteFooter extends StatelessComponent {
  final String lang;
  const SiteFooter({required this.lang, super.key});

  @override
  Component build(BuildContext context) {
    return footer(classes: 'site-footer', [
      div(classes: 'footer-inner', [
        div(classes: 'footer-left', [
          span(classes: 'footer-name', [.text('Hyeongin JU')]),
          span(classes: 'footer-built', [.text(AppText.footerBuilt(lang))]),
        ]),
        div(classes: 'footer-right', [
          a(
            href: 'https://github.com/hyeonginju',
            target: Target.blank,
            attributes: {'rel': 'noopener noreferrer'},
            classes: 'footer-link',
            [.text('GitHub')],
          ),
          a(
            href: 'https://velog.io/@guddls64',
            target: Target.blank,
            attributes: {'rel': 'noopener noreferrer'},
            classes: 'footer-link',
            [.text('Blog')],
          ),
          a(
            href: 'mailto:guddls654@gmail.com',
            classes: 'footer-link',
            [.text('Email')],
          ),
        ]),
      ]),
      div(classes: 'footer-copy', [
        .text('© ${DateTime.now().year} Ju Hyeongin. ${AppText.footerCopy(lang)}.'),
      ]),
    ]);
  }

  @css
  static final List<StyleRule> styles = [
    css('.site-footer').styles(
      backgroundColor: Color('#0F172A'),
      padding: Spacing.symmetric(vertical: 40.px),
    ),
    css('.footer-inner').styles(
      maxWidth: 1200.px,
      margin: Spacing.only(top: 0.px, right: Unit.auto, bottom: 24.px, left: Unit.auto),
      padding: Spacing.symmetric(horizontal: 40.px),
      display: .flex,
      justifyContent: .spaceBetween,
      alignItems: .center,
      flexWrap: .wrap,
      gap: Gap.all(16.px),
    ),
    css('.footer-left').styles(
      display: .flex,
      flexDirection: .column,
      gap: Gap.all(4.px),
    ),
    css('.footer-name').styles(
      fontSize: 1.rem,
      fontWeight: .w700,
      color: Color('#FFFFFF'),
    ),
    css('.footer-built').styles(
      fontSize: 0.8125.rem,
      color: Color('#64748B'),
    ),
    css('.footer-right').styles(
      display: .flex,
      gap: Gap.all(24.px),
    ),
    css('.footer-link').styles(
      fontSize: 0.875.rem,
      color: Color('#94A3B8'),
      textDecoration: .none,
      transition: Transition('color', duration: const Duration(milliseconds: 150)),
    ),
    css('.footer-link:hover').styles(
      color: Color('#FFFFFF'),
    ),
    css('.footer-copy').styles(
      maxWidth: 1200.px,
      margin: Spacing.symmetric(horizontal: Unit.auto),
      padding: Spacing.only(left: 40.px, right: 40.px, top: 20.px),
      fontSize: 0.8125.rem,
      color: Color('#475569'),
      border: Border.only(
        top: BorderSide(color: Color('#1E293B'), width: 1.px),
      ),
    ),
    css.media(MediaQuery.all(maxWidth: 640.px), [
      css('.footer-inner').styles(
        flexDirection: .column,
        alignItems: AlignItems.start,
        padding: Spacing.symmetric(horizontal: 20.px),
      ),
      css('.footer-copy').styles(
        padding: Spacing.only(left: 20.px, right: 20.px, top: 20.px),
      ),
    ]),
  ];
}
