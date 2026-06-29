import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../models/translation.dart';
import '../models/project_item.dart';
import 'project_card.dart';
import 'side_project_modal.dart';

class SideProjectsSection extends StatefulComponent {
  final String lang;
  const SideProjectsSection({required this.lang, super.key});

  @override
  State<SideProjectsSection> createState() => _SideProjectsSectionState();

  @css
  static final List<StyleRule> styles = _SideProjectsSectionState._styles;
}

class _SideProjectsSectionState extends State<SideProjectsSection> {
  SideProjectItem? _detail;

  void _openDetail(SideProjectItem p) => setState(() => _detail = p);
  void _closeDetail() => setState(() => _detail = null);

  @override
  Component build(BuildContext context) {
    final lang = component.lang;
    return section(classes: 'side-section', [
      div(classes: 'section-inner', [
        div(classes: 'section-header', [
          h2(classes: 'section-title', [.text(AppText.sideTitle(lang))]),
        ]),
        div(classes: 'side-grid', [
          for (final p in sideProjects)
            SideProjectCard(
              project: p,
              lang: lang,
              onSelect: p.hasDetail ? () => _openDetail(p) : null,
            ),
        ]),
      ]),
      if (_detail != null)
        SideProjectModal(
          project: _detail!,
          lang: lang,
          onClose: _closeDetail,
        ),
    ]);
  }

  static final List<StyleRule> _styles = [
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
