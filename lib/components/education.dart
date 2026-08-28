import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../models/translation.dart';

class _EduItem {
  final String year;
  final String titleKo;
  final String titleEn;
  final bool isExpected;

  const _EduItem({
    required this.year,
    required this.titleKo,
    required this.titleEn,
    this.isExpected = false,
  });
}

const _eduItems = [
  _EduItem(
    year: '2026.12',
    titleKo: '컴퓨터공학 학사 학위 — 학점은행제',
    titleEn: 'B.S. Computer Science — Credit Bank System',
    isExpected: true,
  ),
  _EduItem(
    year: '2023.11',
    titleKo: '네트워크관리사 2급 — 한국정보통신자격협회',
    titleEn: 'Network Administrator Level 2 — KICQA',
  ),
  _EduItem(
    year: '2021.03 — 2021.07',
    titleKo: '항해99 (스파르타코딩클럽) — 소프트웨어 엔지니어링 부트캠프',
    titleEn: 'Hanghai99 (Sparta Coding Club) — Software Engineering Bootcamp',
  ),
  _EduItem(
    year: '2020.11 — 2021.02',
    titleKo: '42 Seoul (이노베이션 아카데미) — P2P 소프트웨어 엔지니어링',
    titleEn: '42 Seoul (Innovation Academy) — Peer-to-Peer Software Engineering',
  ),
  _EduItem(
    year: '2016 — 2019',
    titleKo: '공주대학교 정보통신공학과 (중퇴)',
    titleEn: 'Kongju National Univ., Information & Communication Engineering (Withdrew)',
  ),
];

class EducationSection extends StatelessComponent {
  final String lang;
  const EducationSection({required this.lang, super.key});

  @override
  Component build(BuildContext context) {
    return section(classes: 'edu-section', [
      div(classes: 'section-inner', [
        div(classes: 'section-header', [
          h2(classes: 'section-title', [.text(AppText.eduTitle(lang))]),
        ]),
        div(classes: 'edu-list', [
          for (final item in _eduItems) _buildItem(item, lang),
        ]),
      ]),
    ]);
  }

  Component _buildItem(_EduItem item, String lang) {
    return div(classes: 'edu-item', [
      span(classes: 'edu-year', [.text(item.year)]),
      div(classes: 'edu-content', [
        span(classes: 'edu-title', [
          .text(lang == 'ko' ? item.titleKo : item.titleEn),
        ]),
        if (item.isExpected)
          span(classes: 'edu-badge', [
            .text(AppText.eduExpected(lang)),
          ]),
      ]),
    ]);
  }

  @css
  static final List<StyleRule> styles = [
    css('.edu-section').styles(
      backgroundColor: Color('#FFFFFF'),
      padding: Spacing.symmetric(vertical: 80.px),
    ),
    css('.edu-list').styles(
      display: .flex,
      flexDirection: .column,
    ),
    css('.edu-item').styles(
      display: .flex,
      gap: Gap.all(32.px),
      padding: Spacing.symmetric(vertical: 20.px),
      border: Border.only(bottom: BorderSide(color: Color('#F1F5F9'), width: 1.px)),
    ),
    css('.edu-item:last-child').styles(
      raw: {'border-bottom': 'none'},
    ),
    css('.edu-year').styles(
      fontSize: 0.8125.rem,
      color: Color('#94A3B8'),
      fontFamily: FontFamily.list(const [FontFamily('Fira Code'), FontFamilies.monospace]),
      minWidth: 160.px,
      padding: Spacing.only(top: 2.px),
      raw: {'flex-shrink': '0'},
    ),
    css('.edu-content').styles(
      display: .flex,
      alignItems: .center,
      gap: Gap.all(10.px),
      flexWrap: .wrap,
    ),
    css('.edu-title').styles(
      fontSize: 0.9375.rem,
      color: Color('#0F172A'),
      fontWeight: .w500,
    ),
    css('.edu-badge').styles(
      fontSize: 0.6875.rem,
      fontWeight: .w600,
      color: Color('#0EA5E9'),
      backgroundColor: Color('#E0F2FE'),
      padding: Spacing.symmetric(horizontal: 8.px, vertical: 3.px),
      radius: .all(.circular(4.px)),
    ),
    css.media(MediaQuery.all(maxWidth: 640.px), [
      css('.edu-item').styles(
        flexDirection: .column,
        gap: Gap.all(6.px),
      ),
      css('.edu-year').styles(
        minWidth: Unit.auto,
      ),
      css('.edu-section').styles(
        padding: Spacing.symmetric(vertical: 64.px),
      ),
    ]),
  ];
}
