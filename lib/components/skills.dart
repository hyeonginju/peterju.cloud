import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../models/translation.dart';

class SkillsSection extends StatelessComponent {
  final String lang;

  const SkillsSection({required this.lang, super.key});

  static const _languages = ['Dart', 'JavaScript'];
  static const _frameworks = [
    'Flutter',
    'BLoC',
    'Provider',
    'Riverpod',
    'goRouter',
    'React Native',
    'Redux',
  ];
  static const _platforms = ['Android', 'iOS', 'Web', 'Windows'];
  static const _tools = [
    'OpenAI API',
    'Claude',
    'Gemini',
    'Codex',
    'socket.io',
    'Git',
    'Firebase',
    'GCP',
    'Figma',
    'Slack',
    'Redmine',
  ];

  @override
  Component build(BuildContext context) {
    return section(id: 'skills', classes: 'skills-section', [
      div(classes: 'section-inner', [
        div(classes: 'section-header', [
          h2(classes: 'section-title', [.text(AppText.skillsTitle(lang))]),
        ]),
        div(classes: 'skills-grid', [
          _category(AppText.skillsLanguages(lang), _languages, 'primary'),
          _category(AppText.skillsFrameworks(lang), _frameworks, 'secondary'),
          _category(AppText.skillsPlatforms(lang), _platforms, 'primary'),
          _category(AppText.skillsTools(lang), _tools, 'secondary'),
        ]),
      ]),
    ]);
  }

  Component _category(String title, List<String> items, String variant) {
    return div(classes: 'skill-category', [
      span(classes: 'skill-cat-title', [.text(title)]),
      div(classes: 'chip-wrap', [
        for (final item in items) span(classes: 'skill-chip skill-chip--$variant', [.text(item)]),
      ]),
    ]);
  }

  @css
  static final List<StyleRule> styles = [
    css('.skills-section').styles(
      backgroundColor: Color('#FFFFFF'),
      padding: Spacing.symmetric(vertical: 96.px),
    ),
    css('.section-inner').styles(
      maxWidth: 1200.px,
      margin: Spacing.symmetric(horizontal: Unit.auto),
      padding: Spacing.symmetric(horizontal: 40.px),
    ),
    css('.section-header').styles(
      margin: Spacing.only(bottom: 56.px),
    ),
    css('.section-title').styles(
      fontSize: 2.rem,
      fontWeight: .w800,
      color: Color('#0F172A'),
      letterSpacing: (-0.02).em,
      position: Position.relative(),
      display: .inlineBlock,
    ),
    css('.section-title::after').styles(
      content: '""',
      position: Position.absolute(bottom: (-6).px, left: 0.px),
      width: 48.px,
      height: 4.px,
      backgroundColor: Color('#2563EB'),
      radius: .all(.circular(2.px)),
    ),
    css('.skills-grid').styles(
      display: .grid,
      gap: Gap.all(24.px),
      raw: {'grid-template-columns': 'repeat(2, 1fr)'},
    ),
    css('.skill-category').styles(
      backgroundColor: Color('#F8FAFC'),
      padding: Spacing.all(28.px),
      radius: .all(.circular(12.px)),
      border: Border.all(color: Color('#E2E8F0'), width: 1.px),
    ),
    css('.skill-cat-title').styles(
      display: .block,
      fontSize: 0.75.rem,
      fontWeight: .w700,
      color: Color('#000000'),
      letterSpacing: 0.08.em,
      textTransform: TextTransform.upperCase,
      margin: Spacing.only(bottom: 16.px),
    ),
    css('.chip-wrap').styles(
      display: .flex,
      flexWrap: .wrap,
      gap: Gap.all(8.px),
    ),
    css('.skill-chip').styles(
      padding: Spacing.symmetric(horizontal: 12.px, vertical: 6.px),
      radius: .all(.circular(6.px)),
      fontSize: 0.8125.rem,
      fontWeight: .w500,
    ),
    css('.skill-chip--primary').styles(
      backgroundColor: Color('#EFF6FF'),
      color: Color('#2563EB'),
    ),
    css('.skill-chip--secondary').styles(
      backgroundColor: Color('#F1F5F9'),
      color: Color('#475569'),
    ),
    css.media(MediaQuery.all(maxWidth: 768.px), [
      css('.skills-grid').styles(
        raw: {'grid-template-columns': '1fr'},
      ),
      css('.section-inner').styles(
        padding: Spacing.symmetric(horizontal: 20.px),
      ),
      css('.skills-section').styles(
        padding: Spacing.symmetric(vertical: 64.px),
      ),
    ]),
  ];
}
