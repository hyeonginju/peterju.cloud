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
  final List<String> detailParasKo;
  final List<String> detailParasEn;

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
    this.detailParasKo = const [],
    this.detailParasEn = const [],
  });
}

const List<ProjectItem> allProjects = [
  ProjectItem(
    titleKo: 'Smart Hospital System — 병원 데스크 & 접수 시스템',
    titleEn: 'Smart Hospital System — Hospital Desk & Intake',
    period: '2024.05 — 2024.10',
    orgKo: '주식회사 디에이블 / 병원 B2B DX 구축',
    orgEn: 'Dable Inc. / Hospital B2B DX',
    stackStr: 'Flutter (Windows, Web, Android/iOS), BLoC, socket.io, PDF Generation, SOLAPI',
    roleKo: '리드 플러터 개발자 (기여도 100% / 기획, UI/UX, 풀스택 아키텍처)',
    roleEn: 'Lead Flutter Developer (100% / Planning, UI/UX, Full-stack Architecture)',
    problemKo: '종이 사전설문을 진료 시스템에 수동으로 재입력하는 프로세스의 비효율과 행정 병목.',
    problemEn:
        'Manual re-entry of paper pre-consultation forms into the clinical system created administrative bottlenecks.',
    actionKo:
        '병원에 직접 임베딩해 의료진과 데스크의 실제 동선을 관찰하고, 환자용 태블릿 앱·사전설문 웹·의사용 Windows 앱을 단일 Flutter 코드베이스로 통합 구축. socket.io 실시간 동기화와 자동 PDF 변환 파이프라인을 구현하고, 승인된 기기만 접근하도록 디바이스 등록·승인 체계를 설계. SOLAPI 카카오톡 알림톡으로 접수 안내·사전설문·진료 후 안내를 월 500~700건 자동 발송. Windows 코드 서명으로 설치가 막히자 문제를 「경고 제거」가 아닌 「신뢰 확보」로 재정의하고, 직접 병원을 방문해 설치·온보딩하며 가이드 문서를 제작·전달.',
    actionEn:
        'Embedded on-site to observe how clinicians and the front desk actually move, then unified the patient tablet app, pre-survey web, and doctor Windows app into a single Flutter codebase. Built socket.io real-time sync and an automatic PDF pipeline, plus a device registration/approval scheme so only sanctioned hardware can connect. SOLAPI KakaoTalk messaging automated 500-700 monthly notices for check-in, pre-survey, and post-visit follow-up. When Windows code signing blocked installation, I reframed the problem from \'removing the warning\' to \'earning trust\' — visiting each hospital to install, onboard, and hand over written guides.',
    resultKo: '국내 3개 병원 전면 배포 및 안정 운영. 종이 서류 기반 프로세스를 100% 디지털화하고, 세 업무를 하나의 흐름으로 묶어 상주 인력 1/3 수준으로 운영 가능한 구조를 만듦.',
    resultEn:
        'Fully deployed and stably operating at 3 hospitals in Korea. Digitized the paper-based process 100% and merged three separate duties into one flow, enabling operation with a third of the on-site staff.',
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
    stackStr: 'Flutter (Android/iOS), BLoC, OpenAI API, Redis, FCM, Local/Remote DB',
    roleKo: '리드 플러터 개발자 (기여도 80% / AI 아키텍처, 프롬프트 엔지니어링, 클라이언트 개발)',
    roleEn: 'Lead Flutter Developer (80% / AI Architecture, Prompt Engineering, Client Dev)',
    problemKo: '비의학적 질문 유입으로 인한 할루시네이션 리스크와 증가하는 API 토큰 비용.',
    problemEn: 'Hallucination risk from non-medical queries and rising API token costs.',
    actionKo:
        '사내 자문 교수진과 「난임 전문의」 페르소나를 기획해 비의학 질문을 정밀 필터링하는 프롬프트 가드레일을 구축. 입력 질문을 임베딩해 벡터DB에서 유사 질문을 검색하고, 임계값을 넘으면 Redis에 캐싱된 기존 답변을 반환하는 시맨틱 캐싱 아키텍처로 중복 호출을 제거. 질문 입력 필드 상단에 「추천 질문 가이드 UI」를 배치해 캐싱 답변 소비율을 끌어올리고, BLoC 패턴으로 미디어 업로드와 중첩 댓글 구조까지 대규모 상태관리를 확장해 커뮤니티 서비스를 구축.',
    actionEn:
        'Designed a \'fertility specialist\' persona with in-house advising professors to precisely filter out non-medical questions at the guardrail layer. Built a semantic caching architecture — embedding each incoming question, searching a vector DB for near-duplicates, and returning the Redis-cached answer above a similarity threshold — to eliminate redundant LLM calls. A recommended-question guide UI above the input field drove uptake of cached answers, and the same BLoC pattern scaled to media uploads and nested comment threads for the community feature.',
    resultKo: 'OpenAI API 토큰 비용 50% 절감, 3,000+ 누적 다운로드, DAU 100명 안정 운영.',
    resultEn: '50% reduction in OpenAI API token costs, 3,000+ downloads, DAU 100 in stable operation.',
    impactKo: '캐싱 아키텍처 + 추천 UI로 API 비용 50% 이상 절감, 높은 비즈니스 마진 확보',
    impactEn: 'Caching architecture + recommendation UI cut API costs by 50%+, securing high business margins',
    isKey: true,
    images: ['assets/project/dplanit_moming/dm1.png', 'assets/project/dplanit_moming/dm2.jpeg'],
    imagesArePortrait: true,
  ),
  ProjectItem(
    titleKo: '시켜줘, 명예소방관 — 개인화 재난 경보',
    titleEn: 'Hazard Fighter — Personalized Disaster Alerts',
    period: '2026.07 — 진행 중',
    orgKo: '개인 프로젝트 / 기획 · 백엔드 · 인프라 운영',
    orgEn: 'Personal Project / Planning, Backend, Infra Ops',
    stackStr: 'Python, FastAPI, SQLAlchemy, Alembic, PostgreSQL, Docker, GCP Cloud Run, Web Push',
    roleKo: '기획, 백엔드 설계, 인프라 구축 및 운영 (기여도 100%)',
    roleEn: 'Planning, Backend Architecture, Infrastructure & Operations (100%)',
    problemKo: '국가 공공 API에는 신뢰할 수 있는 재난 데이터가 있지만, 정작 위험한 사람에게 제때 닿지 않습니다. 데이터는 흩어져 있고 경보는 지역 단위로 뭉뚱그려 발송됩니다.',
    problemEn:
        'Trustworthy disaster data already exists in public APIs, but it never reaches the person actually at risk in time. The data is scattered across sources and alerts go out lumped together by region.',
    actionKo:
        '기상특보·지진·홍수·긴급재난문자 4종 공공 API를 하나의 수집 파이프라인으로 정규화. 보호 대상의 상황 태그(영유아·임산부·실외근무·호흡기 질환 등)와 지역을 조합해 위험도를 산정하고, 해당되는 구독자에게만 선별 발송. 단순 경보 전달이 아니라 대상의 상황에 맞춘 구체적 행동 지침을 담아 발송. FastAPI와 PostgreSQL로 서버를 설계하고 Docker로 컨테이너화, GCP Cloud Run에 배포해 직접 운영 중.',
    actionEn:
        'Normalized four public APIs — weather alerts, earthquakes, floods, and emergency broadcasts — into a single ingestion pipeline. Risk is scored by combining each protected person\'s context tags (infants, pregnancy, outdoor work, respiratory conditions) with their region, so only affected subscribers are notified. Alerts carry concrete guidance tailored to that person rather than a generic warning. I designed the server with FastAPI and PostgreSQL, containerized it with Docker, and deployed it to GCP Cloud Run, where I operate it myself.',
    resultKo:
        '클라이언트 개발자로서의 경계를 넘어 서버 설계부터 배포·운영까지 혼자 완결. 공공 데이터를 실사용 가치로 바꾸는 전 과정을 직접 검증했습니다. hazard.peterju.cloud/app에서 운영 중.',
    resultEn:
        'Stepped past the boundary of client-side development to own server design, deployment, and operations end to end — validating for myself the full path from public data to real-world value. Live at hazard.peterju.cloud/app.',
    impactKo: '흩어진 공공 데이터를 하나의 파이프라인으로 묶어, 필요한 사람에게만 닿는 개인화 경보 시스템을 설계·운영',
    impactEn:
        'Unified scattered public data into one pipeline and now runs a personalized alert system that reaches only the people who need it',
    isKey: true,
    images: [
      'assets/project/hazard/hazard1.jpeg',
      'assets/project/hazard/hazard2.jpeg',
      'assets/project/hazard/hazard3.jpeg',
    ],
    imagesArePortrait: true,
    detailParasKo: [
      '「믿을 수 있는 데이터를, 위험한 순간에, 맞는 사람에게 어떻게 자동으로 전달할까?」 이건 화면의 문제가 아니라 데이터 파이프라인과 인프라의 문제였습니다.',
      '사용자·보호대상·지역·구독·이벤트·알림 등 13개 테이블을 SQLAlchemy로 모델링하고 Alembic으로 스키마 변경을 버전 관리했습니다. 운영은 PostgreSQL을 쓰되 모델에 다이얼렉트 호환 타입을 적용해 DB 서버 없이도 테스트 144개가 전부 도는 구조로 만들었고, 앱과 Postgres를 docker-compose로 묶었습니다.',
      '기상특보·지진·홍수통제소·긴급재난문자 4종은 소스마다 응답 형식, 인증 방식, 호출 한도, 지역 표기가 전부 달랐습니다. 문서만 보고 짠 코드는 실데이터 앞에서 대부분 틀렸고(특보는 관서 단위라 지역이 안 나오고, 지진은 필수 파라미터가 숨어 있고, 홍수통제소는 해외 IP를 차단), 실응답을 직접 떠서 하나씩 교정했습니다. 서로 다른 지역명은 이름 기반 매칭으로 이어 붙이고, 소스 하나가 죽어도 나머지는 처리되도록 에러를 격리했습니다.',
      '수집한 이벤트를 구독자의 상황(나이대·건강 태그)과 맞춰 결정론적 규칙으로 1차 판단하고, 규칙 밖 케이스만 LLM으로 보조 판단하는 2계층 엔진을 붙였습니다. 알림 문구도 LLM이 개인 특성에 맞춰 생성하되 LLM이 죽어도 서비스가 멈추지 않도록 유료→무료→템플릿 3단 폴백을 뒀고, 최종 발송은 FCM 웹푸시로 생성과 발송을 분리해 중복 발송을 막았습니다.',
      'GCP Cloud Run에 배포하고, 주기 수집은 Cloud Scheduler로 앱 밖에 빼서 인스턴스가 늘어도 호출량이 곱해지지 않게 했습니다. DB는 Neon(관리형 PostgreSQL)을 같은 리전에 두고 도메인·HTTPS까지 연결해 24시간 무중단으로 운영 중입니다. 배포 3일 뒤 점검에서 겉보기 지표는 정상인데 알림만 안 나가던 「조용한 실패」를 찾아 관측성을 보강한 것까지가 이 프로젝트입니다.',
    ],
    detailParasEn: [
      'My previous side project (WEATHER) solved "the KMA data is reliable but the official app\'s UI is painful." The next question was obvious — "how do I automatically deliver trustworthy data to the right person the moment it matters?" That\'s not a UI problem; it\'s a data-pipeline and infrastructure problem, so I took it head-on as a backend build.',
      'I modeled 13 tables (users, protected persons, regions, subscriptions, events, notifications, ...) with SQLAlchemy and version-controlled schema changes with Alembic. Production runs on PostgreSQL, but dialect-compatible column types let all 144 tests run without a database server, and bundling the app with Postgres via docker-compose killed the "works on my machine" problem.',
      'Weather alerts, earthquakes, flood gauges, and emergency broadcasts each had different response shapes, auth, rate limits, and region naming. Code written from docs alone mostly broke against real data (alerts came at bureau granularity with no region, earthquakes hid a required parameter, the flood API blocked foreign IPs), so I captured real responses and corrected each mapping by hand. Mismatched region names are bridged with name-based matching, and errors are isolated per source so one dead source doesn\'t stop the rest.',
      'A two-layer engine scores each event against the subscriber\'s context (age group, health tags): deterministic rules decide first, and only ambiguous cases fall through to an LLM. Alert copy is LLM-generated per person, but a paid to free to template three-stage fallback keeps the service running when the LLM is down, and final delivery goes out over FCM web push with generation and dispatch separated to prevent duplicate sends.',
      'I shipped it to GCP Cloud Run, with periodic collection pulled out of the app into Cloud Scheduler so call volume doesn\'t multiply as instances scale. The DB is Neon (managed PostgreSQL) in the same region, with domain and HTTPS wired up — running 24/7. Three days after launch I caught a "silent failure" where every surface metric was green yet alerts quietly weren\'t going out, and hardened observability around it.',
    ],
  ),
  ProjectItem(
    titleKo: 'Dpland — 초등 방과후 수업 관리 시스템',
    titleEn: 'Dpland — After-School Class Management',
    period: '2025.01 — 2025.03',
    orgKo: '주식회사 디에이블 / 풀사이클 제품 설계',
    orgEn: 'Dable Inc. / Full-cycle Product Design',
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
    orgKo: '주식회사 디에이블 / DB그룹 벤더 프로젝트',
    orgEn: 'Dable Inc. / DB Group Vendor Project',
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
    orgKo: '주식회사 디에이블 / 외주 개발',
    orgEn: 'Dable Inc. / Freelance',
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
  final bool logoIsKorean;
  final List<String> modalTags;
  final List<String> detailImages;
  final List<String> detailParasKo;
  final List<String> detailParasEn;
  final bool detailImagesAreLandscape;

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
    this.logoIsKorean = false,
    this.modalTags = const [],
    this.detailImages = const [],
    this.detailParasKo = const [],
    this.detailParasEn = const [],
    this.detailImagesAreLandscape = false,
  });

  bool get hasDetail => detailParasKo.isNotEmpty || detailImages.isNotEmpty;
}

