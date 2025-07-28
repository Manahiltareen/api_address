import 'package:api_address/views/home/add_address_screen.dart';
import 'package:api_address/views/home/testaddress.dart';
import 'package:get/get.dart';
import 'package:api_address/views/auth/login_screen.dart';
import 'package:api_address/views/auth/signup_screen.dart';


class Routes {
  static const login = '/login';
  static const signup = '/signup_screen';

  static const AddAddress = '/add_address_screen';
}

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: Routes.signup,
      page: () => const SignupScreen(),
    ),
    GetPage(
      name: Routes.AddAddress,
      page: () => const AddAddressScreen(),
    ),
  ];
}
