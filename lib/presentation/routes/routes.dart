import 'package:flutter/material.dart';
import 'package:job_keeper/presentation/screens/add_screen/view/add_screen.dart';
import 'package:job_keeper/presentation/screens/edit_screen/view/edit_screen.dart';
import 'package:job_keeper/presentation/screens/main_screen/view/main_screen.dart';

class Routes {
  static const main = '/main-screen';
  static const add = '/add-screen';
  static const edit = '/edit-screen';

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (context) {
        switch (routeSettings.name) {
          case main:
            return const MainScreen();
          case add:
            return const AddScreen();
          case edit:
            return const EditScreen();
          default:
            return const MainScreen();
        }
      },
    );
  }
}
