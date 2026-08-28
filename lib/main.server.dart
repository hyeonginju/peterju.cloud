library;

import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';

import 'app.dart';
import 'main.server.options.dart';

void main() {
  Jaspr.initializeApp(options: defaultServerOptions);

  runApp(Document(
    title: 'Ju Hyeongin | Software Engineer',
    head: [
      RawText('<link rel="icon" type="image/x-icon" href="/favicon.ico">'),
      RawText('<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">'),
      RawText('<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">'),
      RawText('<link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">'),
      RawText('<link rel="manifest" href="/site.webmanifest">'),
      RawText('<link rel="preconnect" href="https://fonts.googleapis.com">'),
      RawText('<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">'),
      RawText('<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700;800&family=Fira+Code:wght@400;500&display=swap">'),
      RawText('<script src="https://cdnjs.cloudflare.com/ajax/libs/matter-js/0.19.0/matter.min.js"></script>'),
      RawText('<script src="physics.js" defer></script>'),
      RawText('<meta name="viewport" content="width=device-width, initial-scale=1">'),
      RawText('<meta name="description" content="Portfolio of Ju Hyeongin — Software Engineer. Flutter multiplatform apps, AI agents, and backend/infra built end to end.">'),
    ],
    styles: [
      css('*, *::before, *::after').styles(
        boxSizing: .borderBox,
      ),
      css('html').styles(
        fontSize: 16.px,
        raw: {'scroll-behavior': 'smooth'},
      ),
      css('html, body').styles(
        margin: .zero,
        padding: .zero,
        width: 100.percent,
        fontFamily: const .list([
          FontFamily('Noto Sans KR'),
          FontFamilies.sansSerif,
        ]),
        color: const Color('#0F172A'),
        backgroundColor: const Color('#F8FAFC'),
        raw: {'line-height': '1.6'},
      ),
      css('h1, h2, h3, h4, h5, h6').styles(
        margin: .zero,
        raw: {'line-height': '1.2'},
      ),
      css('a').styles(
        color: .inherit,
      ),
      css('button').styles(
        fontFamily: .inherit,
      ),
      css('section, footer').styles(
        raw: {'scroll-margin-top': '80px'},
      ),
    ],
    body: const App(),
  ));
}
