import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import 'components/header.dart';
import 'components/hero.dart';
import 'components/skills.dart';
import 'components/projects_section.dart';
import 'components/side_projects.dart';
import 'components/experience.dart';
import 'components/education.dart';
import 'components/physics_pool.dart';
import 'components/quote_modal.dart';
import 'components/footer.dart';
import 'models/quote.dart';
import 'util/ls_web.dart' if (dart.library.io) 'util/ls_stub.dart';

String? _getStoredLang() => lsGet('portfolio_lang');

void _storeLang(String lang) => lsSet('portfolio_lang', lang);

@client
class App extends StatefulComponent {
  const App({super.key});

  @override
  State<App> createState() => _AppState();

  @css
  static final List<StyleRule> styles = [
    css('.app-root').styles(
      minHeight: 100.vh,
    ),
  ];
}

class _AppState extends State<App> {
  String _lang = 'ko';
  int? _selectedQuoteIdx;

  @override
  void initState() {
    super.initState();
    final stored = _getStoredLang();
    if (stored == 'ko' || stored == 'en') {
      _lang = stored!;
    }
  }

  void _toggleLang() {
    final next = _lang == 'ko' ? 'en' : 'ko';
    setState(() => _lang = next);
    _storeLang(next);
  }

  void _openModal(int idx) => setState(() => _selectedQuoteIdx = idx);
  void _closeModal() => setState(() => _selectedQuoteIdx = null);

  @override
  Component build(BuildContext context) {
    return div(classes: 'app-root', [
      SiteHeader(lang: _lang, onToggleLang: _toggleLang),
      HeroSection(lang: _lang),
      SkillsSection(lang: _lang),
      ProjectsSection(lang: _lang),
      SideProjectsSection(lang: _lang),
      ExperienceSection(lang: _lang),
      EducationSection(lang: _lang),
      PhysicsPool(lang: _lang, onQuoteSelected: _openModal),
      SiteFooter(lang: _lang),
      if (_selectedQuoteIdx != null)
        QuoteModal(
          quote: bookQuotes[_selectedQuoteIdx!],
          onClose: _closeModal,
        ),
    ]);
  }

}
