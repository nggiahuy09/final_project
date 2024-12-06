import 'dart:developer';

import 'package:final_project/consts/app_color.dart';
import 'package:final_project/consts/app_routes.dart';
import 'package:final_project/providers/auth_provider.dart';
import 'package:final_project/providers/kb_auth_provider.dart';
import 'package:final_project/views/chatbot_ai/chatbot_ai_page.dart';
import 'package:final_project/views/chats/main_thread_chat.dart';
import 'package:final_project/views/home_page.dart';
import 'package:final_project/views/knowledge_base/kb_details_page.dart';
import 'package:final_project/views/knowledge_base/kb_page.dart';
import 'package:final_project/views/authentication/login_page.dart';
import 'package:final_project/views/authentication/reset_password.dart';
import 'package:final_project/views/prompt/prompt_library.dart';
import 'package:final_project/views/user_info/update_account.dart';
import 'package:final_project/views/user_info/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:final_project/views/authentication/register_page.dart';
import 'package:final_project/views/authentication/login_gmail_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final authProvider = AuthProvider();
  await authProvider.initializeAuth();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => authProvider),
        ChangeNotifierProvider(create: (_) => KBAuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    log('is Authenticated: ${context.watch<AuthProvider>().isAuthenticated}');

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.backgroundColor1,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: AppColors.inverseTextColor),
          bodyMedium: TextStyle(color: AppColors.defaultTextColor),
        ),
      ),
      initialRoute: context.watch<AuthProvider>().isAuthenticated
          ? AppRoutes.loginPage
          : AppRoutes.homePage,
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.homePage: (_) => const HomePage(),
        AppRoutes.homeChat: (_) => const MainThreadChatPage(),
        AppRoutes.chatBotAI: (_) => const ChatbotAIPage(),
        AppRoutes.knowledgeBase: (_) => const KBPage(),
        AppRoutes.register: (_) => const RegisterPage(),
        AppRoutes.loginGmail: (_) => const LoginGmailPage(),
        AppRoutes.userProfile: (_) => const UserProfile(),
        AppRoutes.kbDetails: (_) => const KbDetailsPage(),
        AppRoutes.promptPage: (_) => const PromptLibrary(),
        AppRoutes.updateAccount: (_) => const UpdateAccount(),
        AppRoutes.loginPage: (_) => const LoginPage(),
        AppRoutes.resetPassword: (_) => const ResetPassword(),
      },
    );
  }
}
