import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../models/quote.dart';

class QuoteModal extends StatelessComponent {
  final BookQuote quote;
  final void Function() onClose;

  const QuoteModal({
    required this.quote,
    required this.onClose,
    super.key,
  });

  @override
  Component build(BuildContext context) {
    return div(
      classes: 'modal-overlay',
      events: {'click': (_) => onClose()},
      [
        div(
          classes: 'modal-card',
          events: {
            'click': (e) {
              // Prevent overlay click from propagating
            },
          },
          [
            div(classes: 'modal-header', [
              button(
                classes: 'modal-close',
                onClick: onClose,
                [.text('✕')],
              ),
            ]),
            p(classes: 'modal-quote-text', [
              .text(quote.textKo),
            ]),
            div(classes: 'modal-divider', []),
            span(classes: 'modal-source-value', [.text(quote.source)]),
          ],
        ),
      ],
    );
  }

  @css
  static final List<StyleRule> styles = [
    css('.modal-overlay').styles(
      position: Position.fixed(top: 0.px, left: 0.px, right: 0.px, bottom: 0.px),
      zIndex: ZIndex(200),
      backgroundColor: Color('rgba(15,23,42,0.6)'),
      backdropFilter: Filter.blur(4.px),
      display: .flex,
      alignItems: .center,
      justifyContent: .center,
      padding: Spacing.all(24.px),
    ),
    css('.modal-card').styles(
      backgroundColor: Color('#FFFFFF'),
      radius: .all(.circular(20.px)),
      padding: Spacing.all(40.px),
      maxWidth: 540.px,
      width: 100.percent,
      shadow: BoxShadow(offsetX: 0.px, offsetY: 24.px, blur: 64.px, color: Color('rgba(37,99,235,0.2)')),
      border: Border.only(top: BorderSide(color: Color('#2563EB'), width: 4.px)),
    ),
    css('.modal-header').styles(
      display: .flex,
      justifyContent: .end,
      alignItems: .center,
      margin: Spacing.only(bottom: 16.px),
    ),
    css('.modal-close').styles(
      fontSize: 1.125.rem,
      color: Color('#94A3B8'),
      cursor: .pointer,
      padding: Spacing.all(4.px),
      transition: Transition('color', duration: const Duration(milliseconds: 150)),
      raw: {'background': 'none', 'border': 'none', 'line-height': '1'},
    ),
    css('.modal-close:hover').styles(
      color: Color('#0F172A'),
    ),
    css('.modal-quote-text').styles(
      fontSize: 1.375.rem,
      fontWeight: .w600,
      color: Color('#0F172A'),
      margin: Spacing.only(bottom: 28.px),
      raw: {'line-height': '1.7'},
    ),
    css('.modal-divider').styles(
      height: 1.px,
      backgroundColor: Color('#E2E8F0'),
      margin: Spacing.only(bottom: 16.px),
    ),
    css('.modal-source-value').styles(
      fontSize: 0.9375.rem,
      color: Color('#64748B'),
      fontStyle: FontStyle.italic,
    ),
    css.media(MediaQuery.all(maxWidth: 640.px), [
      css('.modal-card').styles(
        padding: Spacing.all(24.px),
      ),
      css('.modal-quote-text').styles(
        fontSize: 1.125.rem,
      ),
    ]),
  ];
}
