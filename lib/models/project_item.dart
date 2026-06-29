class ProjectItem {
  final String titleKo;
  final String titleEn;
  final String period;
  final String orgKo;
  final String orgEn;
  final String stackStr;
  final String roleKo;
  final String roleEn;
  final String problemKo;
  final String problemEn;
  final String actionKo;
  final String actionEn;
  final String resultKo;
  final String resultEn;
  final String impactKo;
  final String impactEn;
  final bool isKey;
  final List<String> images;
  final bool imagesArePortrait;

  const ProjectItem({
    required this.titleKo,
    required this.titleEn,
    required this.period,
    required this.orgKo,
    required this.orgEn,
    required this.stackStr,
    required this.roleKo,
    required this.roleEn,
    required this.problemKo,
    required this.problemEn,
    required this.actionKo,
    required this.actionEn,
    required this.resultKo,
    required this.resultEn,
    required this.impactKo,
    required this.impactEn,
    this.isKey = false,
    this.images = const [],
    this.imagesArePortrait = false,
  });
}

const List<ProjectItem> allProjects = [
  ProjectItem(
    titleKo: 'Smart Hospital System',
    titleEn: 'Smart Hospital System',
    period: '2024.05 — 2024.10',
    orgKo: '주식회사 디에이블 / 병원 B2B DX 구축',
    orgEn: 'Dable Inc. / Hospital B2B DX',
    stackStr: 'Flutter (Windows, Web, Android/iOS), BLoC, socket.io, PDF Generation',
    roleKo: '리드 플러터 개발자 (기여도 100% / 기획, UI/UX, 풀스택 아키텍처)',
    roleEn: 'Lead Flutter Developer (100% / Planning, UI/UX, Full-stack Architecture)',
    problemKo: '종이 사전설문을 진료 시스템에 수동으로 재입력하는 프로세스의 비효율과 행정 병목.',
    problemEn:
        'Manual re-entry of paper pre-consultation forms into the clinical system created administrative bottlenecks.',
    actionKo: '환자용 태블릿 앱, 사전설문 웹, 의사용 Windows 앱을 단일 Flutter 코드베이스로 통합 구축. socket.io 실시간 동기화 및 자동 PDF 변환 파이프라인 구현.',
    actionEn:
        'Unified patient tablet app, pre-survey web, and doctor Windows app in a single Flutter codebase. Built socket.io real-time sync and automatic PDF conversion pipeline.',
    resultKo: '3개 병원 전면 배포. 데스크 직원 중간 매개 역할 완전 제거, 인건비 50% 이상 절감.',
    resultEn: 'Deployed to 3 hospitals. Eliminated desk staff intermediary role, cutting labor costs by over 50%.',
    impactKo: '아날로그 예진 프로세스 100% 디지털화와 데스크 업무 효율화를 통해 운영 비용 60% 이상 절감',
    impactEn:
        'Reduced operational costs by over 60% by fully digitizing analog triage processes and streamlining desk operations',
    isKey: true,
    images: ['assets/project/smart_hospital/sh1.png', 'assets/project/smart_hospital/sh2.png'],
    imagesArePortrait: false,
  ),
  ProjectItem(
    titleKo: 'Dplanit Moming — OpenAI 챗봇 & 커뮤니티',
    titleEn: 'Dplanit Moming — OpenAI Chatbot & Community',
    period: '2023.06 — 2024.04',
    orgKo: '주식회사 디에이블 / 자사 서비스 고도화',
    orgEn: 'Dable Inc. / In-house Service',
    stackStr: 'Flutter (Android/iOS), BLoC, OpenAI API, FCM, Local/Remote DB',
    roleKo: '리드 플러터 개발자 (기여도 80% / AI 아키텍처, 프롬프트 엔지니어링, 클라이언트 개발)',
    roleEn: 'Lead Flutter Developer (80% / AI Architecture, Prompt Engineering, Client Dev)',
    problemKo: '비의학적 질문 유입으로 인한 할루시네이션 리스크와 증가하는 API 토큰 비용.',
    problemEn: 'Hallucination risk from non-medical queries and rising API token costs.',
    actionKo: '난임 전문의 페르소나 기반 프롬프트 가드레일 구축, Redis 캐싱 + 추천 질문 UI로 중복 API 호출 최소화.',
    actionEn:
        'Built prompt guardrails with fertility specialist persona, minimized duplicate API calls via Redis caching + recommended question UI.',
    resultKo: 'OpenAI API 토큰 비용 50% 절감, 5,000+ 다운로드, DAU 100명 달성.',
    resultEn: '50% reduction in OpenAI API token costs, 5,000+ downloads, DAU 100.',
    impactKo: '캐싱 아키텍처 + 추천 UI로 API 비용 50% 이상 절감, 높은 비즈니스 마진 확보',
    impactEn: 'Caching architecture + recommendation UI cut API costs by 50%+, securing high business margins',
    isKey: true,
    images: ['assets/project/dplanit_moming/dm1.png', 'assets/project/dplanit_moming/dm2.jpeg'],
    imagesArePortrait: true,
  ),
  ProjectItem(
    titleKo: 'Dpland — 초등 방과후 수업 관리 시스템',
    titleEn: 'Dpland — After-School Class Management',
    period: '2025.01 — 2025.03',
    orgKo: '풀사이클 제품 설계',
    orgEn: 'Full-cycle Product Design',
    stackStr: 'Flutter (Web), BLoC, Figma',
    roleKo: '기획, UI/UX 디자인, 리드 개발자 (기여도 100%)',
    roleEn: 'Planning, UI/UX Design, Lead Developer (100%)',
    problemKo: '방과후 수업 현장의 비효율적 프로세스 개선 필요.',
    problemEn: 'Inefficient processes in after-school class management needed improvement.',
    actionKo: 'Figma로 직접 UI/UX 설계, 반응형 웹 앱 빌드.',
    actionEn: 'Designed UI/UX directly in Figma, built responsive web app.',
    resultKo: '국내 10개 이상 학교 도입, 1,000명 이상 학생 관리 자동화.',
    resultEn: 'Adopted by 10+ schools nationwide, automated management for 1,000+ students.',
    impactKo: '고객 추가 확보 가능성까지 염두해 확장 가능한 B2B 서비스 소프트웨어 개발',
    impactEn: 'Architected and developed scalable B2B SaaS designed to accommodate future customer acquisition',
    images: ['assets/project/dpland/dp1.png', 'assets/project/dpland/dp2.png'],
    imagesArePortrait: false,
  ),
  ProjectItem(
    titleKo: 'Healthlit — 웰니스 자가진단 앱',
    titleEn: 'Healthlit — Wellness Self-Diagnosis App',
    period: '2024.10 — 2025.01',
    orgKo: 'DB그룹 벤더 프로젝트',
    orgEn: 'DB Group Vendor Project',
    stackStr: 'Flutter (Web), BLoC, goRouter',
    roleKo: '기획, UI/UX 디자인, 리드 개발자 (기여도 80%)',
    roleEn: 'Planning, UI/UX Design, Lead Developer (80%)',
    problemKo: '대기업 엔터프라이즈 요구사항을 기민하게 조율해야 하는 벤더 프로젝트.',
    problemEn: 'Vendor project requiring agile coordination of enterprise-level requirements.',
    actionKo: '엔터프라이즈 요구사항 조율 및 DB그룹 메인 서비스 통합.',
    actionEn: 'Coordinated enterprise requirements and integrated with DB Group main service.',
    resultKo: '성공적 통합, 릴리즈 이후 DAU 3,000명 이상의 대형 트래픽 처리.',
    resultEn: 'Successful integration, handling DAU 3,000+ post-release.',
    impactKo: '대기업 외주 프로젝트를 성공적으로 마무리',
    impactEn: 'Successfully delivered an outsourced project for a major corporation',
    images: ['assets/project/healthlit/hl1.png', 'assets/project/healthlit/hl2.png'],
    imagesArePortrait: true,
  ),
  ProjectItem(
    titleKo: 'Together — 임신 추적 & 건강 기록 앱',
    titleEn: 'Together — Pregnancy Tracking & Health App',
    period: '2025.01',
    orgKo: '외주 개발',
    orgEn: 'Freelance',
    stackStr: 'Flutter (iOS/Android), Provider, Riverpod',
    roleKo: '리드 개발자 (기여도 100%)',
    roleEn: 'Lead Developer (100%)',
    problemKo: 'HIRA Open API 연동 및 임신 테스트기 이미지 분석 기능 요청.',
    problemEn: 'HIRA Open API integration and pregnancy test strip image analysis required.',
    actionKo: '건강보험심사평가원 Open API 연동, 배란일 예측 지능화 엔진 개발.',
    actionEn: 'Integrated HIRA Open API, developed ovulation prediction intelligence engine.',
    resultKo: '외주 계약 조건에 맞추어 안정적으로 빌드 완료 및 성공적 인도.',
    resultEn: 'Stably completed build within contract terms and successfully delivered.',
    impactKo: '계약 조건 충족, 성공적 납품 완료',
    impactEn: 'Met contract terms, successfully delivered',
    images: ['assets/project/together/tg1.webp', 'assets/project/together/tg2.webp'],
    imagesArePortrait: true,
  ),
  ProjectItem(
    titleKo: 'Dplanit Plus — 고위험 임산부 컴패니언 앱',
    titleEn: 'Dplanit Plus — High-Risk Pregnancy Companion',
    period: '2023.03 — 2023.05',
    orgKo: '주식회사 디에이블 / 자사 서비스',
    orgEn: 'Dable Inc. / In-house Service',
    stackStr: 'JavaScript, React Native, Redux Toolkit, In-App Purchase',
    roleKo: '리드 개발자 (기여도 100%)',
    roleEn: 'Lead Developer (100%)',
    problemKo: '인앱 결제 기능과 터치와 중첩이 가능한 커스텀 그래프 개발 및 Redux Toolkit 기반 타이머 로직 설계, 미디어 압축 및 웹뷰 스크린 최적화 주도.',
    problemEn:
        'Led the development of in-app purchases, touch-interactive overlapping custom graphs, Redux Toolkit-based timer logic, and optimization for media compression and webview screens.',
    actionKo: '실시간 꺾은선 건강 기록 그래프 커스텀 구현, Redux Toolkit 타이머, 미디어 압축 최적화.',
    actionEn: 'Custom real-time line chart for health records, Redux Toolkit timer, media compression optimization.',
    resultKo: '고위험 임산부 건강 관리 서비스 출시',
    resultEn: 'Launched a healthcare service for high-risk pregnancies.',
    impactKo: '인앱 결제 기능을 갖춘 자사 첫 서비스 양대 마켓 동시 출시 완수',
    impactEn:
        'Successfully launched the companys first in-app purchase service simultaneously on both App Store and Google Play.',
    images: ['assets/project/dplanit_plus/dpp1.png', 'assets/project/dplanit_plus/dpp2.png'],
    imagesArePortrait: true,
  ),
];

