import 'package:electrical_project/src/app.dart';
import 'package:electrical_project/src/features/chatbot/presentation/chat_page.dart';
import 'package:electrical_project/src/features/delta_star/presentation/delta_to_star_page.dart';
import 'package:electrical_project/src/features/parallel/presentation/parallel_rest_page.dart';
import 'package:electrical_project/src/features/series/presentation/series_rest_page.dart';
import 'package:electrical_project/src/optional_web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  home,
  parallel,
  selector,
  series,
  chathelpbot,
  deltaStar,
  starDelta,
}

final goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (context, state) =>
          !kIsWeb ? const SelectionScreen() : const HabibiPage(),
      routes: [
        GoRoute(
          path: 'Selector',
          name: AppRoute.selector.name,
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: SelectionScreen(),
            );
          },
        ),
        GoRoute(
          path: 'ParallelResistanceCalculator',
          name: AppRoute.parallel.name,
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: ParallelResistanceCalc(),
            );
          },
        ),
        GoRoute(
          path: 'ChatHelpBot',
          name: AppRoute.chathelpbot.name,
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: ChatScreen(
                title: 'AI Helpbot',
              ),
            );
          },
        ),
        GoRoute(
          path: 'SeriesResistanceCalculator',
          name: AppRoute.series.name,
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: SeriesResistanceCalc(),
            );
          },
        ),
        GoRoute(
          path: 'DeltaToStar',
          name: AppRoute.deltaStar.name,
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: DeltaToStarConverter(),
            );
          },
        ),
        GoRoute(
          path: 'StarToDelta',
          name: AppRoute.starDelta.name,
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: DeltaToStarConverter(),
            );
          },
        ),
      ],
    )
  ],
);
