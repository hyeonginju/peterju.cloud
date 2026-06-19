import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../models/translation.dart';
import '../models/project_item.dart';

class ProjectsSection extends StatefulComponent {
  final String lang;
  const ProjectsSection({required this.lang, super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();

  @css
  static final List<StyleRule> styles = [
    css('.projects-section').styles(
      backgroundColor: Color('#F8FAFC'),
      padding: Spacing.symmetric(vertical: 96.px),
    ),
    css('.project-list').styles(
      display: .flex,
      flexDirection: .column,
      gap: Gap.all(12.px),
    ),
    css('.proj-card').styles(
      backgroundColor: Color('#FFFFFF'),
      radius: .all(.circular(12.px)),
      border: Border.all(color: Color('#E2E8F0'), width: 1.px),
      overflow: Overflow.hidden,
      transition: Transition('box-shadow', duration: const Duration(milliseconds: 200)),
    ),
    css('.proj-card:hover').styles(
      shadow: BoxShadow(offsetX: 0.px, offsetY: 4.px, blur: 20.px, color: Color('rgba(37,99,235,0.08)')),
    ),
    css('.proj-card--key').styles(
      border: Border.all(color: Color('#BFDBFE'), width: 1.px),
    ),
    css('.proj-header').styles(
      display: .flex,
      alignItems: .center,
      justifyContent: .spaceBetween,
      padding: Spacing.all(24.px),
      width: 100.percent,
      cursor: .pointer,
      textAlign: .left,
      gap: Gap.all(16.px),
      raw: {'background': 'none', 'border': 'none'},
    ),
    css('.proj-header-left').styles(
      display: .flex,
      alignItems: .center,
      gap: Gap.all(12.px),
    ),
    css('.proj-badge').styles(
      padding: Spacing.symmetric(horizontal: 8.px, vertical: 3.px),
      backgroundColor: Color('#EFF6FF'),
      color: Color('#2563EB'),
      fontSize: 0.6875.rem,
      fontWeight: .w700,
      letterSpacing: 0.06.em,
      radius: .all(.circular(4.px)),
    ),
    css('.proj-titles').styles(
      display: .flex,
      flexDirection: .column,
      gap: Gap.all(2.px),
    ),
    css('.proj-name').styles(
      fontSize: 1.rem,
      fontWeight: .w700,
      color: Color('#0F172A'),
    ),
    css('.proj-period').styles(
      fontSize: 0.8125.rem,
      color: Color('#94A3B8'),
      fontFamily: FontFamily.list(const [FontFamily('Fira Code'), FontFamilies.monospace]),
    ),
    css('.proj-header-right').styles(
      display: .flex,
      alignItems: .center,
      gap: Gap.all(16.px),
    ),
    css('.proj-org').styles(
      fontSize: 0.8125.rem,
      color: Color('#64748B'),
    ),
    css('.proj-arrow').styles(
      fontSize: 0.875.rem,
      color: Color('#94A3B8'),
      transition: Transition('transform', duration: const Duration(milliseconds: 200)),
    ),
    css('.proj-arrow.open').styles(
      transform: Transform.rotate(180.deg),
    ),
    css('.proj-body').styles(
      padding: Spacing.only(left: 24.px, right: 24.px, bottom: 24.px),
      border: Border.only(
        top: BorderSide(color: Color('#F1F5F9'), width: 1.px),
      ),
    ),
    css('.proj-images').styles(
      display: .flex,
      gap: Gap.all(10.px),
      margin: Spacing.only(bottom: 16.px),
      raw: {
        'overflow-x': 'auto',
        'overflow-y': 'hidden',
        '-webkit-overflow-scrolling': 'touch',
      },
    ),
    css('.proj-img-thumb').styles(
      overflow: Overflow.hidden,
      radius: .all(.circular(6.px)),
      border: Border.all(color: Color('#E2E8F0'), width: 1.px),
      backgroundColor: Color('#F1F5F9'),
      cursor: .pointer,
      raw: {'flex-shrink': '0'},
      transition: Transition('border-color', duration: const Duration(milliseconds: 150)),
    ),
    css('.proj-img-thumb--landscape').styles(
      width: 320.px,
      height: 200.px,
    ),
    css('.proj-img-thumb--portrait').styles(
      width: 180.px,
      height: 350.px,
    ),
    css('.proj-img-thumb:hover').styles(
      border: Border.all(color: Color('#2563EB'), width: 1.px),
    ),
    css('.proj-thumb-img').styles(
      width: 100.percent,
      height: 100.percent,
      display: .block,
      raw: {'object-fit': 'cover', 'object-position': 'top center'},
    ),
    css('.lightbox-overlay').styles(
      position: Position.fixed(top: 0.px, left: 0.px, right: 0.px, bottom: 0.px),
      zIndex: ZIndex(2000),
      backgroundColor: Color('rgba(0, 0, 0, 0.88)'),
      display: .flex,
      alignItems: .center,
      justifyContent: .center,
    ),
    css('.lightbox-img').styles(
      maxWidth: 90.vw,
      maxHeight: 90.vh,
      radius: .all(.circular(8.px)),
      display: .block,
      raw: {'object-fit': 'contain'},
    ),
    css('.lightbox-close').styles(
      position: Position.absolute(top: 20.px, right: 20.px),
      width: 40.px,
      height: 40.px,
      radius: .all(.circular(20.px)),
      display: .flex,
      alignItems: .center,
      justifyContent: .center,
      fontSize: 1.375.rem,
      color: Color('#FFFFFF'),
      cursor: .pointer,
      raw: {'background': 'rgba(255,255,255,0.18)', 'line-height': '1', 'user-select': 'none'},
    ),
    css('.proj-meta').styles(
      display: .flex,
      flexDirection: .column,
      gap: Gap.all(8.px),
      padding: Spacing.symmetric(vertical: 16.px),
      margin: Spacing.only(bottom: 16.px),
      border: Border.only(
        bottom: BorderSide(color: Color('#F1F5F9'), width: 1.px),
      ),
    ),
    css('.meta-row').styles(
      display: .flex,
      gap: Gap.all(12.px),
      fontSize: 0.8125.rem,
    ),
    css('.meta-label').styles(
      color: Color('#94A3B8'),
      fontWeight: .w600,
      minWidth: 100.px,
      raw: {'flex-shrink': '0'},
    ),
    css('.meta-value').styles(
      color: Color('#475569'),
    ),
    css('.proj-details').styles(
      display: .flex,
      flexDirection: .column,
      gap: Gap.all(16.px),
      margin: Spacing.only(bottom: 20.px),
    ),
    css('.detail-block').styles(
      display: .flex,
      gap: Gap.all(12.px),
    ),
    css('.detail-icon').styles(
      fontSize: 1.rem,
      margin: Spacing.only(top: 1.px),
      raw: {'flex-shrink': '0'},
    ),
    css('.detail-content').styles(
      display: .flex,
      flexDirection: .column,
      gap: Gap.all(4.px),
    ),
    css('.detail-label').styles(
      fontSize: 0.75.rem,
      fontWeight: .w700,
      color: Color('#94A3B8'),
      letterSpacing: 0.05.em,
      textTransform: TextTransform.upperCase,
    ),
    css('.detail-text').styles(
      fontSize: 0.9375.rem,
      color: Color('#475569'),
      margin: .zero,
      raw: {'line-height': '1.7'},
    ),
    css('.proj-impact').styles(
      display: .flex,
      flexDirection: .column,
      gap: Gap.all(6.px),
      padding: Spacing.all(16.px),
      backgroundColor: Color('#EFF6FF'),
      radius: .all(.circular(8.px)),
      border: Border.only(
        left: BorderSide(color: Color('#2563EB'), width: 3.px),
      ),
    ),
    css('.impact-label').styles(
      fontSize: 0.75.rem,
      fontWeight: .w700,
      color: Color('#2563EB'),
      letterSpacing: 0.05.em,
      textTransform: TextTransform.upperCase,
    ),
    css('.impact-text').styles(
      fontSize: 0.9375.rem,
      fontWeight: .w600,
      color: Color('#1E40AF'),
    ),
    css.media(MediaQuery.all(maxWidth: 768.px), [
      css('.proj-header').styles(
        flexDirection: .column,
        alignItems: AlignItems.start,
      ),
      css('.proj-header-right').styles(
        justifyContent: .spaceBetween,
        width: 100.percent,
      ),
    ]),
  ];
}

class _ProjectsSectionState extends State<ProjectsSection> {
  int? _expanded;
  String? _lightboxSrc;

  void _openLightbox(String src) => setState(() => _lightboxSrc = src);
  void _closeLightbox() => setState(() => _lightboxSrc = null);

  @override
  Component build(BuildContext context) {
    final keyProjects = allProjects.where((proj) => proj.isKey).toList();
    final addlProjects = allProjects.where((proj) => !proj.isKey).toList();
    final lang = component.lang;

    return section(id: 'projects', classes: 'projects-section', [
      div(classes: 'section-inner', [
        div(classes: 'section-header', [
          h2(classes: 'section-title', [.text(AppText.projectsTitle(lang))]),
        ]),
        div(classes: 'project-list', [
          for (int i = 0; i < keyProjects.length; i++) _buildCard(keyProjects[i], i, lang, true),
        ]),
        div(
          classes: 'section-header',
          attributes: {'style': 'margin-top: 64px;'},
          [
            h2(classes: 'section-title', [.text(AppText.additionalTitle(lang))]),
          ],
        ),
        div(classes: 'project-list project-list--addl', [
          for (int i = 0; i < addlProjects.length; i++)
            _buildCard(addlProjects[i], keyProjects.length + i, lang, false),
        ]),
      ]),
      if (_lightboxSrc != null)
        div(
          classes: 'lightbox-overlay',
          events: {'click': (_) => _closeLightbox()},
          [
            img(
              src: _lightboxSrc!,
              classes: 'lightbox-img',
              attributes: {'alt': ''},
            ),
            div(
              classes: 'lightbox-close',
              events: {'click': (_) => _closeLightbox()},
              [.text('×')],
            ),
          ],
        ),
    ]);
  }

  Component _buildCard(ProjectItem p, int idx, String lang, bool isKey) {
    final isOpen = _expanded == idx;
    return div(
      classes: 'proj-card ${isKey ? 'proj-card--key' : ''} ${isOpen ? 'proj-card--open' : ''}',
      [
        button(
          classes: 'proj-header',
          onClick: () => setState(() => _expanded = isOpen ? null : idx),
          [
            div(classes: 'proj-header-left', [
              if (isKey) span(classes: 'proj-badge', [.text('KEY')]),
              div(classes: 'proj-titles', [
                span(classes: 'proj-name', [.text(lang == 'ko' ? p.titleKo : p.titleEn)]),
                span(classes: 'proj-period', [.text(p.period)]),
              ]),
            ]),
            div(classes: 'proj-header-right', [
              span(classes: 'proj-org', [.text(lang == 'ko' ? p.orgKo : p.orgEn)]),
              span(classes: 'proj-arrow ${isOpen ? 'open' : ''}', [.text('↓')]),
            ]),
          ],
        ),
        if (isOpen)
          div(classes: 'proj-body', [
            div(classes: 'proj-meta', [
              _metaRow(AppText.projectStack(lang), p.stackStr),
              _metaRow(AppText.projectRole(lang), lang == 'ko' ? p.roleKo : p.roleEn),
            ]),
            if (p.images.isNotEmpty)
              div(classes: 'proj-images', [
                for (final imgSrc in p.images)
                  div(
                    classes:
                        'proj-img-thumb ${p.imagesArePortrait ? 'proj-img-thumb--portrait' : 'proj-img-thumb--landscape'}',
                    events: {'click': (_) => _openLightbox(imgSrc)},
                    [
                      img(
                        src: imgSrc,
                        classes: 'proj-thumb-img',
                        attributes: {'alt': '', 'loading': 'lazy'},
                      ),
                    ],
                  ),
              ]),
            div(classes: 'proj-details', [
              _detailBlock('🔍', AppText.projectProblem(lang), lang == 'ko' ? p.problemKo : p.problemEn),
              _detailBlock('⚡', AppText.projectAction(lang), lang == 'ko' ? p.actionKo : p.actionEn),
              _detailBlock('✅', AppText.projectResult(lang), lang == 'ko' ? p.resultKo : p.resultEn),
            ]),
            div(classes: 'proj-impact', [
              span(classes: 'impact-label', [.text(AppText.projectImpact(lang))]),
              span(classes: 'impact-text', [
                .text(lang == 'ko' ? p.impactKo : p.impactEn),
              ]),
            ]),
          ]),
      ],
    );
  }

  Component _metaRow(String label, String value) {
    return div(classes: 'meta-row', [
      span(classes: 'meta-label', [.text(label)]),
      span(classes: 'meta-value', [.text(value)]),
    ]);
  }

  Component _detailBlock(String icon, String label, String text) {
    return div(classes: 'detail-block', [
      span(classes: 'detail-icon', [.text(icon)]),
      div(classes: 'detail-content', [
        span(classes: 'detail-label', [.text(label)]),
        p(classes: 'detail-text', [.text(text)]),
      ]),
    ]);
  }
}
