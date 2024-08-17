import 'package:go_router/go_router.dart';
import 'package:shoping_app/views/cart_screen/cart.dart';
import 'package:shoping_app/views/account_info/account_info_screen.dart';
import 'package:shoping_app/views/accuont_screen/accuont_screen.dart';
import 'package:shoping_app/views/buy_now/buy_screen.dart';
import 'package:shoping_app/views/categories_screen/categories_screen.dart';
import 'package:shoping_app/views/create_accunt/create_screen.dart';
import 'package:shoping_app/views/explore_screen/explore_screen.dart';
import 'package:shoping_app/views/login/login_screen.dart';
import 'package:shoping_app/views/home_screen/home_screen.dart';
import 'package:shoping_app/views/otp_screen/otp_screen.dart';
import 'package:shoping_app/views/payment/payment_screen.dart';
import 'package:shoping_app/views/shop_screen/shop_sceen.dart';
import 'package:shoping_app/views/splash_screen/splash_screen.dart';

class Routes {
  static String initial = '/';
  static String splashScreen = '/splash';
  static String createAccount = '/create';
  static String loginScreen = '/login';
  static String otpScreen = '/otp';
  static String homeScreen = '/home_screen';
  static String mycart = '/mycart';
  static String accountInfo = '/accountInfo';
  static String account = '/account';
  static String payment = '/payment';
  static String categories = '/categories';
  static String shop = '/shopScreen';
  static String explore = '/explore';
   static String buy = '/buy';

GoRouter get router => _goRouter;

  final GoRouter _goRouter = GoRouter(
     initialLocation: splashScreen,
      
    routes: [
      GoRoute(
        path: splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: createAccount,
        builder: (context, state) => const Create(),
      ),
      GoRoute(
        path: loginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: otpScreen,
        builder: (context, state) => const OtpScreen(),
      ),
      GoRoute(
        path: homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: mycart,
        builder: (context, state) => const MyCart(),
      ),
      GoRoute(
        path: accountInfo,
        builder: (context, state) => AccountInformationScreen(),
      ),
      GoRoute(
        path: account,
        builder: (context, state) => const AccuntScreen(),
      ),
      GoRoute(
        path: payment,
        builder: (context, state) => const PaymentScreen(),
      ),
        GoRoute(
        path: categories,
        builder: (context, state) => const CategoriesScreen(),
      ),
      GoRoute(
        path: shop,
        builder: (context, state) => const ShopScreen(itemName: '',),
      ),
        GoRoute(
        path: explore,
        builder: (context, state) => const ExploreScreen(),
      ),
       GoRoute(
        path: buy,
        builder: (context, state) => const Buy(),
      ),
    ],
  );
  
   
  }