class SideProjectItem {
  final String name;
  final String descKo;
  final String descEn;
  final String? url;
  final List<String> tags;
  final bool isPlaceholder;
  final String? logoAsset;
  final String? logoColor;
  final String? logoText;
  final List<String> detailImages;
  final List<String> detailParasKo;
  final List<String> detailParasEn;

  const SideProjectItem({
    required this.name,
    required this.descKo,
    required this.descEn,
    this.url,
    required this.tags,
    this.isPlaceholder = false,
    this.logoAsset,
    this.logoColor,
    this.logoText,
    this.detailImages = const [],
    this.detailParasKo = const [],
    this.detailParasEn = const [],
  });

  bool get hasDetail => detailParasKo.isNotEmpty || detailImages.isNotEmpty;
}

const List<SideProjectItem> sideProjects = [
  SideProjectItem(
    name: 'LIKID DESIGN',
    descKo: '감각적인 브랜드 정체성과 인터랙티브한 디지털 경험을 설계하는 브랜딩/디자인 에이전시 웹사이트.',
    descEn:
        'A branding and design agency website focused on intuitive brand identity and interactive digital experiences.',
    url: 'https://likiddesign.com/',
    tags: ['Branding', 'Web Design', 'Interactive'],
    logoAsset: 'assets/likid_logo.png',
    logoText: 'LIKID',
  ),
  SideProjectItem(
    name: 'Peters Weather',
    descKo:
        '기상청 공식 데이터는 신뢰할 수 있지만, 공식 앱의 UI는 너무 불편했습니다. 믿을 수 있는 데이터를 직관적이고 편한 UI로 제공하기 위해 직접 만들었습니다. 기획부터 디자인, 개발까지 AI 툴로 전체 워크플로우를 연결한 AI-driven 사이드 프로젝트.',
    descEn:
        'KMA\'s official data is reliable, but the official app\'s UI is frustratingly outdated. Built to deliver trustworthy weather data through a clean, intuitive interface. My first fully AI-driven project — connecting planning, design, and development through AI tools end-to-end.',
    tags: ['Flutter', 'KMA API', 'AI-Driven'],
    logoColor: '#38BDF8',
    logoText: 'WEATHER',
    detailImages: [
      'assets/project/weather/weather1.png',
      'assets/project/weather/weather2.png',
      'assets/project/weather/weather3.png',
    ],
    detailParasKo: [
      '기상청 공식 데이터는 국내에서 가장 정확하고 신뢰할 수 있지만, 정작 공식 앱의 UI는 복잡하고 불편해 그 좋은 데이터의 가치를 제대로 살리지 못했습니다. 믿을 수 있는 데이터를 누구나 한눈에 볼 수 있는 직관적인 화면으로 다시 설계하고 싶어 직접 개발을 시작했습니다.',
      '기획부터 디자인, 개발까지 전 과정을 AI 툴로 연결한 첫 AI-driven 프로젝트입니다. 화면 설계와 카피라이팅, 코드 작성까지 AI와 협업하며 혼자서도 빠르게 완성도 높은 서비스를 만들었습니다.',
      'GitHub Actions 기반 자동 배포 파이프라인을 구축하고, cron-job.org와 Firestore를 결합해 운영 비용 없이 동작하는 기상특보 푸시 알림 시스템을 만들었습니다. 또한 Flutter에 안드로이드 네이티브 코드를 결합해 홈 화면에서 바로 날씨를 확인할 수 있는 위젯을 직접 구현했습니다.',
    ],
    detailParasEn: [
      'KMA\'s official data is the most accurate and reliable in Korea, yet the official app\'s clunky, dated UI never let that data shine. I built this app to deliver trustworthy weather through a clean, at-a-glance interface anyone can read instantly.',
      'It\'s my first fully AI-driven project — connecting planning, design, and development end-to-end with AI tools. Collaborating with AI on screen design, copywriting, and code let me ship a polished service quickly, on my own.',
      'I set up an automated deployment pipeline with GitHub Actions, and built a zero-cost weather-alert push system by combining cron-job.org with Firestore. I also bridged Flutter with native Android code to build home-screen widgets that show the forecast at a glance.',
    ],
  ),
  SideProjectItem(
    name: 'App #2',
    descKo: '모바일 앱 준비 중입니다.',
    descEn: 'Mobile app in development.',
    tags: ['Flutter', 'Mobile', 'iOS/Android'],
    isPlaceholder: true,
  ),
];
