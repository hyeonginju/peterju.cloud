class Tr {
  final String ko;
  final String en;
  const Tr(this.ko, this.en);
  String call(String lang) => lang == 'ko' ? ko : en;
}

class AppText {
  // Nav
  static const navSkills = Tr('스킬', 'Skills');
  static const navProjects = Tr('프로젝트', 'Projects');
  static const navExperience = Tr('경력', 'Experience');
  static const navContact = Tr('연락처', 'Contact');
  static const langKr = Tr('KR', 'KR');
  static const langEn = Tr('EN', 'EN');

  // Hero
  static const heroTag = Tr('SOFTWARE ENGINEER', 'SOFTWARE ENGINEER');
  static const heroHeadline = Tr(
    '코드 너머의 비즈니스 문제를 해결합니다.',
    'Solving business problems,\nnot just writing code',
  );
  static const heroDescription = Tr(
    '제조 공장 현장에서 스타트업 리드까지 — 실전에서 답을 찾는 엔지니어',
    'From factory floor to startup lead — an engineer who finds answers in the field.',
  );
  static const heroCta = Tr('프로젝트 보기', 'View Projects');
  static const heroContact = Tr('연락하기', 'Contact');

  // Skills
  static const skillsTitle = Tr('기술 스택', 'Skills');
  static const skillsLanguages = Tr('언어', 'Languages');
  static const skillsFrameworks = Tr('프레임워크 & 라이브러리', 'Frameworks & Libraries');
  static const skillsPlatforms = Tr('플랫폼', 'Platforms');
  static const skillsTools = Tr('도구 & 프로토콜', 'Tools & Protocols');

  // Projects
  static const projectsTitle = Tr('키 프로젝트', 'Key Projects');
  static const additionalTitle = Tr('추가 프로젝트', 'Additional Projects');
  static const projectPeriod = Tr('기간', 'Period');
  static const projectRole = Tr('역할 & 기여도', 'Role & Contribution');
  static const projectStack = Tr('기술 스택', 'Tech Stack');
  static const projectProblem = Tr('문제', 'Problem');
  static const projectAction = Tr('행동', 'Action');
  static const projectResult = Tr('결과', 'Result');
  static const projectImpact = Tr('비즈니스 임팩트', 'Business Impact');
  static const projectDeepDive = Tr('설계 기록', 'Engineering Notes');

  // Side Projects
  static const sideTitle = Tr('사이드 프로젝트', 'Side Projects');
  static const visitSite = Tr('사이트 방문하기', 'Visit Website');
  static const viewDetail = Tr('자세히 보기', 'View Details');
  static const comingSoon = Tr('출시 예정', 'Coming Soon');

  // Experience
  static const expTitle = Tr('경력', 'Work Experience');
  static const expPresent = Tr('진행 중', 'Present');
  static const overseasTitle = Tr('해외 경험', 'Global Experience');

  // Education
  static const eduTitle = Tr('교육 & 자격증', 'Education & Certifications');
  static const eduExpected = Tr('취득 예정', 'Expected');

  // Physics
  static const physicsTitle = Tr('생각의 바다', 'Sea of Thoughts');
  static const physicsDesc = Tr(
    '저를 만든 책들의 구절들이 물 위에 떠있습니다. 잡아서 던져보세요.',
    'Passages from books that shaped me, floating on water. Grab and throw them.',
  );
  static const closeModal = Tr('닫기', 'Close');

  // Footer
  static const footerBuilt = Tr(
    'Built by a Flutter developer, with Jaspr.',
    'Built by a Flutter developer, with Jaspr.',
  );
  static const footerCopy = Tr('All rights reserved', 'All rights reserved');
}
