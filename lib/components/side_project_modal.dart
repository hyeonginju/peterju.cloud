import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../models/project_item.dart';
import '../models/translation.dart';

class SideProjectModal extends StatefulComponent {
  final SideProjectItem project;
  final String lang;
  final void Function() onClose;

  const SideProjectModal({
    required this.project,
    required this.lang,
    required this.onClose,
    super.key,
  });

  @override
  State<SideProjectModal> createState() => _SideProjectModalState();

  @css
  static final List<StyleRule> styles = _SideProjectModalState._styles;
}

class _SideProjectModalState extends State<SideProjectModal> {
  String? _lightboxSrc;

  void _openLightbox(String src) => setState(() => _lightboxSrc = src);
  void _closeLightbox() => setState(() => _lightboxSrc = null);

  @override
  Component build(BuildContext context) {
    final proj = component.project;
    final lang = component.lang;
    final onClose = component.onClose;
    final paras = lang == 'ko' ? proj.detailParasKo : proj.detailParasEn;
    final tags = proj.modalTags.isNotEmpty ? proj.modalTags : proj.tags;

    return div(
      classes: 'sp-modal-overlay',
      events: {'click': (_) => onClose()},
      [
        div(
          classes: 'sp-modal-card',
          events: {'click': (e) => e.stopPropagation()},
          [
            div(classes: 'sp-modal-scroll', [
              div(classes: 'sp-modal-header', [
                div(classes: 'sp-modal-title-wrap', [
                  span(
                    classes: 'sp-modal-logo ${proj.logoIsKorean ? 'sp-modal-logo--ko' : ''}',
                    attributes: proj.logoColor != null ? {'style': 'color: ${proj.logoColor}'} : {},
                    [.text(proj.logoText ?? proj.name)],
                  ),
                  span(classes: 'sp-modal-name', [.text(proj.name)]),
                ]),
                button(
                  classes: 'sp-modal-close',
                  onClick: onClose,
                  [.text('✕')],
                ),
              ]),
              div(classes: 'sp-modal-tags', [
                for (final tag in tags) span(classes: 'sp-modal-tag', [.text(tag)]),
              ]),
              if (proj.detailImages.isNotEmpty)
                div(classes: 'sp-modal-shots', [
                  for (final shot in proj.detailImages)
                    div(
                      classes: 'sp-shot ${proj.detailImagesAreLandscape ? 'sp-shot--landscape' : ''}',
                      events: {'click': (_) => _openLightbox(shot)},
                      [
                        img(
                          src: shot,
                          classes: 'sp-shot-img',
                          attributes: {'alt': ''},
                        ),
                      ],
                    ),
                ]),
              div(classes: 'sp-modal-body', [
                for (final para in paras) p(classes: 'sp-modal-para', [.text(para)]),
              ]),
              if (proj.url != null)
                div(classes: 'sp-modal-link', [
                  a(
                    href: proj.url!,
                    target: Target.blank,
                    attributes: {'rel': 'noopener noreferrer'},
                    classes: 'visit-btn',
                    [.text(AppText.visitSite(lang))],
                  ),
                ]),
            ]),
          ],
        ),
        if (_lightboxSrc != null)
          div(
            classes: 'lightbox-overlay',
            events: {
              'click': (e) {
                e.stopPropagation();
                _closeLightbox();
              },
            },
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
      ],
    );
  }

  static final List<StyleRule> _styles = [
    css('.sp-modal-overlay').styles(
      position: Position.fixed(top: 0.px, left: 0.px, right: 0.px, bottom: 0.px),
      zIndex: ZIndex(200),
      backgroundColor: Color('rgba(15,23,42,0.6)'),
      backdropFilter: Filter.blur(4.px),
      display: .flex,
      alignItems: .center,
      justifyContent: .center,
      padding: Spacing.all(24.px),
    ),
    css('.sp-modal-card').styles(
      backgroundColor: Color('#FFFFFF'),
      radius: .all(.circular(20.px)),
      maxWidth: 720.px,
      width: 100.percent,
      maxHeight: 88.vh,
      shadow: BoxShadow(offsetX: 0.px, offsetY: 24.px, blur: 64.px, color: Color('rgba(56,189,248,0.25)')),
      border: Border.only(top: BorderSide(color: Color('#38BDF8'), width: 4.px)),
      display: .flex,
      flexDirection: .column,
      overflow: Overflow.hidden,
    ),
    css('.sp-modal-scroll').styles(
      padding: Spacing.all(32.px),
      display: .flex,
      flexDirection: .column,
      gap: Gap.all(16.px),
      raw: {'overflow-y': 'auto', 'min-height': '0'},
    ),
    css('.sp-modal-header').styles(
      display: .flex,
      justifyContent: .spaceBetween,
      alignItems: AlignItems.start,
      gap: Gap.all(12.px),
    ),
    css('.sp-modal-title-wrap').styles(
      display: .flex,
      flexDirection: .column,
      gap: Gap.all(4.px),
    ),
    css('.sp-modal-logo').styles(
      fontSize: 1.5.rem,
      fontWeight: .w900,
      color: Color('#AACC00'),
      letterSpacing: (-0.02).em,
      fontFamily: FontFamily.list(const [FontFamily('Impact'), FontFamilies.sansSerif]),
    ),
    css('.sp-modal-logo--ko').styles(
      fontSize: 1.25.rem,
      fontWeight: .w800,
      fontFamily: .inherit,
    ),
    css('.sp-modal-name').styles(
      fontSize: 0.875.rem,
      fontWeight: .w600,
      color: Color('#64748B'),
    ),
    css('.sp-modal-close').styles(
      fontSize: 1.125.rem,
      color: Color('#94A3B8'),
      cursor: .pointer,
      padding: Spacing.all(4.px),
      transition: Transition('color', duration: const Duration(milliseconds: 150)),
      raw: {'background': 'none', 'border': 'none', 'line-height': '1'},
    ),
    css('.sp-modal-close:hover').styles(
      color: Color('#0F172A'),
    ),
    css('.sp-modal-tags').styles(
      display: .flex,
      flexWrap: .wrap,
      gap: Gap.all(6.px),
    ),
    css('.sp-modal-tag').styles(
      fontSize: 0.75.rem,
      padding: Spacing.symmetric(horizontal: 8.px, vertical: 3.px),
      backgroundColor: Color('#F0F9FF'),
      color: Color('#0284C7'),
      radius: .all(.circular(4.px)),
      fontWeight: .w500,
    ),
    css('.sp-modal-shots').styles(
      display: .flex,
      gap: Gap.all(12.px),
      padding: Spacing.only(bottom: 4.px),
      raw: {
        'overflow-x': 'auto',
        'overflow-y': 'hidden',
        '-webkit-overflow-scrolling': 'touch',
        'flex-shrink': '0',
      },
    ),
    css('.sp-shot').styles(
      width: 200.px,
      height: 420.px,
      overflow: Overflow.hidden,
      radius: .all(.circular(12.px)),
      border: Border.all(color: Color('#E2E8F0'), width: 1.px),
      backgroundColor: Color('#F1F5F9'),
      cursor: .pointer,
      transition: Transition('border-color', duration: const Duration(milliseconds: 150)),
      raw: {'flex-shrink': '0'},
    ),
    css('.sp-shot--landscape').styles(
      width: 420.px,
      height: 260.px,
    ),
    css('.sp-shot:hover').styles(
      border: Border.all(color: Color('#38BDF8'), width: 1.px),
    ),
    css('.sp-shot-img').styles(
      width: 100.percent,
      height: 100.percent,
      display: .block,
      raw: {'object-fit': 'contain', 'object-position': 'center'},
    ),
    css('.sp-modal-body').styles(
      display: .flex,
      flexDirection: .column,
      gap: Gap.all(14.px),
    ),
    css('.sp-modal-link').styles(
      margin: Spacing.only(top: 4.px),
    ),
    css('.sp-modal-para').styles(
      fontSize: 0.9375.rem,
      color: Color('#475569'),
      margin: .zero,
      raw: {'line-height': '1.8'},
    ),
    css.media(MediaQuery.all(maxWidth: 640.px), [
      css('.sp-modal-scroll').styles(
        padding: Spacing.all(24.px),
      ),
      css('.sp-shot').styles(
        width: 160.px,
        height: 336.px,
      ),
      css('.sp-shot--landscape').styles(
        width: 280.px,
        height: 174.px,
      ),
    ]),
  ];
}
