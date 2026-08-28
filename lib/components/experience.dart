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
      '전사 기술 스택 전환 주도 — React Native의 유지보수 중단 가능성을 「전 서비스가 묶이는 사업 리스크」로 환산해 비개발 의사결정자를 설득하고, Flutter 전환을 제안·완수',
      '5개 앱·웹 서비스의 아키텍처 수립부터 릴리즈·운영까지 End-to-End 담당',
      'LLM 토큰 비용 50% 절감 — OpenAI 기반 의학 상담 에이전트를 기획부터 운영까지 리드. 프롬프트 가드레일로 할루시네이션을 차단하고, 질문 패턴 기반 캐싱 레이어와 추천 질문 UI로 비용 구조를 재설계',
      '행정 운영 비용 60% 절감 · 3개 병원 배포 — 병원에 상주하며 의료진의 업무 동선과 병목을 관찰해 데스크 인력이 곧바로 쓸 수 있는 워크플로우를 설계하고, 종이 서류 기반 프로세스를 100% 디지털화',
      '고객 응대 월 500~700건 자동화 — 접수 안내·사전설문 발송·진료 후 안내를 SOLAPI 카카오톡 알림톡으로 자동화하고, 환자 분류와 상태에 따라 조건부 예약 발송하는 파이프라인을 설계',
      '엔터프라이즈 대응 · DAU 3,000+ 운영 — 대기업 DB그룹 웰니스 앱에 벤더로 참여해 엔터프라이즈 레벨 요구사항을 조율·통합하고, 릴리즈 후 트래픽을 안정적으로 운영',
      '협업 체계 정립 — 이슈 트래킹과 릴리즈·배포 절차를 정립하고, 고객 미팅과 타 부서 협의의 단일 창구를 맡아 요구사항을 개발 과제로 번역',
    ],
    pointsEn: [
      'Drove the company-wide tech stack migration — translated the risk of React Native losing maintenance into "a business risk that ties up every service," won over non-engineering decision makers, and completed the move to Flutter',
      'Owned 5 app/web services end to end, from architecture through release and operations',
      'Cut LLM token costs 50% — led an OpenAI-based medical consultation agent from planning through operations, blocking hallucinations with prompt guardrails and restructuring cost with a pattern-based caching layer and recommended-question UI',
      'Cut administrative operating costs 60% across 3 hospitals — embedded on site to observe clinician workflow and bottlenecks, designed a workflow front-desk staff could use immediately, and digitized the paper-based process 100%',
      'Automated 500-700 monthly customer touchpoints — moved check-in notices, pre-survey delivery, and post-visit follow-up onto SOLAPI KakaoTalk messaging, with conditional scheduled sends based on patient triage and status',
      'Enterprise delivery at DAU 3,000+ — joined a DB Group wellness app as a vendor, coordinated and integrated enterprise-level requirements, and kept traffic stable after release',
      'Established the collaboration process — set up issue tracking and release/deployment procedures, and served as the single point of contact for client meetings and cross-team discussions, translating requirements into engineering work',
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
    period: '2025.04 — 2026.06',
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
