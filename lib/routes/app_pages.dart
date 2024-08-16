import 'package:my_first_getx_app/presentation/ui/navbar.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = {
    Routes.home: (context) => const NavbarScreen(),
  };
}
