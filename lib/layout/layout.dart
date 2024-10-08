import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lawyermanagement/layout/cubit/cubit.dart';
import 'package:lawyermanagement/layout/cubit/states.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 1116;
    final size = MediaQuery.of(context).size.width;
    final isMobile = MediaQuery.of(context).size.width > 835;
    return BlocProvider(
      create: (context) => WebCubit(),
      child: BlocConsumer<WebCubit, WebStates>(
        builder: (context, state) {
          final cubit = WebCubit.get(context);
          return Scaffold(
            body: Stack(
              children: [
                Positioned.fill(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 700),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    child: cubit.landingScreens[cubit
                        .currentIndex], // This will change and trigger animation
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 100,
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 40),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.grey[400]!.withOpacity(0.7),
                          Colors.grey[600]!.withOpacity(0.7)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        isMobile
                            ? InkWell(
                                onTap: () {
                                  print(size);
                                },
                                child: const Image(
                                  image: AssetImage(
                                    'images/V__3_-removebg-preview.png',
                                  ),
                                  width: 300,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Expanded(
                                flex: 2,
                                child: InkWell(
                                  onTap: () {
                                    print(size);
                                  },
                                  child: const Image(
                                    image: AssetImage(
                                      'images/V__3_-removebg-preview.png',
                                    ),
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                        isDesktop
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Contact Us',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Container(
                                    width: 2,
                                    height: 24,
                                    color: Colors.grey[600],
                                  ),
                                  const SizedBox(width: 15),
                                  IconButton(
                                    icon: Icon(FontAwesomeIcons.facebookF,
                                        color: Colors.blue[900]),
                                    onPressed: () {},
                                  ),
                                  const SizedBox(width: 10),
                                  IconButton(
                                    icon: const Icon(FontAwesomeIcons.twitter,
                                        color: Colors.blueAccent),
                                    onPressed: () {
                                      // Implement your Twitter link
                                    },
                                  ),
                                  const SizedBox(width: 10),
                                  IconButton(
                                    icon: Icon(FontAwesomeIcons.linkedinIn,
                                        color: Colors.blue[900]),
                                    onPressed: () {
                                      // Implement your LinkedIn link
                                    },
                                  ),
                                  const SizedBox(width: 10),
                                  IconButton(
                                    icon: Icon(FontAwesomeIcons.whatsapp,
                                        color: Colors.green[700]),
                                    onPressed: () {
                                      // Implement your WhatsApp link
                                    },
                                  ),
                                  const SizedBox(width: 10),
                                  IconButton(
                                    icon: const Icon(FontAwesomeIcons.phone,
                                        color: Colors.indigo),
                                    onPressed: () {
                                      // Implement your phone call action
                                    },
                                  ),
                                ],
                              )
                            : Container(),
                        isDesktop
                            ? BottomAppBar(
                                color: Colors.transparent,
                                child: Row(
                                  children: cubit.bottomNavItems.map((item) {
                                    int index =
                                        cubit.bottomNavItems.indexOf(item);
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: MaterialButton(
                                        hoverColor:
                                            Colors.teal.withOpacity(0.2),
                                        splashColor:
                                            Colors.tealAccent.withOpacity(0.3),
                                        highlightColor:
                                            Colors.tealAccent.withOpacity(0.5),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Row(
                                          children: [
                                            const SizedBox(width: 8),
                                            Text(
                                              item.label ?? '',
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 1.2,
                                                shadows: [
                                                  Shadow(
                                                    offset:
                                                        const Offset(2.0, 2.0),
                                                    blurRadius: 4.0,
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        onPressed: () => cubit.changeTab(index),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              )
                            : Expanded(
                                flex: 10,
                                child: BottomAppBar(
                                  color: Colors.transparent,
                                  child: Row(
                                    children: cubit.bottomNavItems.map((item) {
                                      int index =
                                          cubit.bottomNavItems.indexOf(item);
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: MaterialButton(
                                          hoverColor:
                                              Colors.teal.withOpacity(0.2),
                                          splashColor: Colors.tealAccent
                                              .withOpacity(0.3),
                                          highlightColor: Colors.tealAccent
                                              .withOpacity(0.5),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Row(
                                            children: [
                                              const SizedBox(width: 8),
                                              Text(
                                                item.label ?? '',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 1.2,
                                                  shadows: [
                                                    Shadow(
                                                      offset: const Offset(
                                                          2.0, 2.0),
                                                      blurRadius: 4.0,
                                                      color: Colors.black
                                                          .withOpacity(0.5),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          onPressed: () =>
                                              cubit.changeTab(index),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
