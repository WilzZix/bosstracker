import 'package:bosstracker/presentation/choose_gender_page.dart';
import 'package:bosstracker/presentation/choose_picture_page.dart';
import 'package:bosstracker/presentation/initial_page.dart';
import 'package:bosstracker/presentation/invite_child_page.dart';
import 'package:bosstracker/presentation/name_child_page.dart';
import 'package:bosstracker/presentation/photo_added_success_page.dart';
import 'package:bosstracker/presentation/success_page.dart';
import 'package:go_router/go_router.dart';

class RouterV1 {
  GoRouter get router => _router;
  late final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (_, __) => const MyHomePage(),
      ),
      GoRoute(
        path: '/choose_gender',
        builder: (_, __) => const ChooseGanderPage(),
      ),
      GoRoute(
        path: '/choose_name',
        builder: (_, __) => const NameChildPage(),
      ),
      GoRoute(
        path: '/choose_picture',
        builder: (_, __) => const ChoosePicturePage(),
      ),
      GoRoute(
        path: '/picture_added_success',
        builder: (_, __) => const PhotoAddedSuccessPage(),
      ),
      GoRoute(
        path: '/invite_child',
        builder: (_, __) => const InviteChildPage(),
      ),
      GoRoute(
        path: '/success_page',
        builder: (_, __) => const SuccessPage(),
      ),
    ],
  );
}
