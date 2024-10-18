import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyermanagement/layout/cubit/cubit.dart';
import 'package:lawyermanagement/layout/cubit/states.dart';

class LayoutProgramScreen extends StatelessWidget {
  const LayoutProgramScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WebCubit(),
      child: BlocConsumer<WebCubit, WebStates>(
          builder: (context, state) => Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.grey[200]!,
                  Colors.grey[300]!,
                  Colors.grey[400]!,
                  Colors.grey[500]!,
                ], end: Alignment.topRight, begin: Alignment.bottomLeft)),
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: WebCubit.get(context)
                      .appBarItem[WebCubit.get(context).currentIndexProgram],
                  bottomNavigationBar: BottomNavigationBar(
                    items: WebCubit.get(context).bottomNavItemsProgram,
                    currentIndex: WebCubit.get(context).currentIndexProgram,
                    onTap: (index) {
                      WebCubit.get(context).changeBottom(index);
                    },
                    selectedIconTheme: const IconThemeData(size: 35),
                    selectedFontSize: 17,
                  ),
                  body: WebCubit.get(context).screensProgram[
                      WebCubit.get(context).currentIndexProgram],
                ),
              ),
          listener: (context, state) {}),
    );
  }
}
