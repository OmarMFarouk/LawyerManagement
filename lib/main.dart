import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lawyermanagement/blocs/case_bloc/case_cubit.dart';
import 'package:lawyermanagement/blocs/client_bloc/client_cubit.dart';
import 'package:lawyermanagement/modules/landing_screens/layout.dart';
import 'blocs/auth_bloc/auth_cubit.dart';
import 'models/countries_model.dart';
import 'shared/bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CountryModel.fetchCountries();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CaseCubit()..fetchCases()),
        BlocProvider(create: (context) => ClientCubit()..fetchClients()),
        BlocProvider(create: (context) => AuthCubit())
      ],
      child: MaterialApp(
        builder: EasyLoading.init(),
        debugShowCheckedModeBanner: false,
        home: const LayoutScreen(),
      ),
    );
  }
}
