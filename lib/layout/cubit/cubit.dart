import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyermanagement/layout/cubit/states.dart';
import 'package:lawyermanagement/modules/landing_screens/about_us.dart';
import 'package:lawyermanagement/modules/landing_screens/menu.dart';
import 'package:lawyermanagement/modules/landing_screens/prices.dart';
import 'package:lawyermanagement/modules/program_screens/case.dart';
import 'package:lawyermanagement/modules/program_screens/clients.dart';
import 'package:lawyermanagement/modules/program_screens/layout.dart';
import 'package:lawyermanagement/modules/program_screens/login.dart';
import 'package:lawyermanagement/modules/program_screens/settings.dart';

import '../../blocs/auth_bloc/auth_cubit.dart';

class WebCubit extends Cubit<WebStates> {
  WebCubit() : super(WebInitialStates());

  static WebCubit get(BuildContext context) =>
      BlocProvider.of<WebCubit>(context);

  int currentIndex = 0;

  final List<Widget> landingScreens = [
    const MenuScreen(),
    const PricesScreen(),
    const AboutUsScreen(),
    LoginScreen()
  ];

  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home, color: Colors.blueGrey[400]),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.price_change, color: Colors.amber[600]),
      label: 'Prices',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.info, color: Colors.teal[400]),
      label: 'About Us',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.info, color: Colors.teal[400]),
      label: 'Login',
    ),
  ];

  void changeTab(int index) {
    if (index < 0 || index >= landingScreens.length) {
      // Optionally handle invalid index
      return;
    }
    currentIndex = index;
    emit(WebBarStates());
  }

  //program

  int currentIndexProgram = 0;

  final List<Widget> screensProgram = [
    const CaseScreen(),
    const ClientsScreen(),
    const SettingScreen(),
    LoginScreen()
  ];

  final List<AppBar> appBarItem = [
    AppBar(
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: Text(
          'Dashboard',
          style: const TextStyle(color: CupertinoColors.white),
        ),
      ),
      backgroundColor: Colors.indigo[800],
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.person_alt_circle_fill,
                size: 35,
                color: Colors.white,
              )),
        )
      ],
    ),
    AppBar(
      title: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 100),
        child: Text(
          'Lawyers',
          style: TextStyle(color: CupertinoColors.white),
        ),
      ),
      backgroundColor: Colors.indigo[800],
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.person_alt_circle_fill,
                size: 35,
                color: Colors.white,
              )),
        )
      ],
    ),
    AppBar(
      title: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 100),
        child: Text(
          'Lawyers',
          style: TextStyle(color: CupertinoColors.white),
        ),
      ),
      backgroundColor: Colors.indigo[800],
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.person_alt_circle_fill,
                size: 35,
                color: Colors.white,
              )),
        )
      ],
    ),
  ];

  final List<BottomNavigationBarItem> bottomNavItemsProgram = [
    BottomNavigationBarItem(
      icon: Icon(Icons.cases, color: Colors.blueGrey[400]),
      label: 'CASE',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_3, color: Colors.amber[600]),
      label: 'CLIENTS',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.settings, color: Colors.teal[400]),
      label: 'SETTINGS',
    ),
  ];

  void changeBottom(int index) {
    currentIndexProgram = index;
    emit(WebBarProgramStates());
  }
}
