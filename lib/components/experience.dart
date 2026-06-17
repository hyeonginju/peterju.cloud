import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../models/translation.dart';

class _ExpItem {
  final String company;
  final String companyEn;
  final String role;
  final String roleEn;
  final String period;
  final List<String> pointsKo;
  final List<String> pointsEn;

  const _ExpItem({
    required this.company,
    required this.companyEn,
    required this.role,
    required this.roleEn,
    required this.period,
    required this.pointsKo,
    required this.pointsEn,
  });
}

const _experience = [
  _ExpItem(
    company: '주식회사 디에이블',
    companyEn: 'Dable Inc.',
    role: 'IT 개발팀 / 프로젝트 리드',
    roleEn: 'IT Dev Team / Project Lead',
    period: '2023.01 — 2025.03',
    pointsKo: [
      '총 5개의 앱/웹 프로젝트 아키텍처 수립 및 릴리즈 주도',
      'React Native → Flutter 기술 스택 전환 제안 및 완수',
      '다수의 프로젝트 팀 리드 및 기획&디자인 팀과 협업 주도',
      '서비스 도입 업체 및 의료 현장 방문, 실사용자 피드백 수집',
    ],
    pointsEn: [
      'Led architecture and release of 5 app/web projects',
      'Proposed and completed React Native → Flutter tech stack migration',
      'Led multiple project teams and drove cross-collaboration with planning & design',
      'Visited client sites and medical facilities for user feedback collection',
    ],
  ),
  _ExpItem(
    company: '아이콘루프',
    companyEn: 'ICONLOOP',
    role: '사내 앱 기획 및 아이디에이션',
    roleEn: 'In-house App Planning & Ideation',
    period: '2022.03 — 2022.06',
    pointsKo: [
      '블록체인 기반 서비스 제품 비전 수립 및 기능 기획 협업',
      '개발-기획 부서 간 크로스 기능적 조율을 통한 프로덕트 오너십 경험',
    ],
    pointsEn: [
      'Established product vision and collaborated on feature planning for blockchain-based services',
      'Gained product ownership experience through cross-functional coordination between dev and planning',
    ],
  ),
  _ExpItem(
    company: '휴비스',
    companyEn: 'Huvis',
    role: '신소재 플라스틱 생산 및 인원 관리',
    roleEn: 'Plastics Production & Personnel Management',
    period: '2019.12 — 2021.01',
    pointsKo: [
      '플라스틱 공정 최전선에서 제품 생산, 적재 흐름 통제 및 현장 인원 관리',
      '아날로그 제조 현장의 비효율을 온몸으로 경험하며 소프트웨어 엔지니어로 전향',
    ],
    pointsEn: [
      'Managed product production, loading flow control, and on-site personnel in plastics processing',
      'Experienced firsthand the inefficiencies of analog manufacturing, pivoting to software engineering',
    ],
  ),
];

const _overseas = [
  _ExpItem(
    company: '캐나다 워킹홀리데이',
    companyEn: 'Canada Working Holiday',
    role: '글로벌 역량 강화',
    roleEn: 'Global Competency Development',
    period: '2025.04 — 2026.05',
    pointsKo: [
      '서비스업 및 현장직 근무를 통한 실전 비즈니스 소통 역량 강화',
      '1년 캐나다 체류로 글로벌 커뮤니케이션 및 문제 해결 능력 배양',
    ],
    pointsEn: [
      'Strengthened real-world business communication through service and field work',
      'Developed global communication and problem-solving skills through 1-year Canadian residency',
    ],
  ),
];

class ExperienceSection extends StatelessComponent {
  final String lang;
  const ExperienceSection({required this.lang, super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'experience', classes: 'exp-section', [
      div(classes: 'section-inner', [
        div(classes: 'section-header', [
          h2(classes: 'section-title', [.text(AppText.expTitle(lang))]),
        ]),
        div(classes: 'exp-timeline', [
          for (final item in _experience) _buildItem(item, lang),
        ]),
        div(classes: 'section-header overseas-header', [
          h2(classes: 'section-title', [.text(AppText.overseasTitle(lang))]),
        ]),
        div(classes: 'exp-timeline', [
          for (final item in _overseas) _buildItem(item, lang),
        ]),
      ]),
    ]);
  }

