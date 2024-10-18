import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyermanagement/blocs/auth_bloc/auth_cubit.dart';
import 'package:lawyermanagement/layout/cubit/states.dart';
import 'package:lawyermanagement/modules/landing_screens/about_us.dart';
import 'package:lawyermanagement/modules/landing_screens/menu.dart';
import 'package:lawyermanagement/modules/landing_screens/prices.dart';
import 'package:lawyermanagement/modules/program_screens/case.dart';
import 'package:lawyermanagement/modules/program_screens/clients.dart';
import 'package:lawyermanagement/modules/program_screens/login.dart';
import 'package:lawyermanagement/modules/program_screens/settings.dart';

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
  void index0() {
    currentIndex = 0;
    emit(WebBarProgramStates());
  }

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
    const SettingScreen()
  ];

  final List<AppBar> appBarItem = [
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
          child: Builder(
            builder: (BuildContext context) {
              return IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context, // This context is correctly scoped
                    builder: (BuildContext context) {
                      return SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Update Information',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.indigo[800],
                                ),
                              ),
                              const SizedBox(height: 20),
                              TextField(
                                controller: TextEditingController(
                                    text: currentVendor!
                                        .vendordetails!.vendororganizationName),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                      CupertinoIcons.building_2_fill,
                                      color: Colors.indigo[800]),
                                  labelText: 'Organization Name',
                                  border: const OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.indigo[800]!, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey[400]!, width: 1.0),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                controller: TextEditingController(
                                    text: currentVendor!
                                        .vendordetails!.vendorname),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(CupertinoIcons.person_alt,
                                      color: Colors.indigo[800]),
                                  labelText: 'Full Name',
                                  border: const OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.indigo[800]!, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey[400]!, width: 1.0),
                                  ),
                                ),
                                keyboardType: TextInputType.phone,
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                controller: TextEditingController(
                                    text: currentVendor!
                                        .vendordetails!.vendoremail),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(CupertinoIcons.mail_solid,
                                      color: Colors.indigo[800]),
                                  labelText: 'Email',
                                  border: const OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.indigo[800]!, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey[400]!, width: 1.0),
                                  ),
                                ),
                                keyboardType: TextInputType.phone,
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Text('Left',
                                      style: TextStyle(fontSize: 18)),
                                  Text(
                                    calcRemaining(),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () {
                                  // Your update logic here
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.indigo[800], // Button color
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 12),
                                  textStyle: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.update,
                                        color:
                                            Colors.white), // Add an update icon
                                    SizedBox(width: 8),
                                    Text(
                                      'Update',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                icon: const Icon(
                  CupertinoIcons.person_alt_circle_fill,
                  size: 35,
                  color: Colors.white,
                ),
              );
            },
          ),
        ),
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

calcRemaining() {
  DateTime endDate = DateTime.parse(
      currentVendor!.vendordetails!.vendorendDate!.split(' ').first);
  DateTime now = DateTime.now();
  String remaining = endDate.difference(now).inDays.toString();
  return '$remaining days';
}
