import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shift_space/ui/dashBoard/views/home_view.dart';

final appRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      initialLocation: '/home',
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return navigationShell;
          },
          branches: [
            StatefulShellBranch(routes: [
              GoRoute(
                path: '/home',
                builder: (context, state) => const DashBoardView(),
              ),
            ]),
          ],
        ),
      ],
    );
  },
);
