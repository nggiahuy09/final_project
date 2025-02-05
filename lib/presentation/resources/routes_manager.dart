import 'package:final_project/presentation/forgot_password/forgot_password_view.dart';
import 'package:final_project/presentation/login/login_view.dart';
import 'package:final_project/presentation/onboarding/onboarding_view.dart';
import 'package:final_project/presentation/register/register_view.dart';
import 'package:final_project/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = '/';
  static const String onBoardingRoute = '/onBoarding';

  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgotPassword';

  static const String chatRoute = '/chat';
  static const String chatBotRoute = '/chatbot';
  static const String knowledgeBaseRoute = '/knowledge-base';
  static const String userProfileRoute = '/profile';
  static const String updateAccountRoute = '/update-account';
}

class RouteGenerator {
  static Route<dynamic> getRouted(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
      // return MaterialPageRoute(
      //   builder: (_) => const SplashView(),
      // );
      case Routes.onBoardingRoute:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingView(),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
        );
      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (_) => const RegisterView(),
        );
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordView(),
        );
      case Routes.chatRoute:
      case Routes.chatBotRoute:
      case Routes.knowledgeBaseRoute:
      case Routes.userProfileRoute:
      case Routes.updateAccountRoute:
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ),
      );
    });
  }
}