  Component _buildItem(_ExpItem item, String lang) {
    final points = lang == 'ko' ? item.pointsKo : item.pointsEn;
    return div(classes: 'exp-item', [
      div(classes: 'exp-dot', []),
      div(classes: 'exp-content', [
        div(classes: 'exp-header', [
          div(classes: 'exp-company-wrap', [
            span(classes: 'exp-company', [
              .text(lang == 'ko' ? item.company : item.companyEn),
            ]),
            span(classes: 'exp-role', [
              .text(lang == 'ko' ? item.role : item.roleEn),
            ]),
          ]),
          span(classes: 'exp-period', [.text(item.period)]),
        ]),
        ul(classes: 'exp-points', [
          for (final point in points)
            li(classes: 'exp-point', [.text(point)]),
        ]),
      ]),
    ]);
  }

  @css
  static final List<StyleRule> styles = [
    css('.exp-section').styles(
      backgroundColor: Color('#F8FAFC'),
      padding: Spacing.symmetric(vertical: 96.px),
    ),
    css('.exp-timeline').styles(
      position: Position.relative(),
      display: .flex,
      flexDirection: .column,
    ),
    css('.exp-timeline::before').styles(
      content: '""',
      position: Position.absolute(left: 7.px, top: 8.px, bottom: 0.px),
      width: 2.px,
      backgroundColor: Color('#E2E8F0'),
    ),
    css('.exp-item').styles(
      display: .flex,
      gap: Gap.all(24.px),
      padding: Spacing.only(bottom: 40.px),
      position: Position.relative(),
    ),
    css('.exp-dot').styles(
      width: 16.px,
      height: 16.px,
      radius: .all(.circular(8.px)),
      backgroundColor: Color('#2563EB'),
      margin: Spacing.only(top: 4.px),
      zIndex: ZIndex(1),
      shadow: BoxShadow(offsetX: 0.px, offsetY: 0.px, blur: 0.px, spread: 4.px, color: Color('#EFF6FF')),
      raw: {'flex-shrink': '0'},
    ),
    css('.exp-content').styles(
      flex: Flex(grow: 1),
    ),
    css('.exp-header').styles(
      display: .flex,
      justifyContent: .spaceBetween,
      alignItems: AlignItems.start,
      margin: Spacing.only(bottom: 12.px),
      gap: Gap.all(16.px),
    ),
    css('.exp-company-wrap').styles(
      display: .flex,
      flexDirection: .column,
      gap: Gap.all(2.px),
    ),
    css('.exp-company').styles(
      fontSize: 1.0625.rem,
      fontWeight: .w700,
      color: Color('#0F172A'),
    ),
    css('.exp-role').styles(
      fontSize: 0.875.rem,
      color: Color('#2563EB'),
      fontWeight: .w500,
    ),
    css('.exp-period').styles(
      fontSize: 0.8125.rem,
      color: Color('#94A3B8'),
      fontFamily: FontFamily.list(const [FontFamily('Fira Code'), FontFamilies.monospace]),
      whiteSpace: WhiteSpace.noWrap,
      raw: {'flex-shrink': '0'},
    ),
    css('.exp-points').styles(
      margin: .zero,
      display: .flex,
      flexDirection: .column,
      gap: Gap.all(6.px),
      raw: {'list-style-type': 'none', 'padding-left': '0'},
    ),
    css('.exp-point').styles(
      fontSize: 0.9375.rem,
      color: Color('#475569'),
      padding: Spacing.only(left: 16.px),
      position: Position.relative(),
      raw: {'line-height': '1.7'},
    ),
    css('.exp-point::before').styles(
      content: '"—"',
      position: Position.absolute(left: 0.px),
      color: Color('#CBD5E1'),
    ),
    css('.overseas-header').styles(
      margin: Spacing.only(top: 64.px),
    ),
    css.media(MediaQuery.all(maxWidth: 768.px), [
      css('.exp-header').styles(
        flexDirection: .column,
      ),
      css('.exp-section').styles(
        padding: Spacing.symmetric(vertical: 64.px),
      ),
    ]),
  ];
}
