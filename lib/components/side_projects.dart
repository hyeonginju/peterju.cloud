import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../models/translation.dart';
import '../models/project_item.dart';
import 'project_card.dart';

class SideProjectsSection extends StatelessComponent {
  final String lang;
  const SideProjectsSection({required this.lang, super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'side-section', [
      div(classes: 'section-inner', [
        div(classes: 'section-header', [
          h2(classes: 'section-title', [.text(AppText.sideTitle(lang))]),
        ]),
        div(classes: 'side-grid', [
          for (final p in sideProjects)
            SideProjectCard(project: p, lang: lang),
        ]),
      ]),
    ]);
  }

  @css
  static final List<StyleRule> styles = [
    css('.side-section').styles(
      backgroundColor: Color('#FFFFFF'),
      padding: Spacing.symmetric(vertical: 96.px),
    ),
    css('.side-grid').styles(
      display: .grid,
      gap: Gap.all(24.px),
      raw: {'grid-template-columns': 'repeat(3, 1fr)'},
    ),
    css.media(MediaQuery.all(maxWidth: 1024.px), [
      css('.side-grid').styles(
        raw: {'grid-template-columns': 'repeat(2, 1fr)'},
      ),
    ]),
    css.media(MediaQuery.all(maxWidth: 768.px), [
      css('.side-grid').styles(
        raw: {'grid-template-columns': '1fr'},
      ),
      css('.side-section').styles(
        padding: Spacing.symmetric(vertical: 64.px),
      ),
    ]),
  ];
}
