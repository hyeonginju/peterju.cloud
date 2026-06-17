// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/server.dart';
import 'package:peters_portfolio/components/education.dart' as _education;
import 'package:peters_portfolio/components/experience.dart' as _experience;
import 'package:peters_portfolio/components/footer.dart' as _footer;
import 'package:peters_portfolio/components/header.dart' as _header;
import 'package:peters_portfolio/components/hero.dart' as _hero;
import 'package:peters_portfolio/components/physics_pool.dart' as _physics_pool;
import 'package:peters_portfolio/components/project_card.dart' as _project_card;
import 'package:peters_portfolio/components/projects_section.dart'
    as _projects_section;
import 'package:peters_portfolio/components/quote_modal.dart' as _quote_modal;
import 'package:peters_portfolio/components/side_projects.dart'
    as _side_projects;
import 'package:peters_portfolio/components/skills.dart' as _skills;
import 'package:peters_portfolio/app.dart' as _app;

/// Default [ServerOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.server.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultServerOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ServerOptions get defaultServerOptions => ServerOptions(
  clientId: 'main.client.dart.js',
  clients: {_app.App: ClientTarget<_app.App>('app')},
  styles: () => [
    ..._app.App.styles,
    ..._education.EducationSection.styles,
    ..._experience.ExperienceSection.styles,
    ..._footer.SiteFooter.styles,
    ..._header.SiteHeader.styles,
    ..._hero.HeroSection.styles,
    ..._physics_pool.PhysicsPool.styles,
    ..._project_card.SideProjectCard.styles,
    ..._projects_section.ProjectsSection.styles,
    ..._quote_modal.QuoteModal.styles,
    ..._side_projects.SideProjectsSection.styles,
    ..._skills.SkillsSection.styles,
  ],
);
