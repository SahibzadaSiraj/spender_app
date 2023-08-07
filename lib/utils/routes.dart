import 'package:get/get.dart';
import 'package:moneyp/bindings/home_page_binding.dart';
import 'package:moneyp/bindings/login_page_binding.dart';
import 'package:moneyp/bindings/stats_page_binding.dart';
import 'package:moneyp/bindings/wallet_homepage_binding.dart';
import 'package:moneyp/bindings/wallet_onboard_binding.dart';
import 'package:moneyp/feature/chat-gpt-api/chat-gpt-ui.dart';
import 'package:moneyp/feature/home/view/homepage_view.dart';
import 'package:moneyp/feature/login/view/login_view.dart';
import 'package:moneyp/feature/login/view/sign_up_view.dart';
import 'package:moneyp/feature/onboard/view/onboard_view.dart';
import 'package:moneyp/feature/profile/view/profile_page_view.dart';
import 'package:moneyp/feature/stats_page/stats_page_view.dart';
import 'package:moneyp/feature/wallet_homepage/wallet_homepage_view.dart';
import 'package:moneyp/feature/wallet_onboard/wallet_onboard_view.dart';

import '../feature/badges/badges_ui.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: '/onboard',
      page: () => const OnboardPage(),
    ),
    GetPage(
        name: '/login', page: () => LoginPage(), binding: LoginPageBinding()),
    GetPage(
      name: '/register',
      page: () => SignUp(),
    ),
    GetPage(
        name: '/home',
        page: () => const HomePage(),
        binding: HomePageBinding()),
    GetPage(name: '/profile', page: () => ProfilePage()),
    GetPage(
        name: '/walletonboard',
        page: () => const WalletOnboardPage(),
        binding: WalletOnboardBinding()),
    GetPage(
        name: '/stats',
        page: () => const StatsPage(),
        binding: StatsPageBinding()),
    GetPage(
        name: '/wallets',
        page: () => const WalletsPage(),
        binding: WalletHomepageBinding()),
    GetPage(
        name: '/chatgptui',
        page: () => const ChatGPTUI(),
        binding: WalletHomepageBinding()),
    GetPage(
        name: '/events',
        page: () => const BadgesUI(),
        binding: WalletHomepageBinding()),
  ];
}