const List<SideProjectItem> sideProjects = [
  SideProjectItem(
    name: 'LIKID',
    descKo:
        '플랫폼 입점은 편하지만 수수료·편집 자유도·사용성을 모두 플랫폼에 맡기는 일입니다. 브랜드 정체성을 그대로 드러내고 수익 구조를 직접 통제하기 위해, 브랜드 갤러리 커머스와 운영자용 어드민을 프론트엔드·백엔드 모두 직접 구축했습니다. 개발자 없이도 매일 굴러가는 실서비스 투입 가능한 완성도로 개발 완료.',
    descEn:
        'Listing on a marketplace is easy, but it hands over your commission, your editorial freedom, and your usability all at once. To put the brand identity front and center and control the revenue structure directly, I built both the gallery commerce storefront and the operator-facing admin — frontend and backend, on my own — finished to a standard that runs daily without a developer on call.',
    url: 'https://likid-shop.vercel.app/shop',
    tags: ['Next.js', 'Nest.js', 'PostgreSQL'],
    modalTags: ['Next.js', 'React', 'TypeScript', 'Nest.js', 'PostgreSQL', 'Vercel'],
    logoText: 'LIKID',
    detailImages: [
      'assets/project/likid/likid1.png',
      'assets/project/likid/likid2.png',
      'assets/project/likid/likid3.png',
    ],
    detailImagesAreLandscape: true,
    detailParasKo: [
      '플랫폼에 입점하면 당장은 편합니다. 대신 수수료율, 화면 편집 자유도, 사용성까지 전부 플랫폼 정책에 묶입니다. 정책이나 수수료가 바뀌면 그대로 받아들일 수밖에 없습니다. 브랜드 정체성을 그대로 드러내면서 수익 구조를 직접 통제하려면 자기 서비스가 필요했고, 동시에 개발자가 상주하지 않아도 매일 굴러가야 했습니다.',
      '커머스 프론트엔드는 Next.js로 상품 전시·장바구니·주문 흐름을 구현하고, 브랜드 톤에 맞춘 갤러리형 레이아웃을 직접 설계했습니다. 백엔드는 Nest.js로 상품·주문·회원·재고 도메인을 구성하고, 상태 전이 규칙(결제대기 → 배송중 → 완료, 취소 시 재고 복구)을 클라이언트가 아닌 서버에서 강제했습니다.',
      '어드민은 지표 대시보드가 아니라 「처리할 일」 우선순위로 구성했습니다. 결제를 기다리는 주문, 못 나간 알림, 품절인데 노출 중인 상품처럼 사고가 될 항목을 급한 순서로 맨 위에 띄워, 운영자가 무엇부터 볼지 고민하지 않게 했습니다.',
      '가장 신경 쓴 건 비개발자용 언어입니다. 화면마다 동작 규칙을 평서문으로 적어두어 — 「취소하면 재고가 돌아오고, 되돌릴 수 없습니다」처럼 — 별도 교육 없이도 운영자가 스스로 판단할 수 있게 구성했습니다.',
      '기획부터 프론트엔드·백엔드까지 혼자 완결해 Vercel에 배포했습니다. 플랫폼 수수료와 정책 변화에 종속되지 않는 자체 판매 채널을 확보했고, Flutter 외 웹 생태계에서도 제품을 끝까지 만들어낼 수 있음을 검증했습니다.',
    ],
    detailParasEn: [
      'Listing on a marketplace is convenient today. In exchange, your commission rate, your layout freedom, and your usability are all bound to platform policy — and when the policy or the fee changes, you simply absorb it. Showing the brand identity as intended while controlling the revenue structure required our own service, and it had to keep running every day without a developer on site.',
      'I built the storefront in Next.js — product display, cart, and checkout flow — and designed a gallery-style layout matched to the brand tone. The backend is Nest.js, structuring the product, order, member, and inventory domains, with state-transition rules (awaiting payment to shipping to complete, inventory restored on cancellation) enforced on the server rather than the client.',
      'The admin is organized around what needs handling, not around metrics. Orders awaiting payment, notifications that failed to send, products still listed while out of stock — anything that could become an incident surfaces at the top in order of urgency, so the operator never has to work out what to look at first.',
      'What I cared about most was writing for non-developers. Every screen states its behavior in plain sentences — "cancelling returns the stock, and cannot be undone" — so an operator can decide on their own without a training session.',
      'I owned it from planning through frontend and backend and shipped it on Vercel. It secured a sales channel that does not depend on platform fees or policy shifts, and it proved I can carry a product all the way through in the web ecosystem, not only in Flutter.',
    ],
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
      '기획부터 디자인, 개발까지 전 과정을 AI 툴로 연결한 AI-driven 프로젝트입니다. 화면 설계와 카피라이팅, 코드 작성까지 AI와 협업하며 혼자서도 빠르게 완성도 높은 서비스를 만들었습니다.',
      'GitHub Actions 기반 자동 배포 파이프라인을 구축하고, cron & Firestore를 결합해 운영 비용 없이 동작하는 기상특보 푸시 알림 시스템을 만들었습니다. 또한 Flutter에 안드로이드 네이티브 코드를 결합해 홈 화면에서 바로 날씨를 확인할 수 있는 위젯을 직접 구현했습니다.',
    ],
    detailParasEn: [
      'KMA\'s official data is the most accurate and reliable in Korea, yet the official app\'s clunky, dated UI never let that data shine. I built this app to deliver trustworthy weather through a clean, at-a-glance interface anyone can read instantly.',
      'It\'s my first fully AI-driven project — connecting planning, design, and development end-to-end with AI tools. Collaborating with AI on screen design, copywriting, and code let me ship a polished service quickly, on my own.',
      'I set up an automated deployment pipeline with GitHub Actions, and built a zero-cost weather-alert push system by combining cron-job.org with Firestore. I also bridged Flutter with native Android code to build home-screen widgets that show the forecast at a glance.',
    ],
  ),
];
