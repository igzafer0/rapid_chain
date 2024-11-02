// ignore_for_file: unrelated_type_equality_checks

import 'package:go_router/go_router.dart';
import 'package:rapid_chain/presentation/view/auth/change_password/view/change_password_view.dart';
import 'package:rapid_chain/presentation/view/auth/change_wallet/view/change_wallet_view.dart';
import 'package:rapid_chain/presentation/view/auth/login/view/login_view.dart';
import 'package:rapid_chain/presentation/view/auth/register/view/register_view.dart';
import 'package:rapid_chain/presentation/view/auth/splash/view/splash_view.dart';
import 'package:rapid_chain/presentation/view/flow_post/comment_list/view/comment_list_view.dart';
import 'package:rapid_chain/presentation/view/home/view/home_view.dart';
import 'package:rapid_chain/presentation/view/setting/view/setting_view.dart';
import 'package:rapid_chain/presentation/view/video_player/view/video_player_view.dart';
import 'package:rapid_chain/util/constant/navigation_constant.dart';

final router = GoRouter(
  initialLocation: NavigationConstant.MAIN,
  routes: [
    GoRoute(
      name: NavigationConstant.MAIN,
      path: NavigationConstant.MAIN,
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      name: NavigationConstant.LOGIN,
      path: NavigationConstant.LOGIN,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      name: NavigationConstant.REGISTER,
      path: NavigationConstant.REGISTER,
      builder: (context, state) => const RegisterView(),
    ),
    GoRoute(
      name: NavigationConstant.HOME,
      path: NavigationConstant.HOME,
      builder: (context, state) => const HomeView(),
      routes: [
        GoRoute(
          name: NavigationConstant.COMMENT_LIST,
          path: "${NavigationConstant.COMMENT_LIST}/:postId",
          builder: (context, state) => CommentListView(
            PostId: int.tryParse(state.pathParameters['postId']!) ?? 0,
          ),
        ),
        GoRoute(
          name: NavigationConstant.VIDEO_PLAYER,
          path: "${NavigationConstant.VIDEO_PLAYER}/:videoUrl",
          builder: (context, state) =>
              VideoPlayerView(url: state.pathParameters['videoUrl']!),
        ),
        GoRoute(
          name: NavigationConstant.SETTINGS,
          path: NavigationConstant.SETTINGS,
          builder: (context, state) => const SettingView(),
        ),
        GoRoute(
          name: NavigationConstant.CHANGE_PASSWORD,
          path: NavigationConstant.CHANGE_PASSWORD,
          builder: (context, state) => const ChangePasswordView(),
        ),
        GoRoute(
          name: NavigationConstant.CHANGE_WALLET,
          path: NavigationConstant.CHANGE_WALLET,
          builder: (context, state) => const ChangeWalletView(),
        ),
      ],
    ),
  ],
);
