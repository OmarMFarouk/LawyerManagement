import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyermanagement/blocs/auth_bloc/auth_cubit.dart';
import 'package:lawyermanagement/blocs/auth_bloc/auth_states.dart';
import 'package:restart_app/restart_app.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final DateTime lastDayOfMonth = DateTime(now.year, now.month + 1, 0);
    final int remainingDays = lastDayOfMonth.difference(now).inDays;

    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('Updated Successfully'),
            ),
          );
        }
        if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.msg),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Card(
              color: Colors.white,
              elevation: 4,
              margin: const EdgeInsets.all(40),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'There are $remainingDays days left in the month',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Update Profile",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildTextField(
                        label: "Full Name", cont: cubit.firstNameCont),
                    const SizedBox(height: 20),
                    _buildTextField(label: "Phone", cont: cubit.phoneCont),
                    const SizedBox(height: 20),
                    _buildTextField(
                        label: "Organization Name", cont: cubit.orgCont),
                    const SizedBox(height: 30),
                    TextButton(
                      onPressed: () async {
                        await cubit.updateUserInfo();
                        Restart.restartApp();
                      },
                      style: const ButtonStyle(
                        backgroundColor: WidgetStateColor.transparent,
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.indigo),
                        child: const Text(
                          "Save",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Restart.restartApp(),
                      style: const ButtonStyle(
                        backgroundColor: WidgetStateColor.transparent,
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey),
                        child: const Text(
                          "Logout",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField(
      {required String label, required TextEditingController cont}) {
    label == 'Phone'
        ? cont.text = currentVendor!.vendordetails!.vendorphone!
        : label == 'Full Name'
            ? cont.text = currentVendor!.vendordetails!.vendorname!
            : cont.text = currentVendor!.vendordetails!.vendororganizationName!;
    return TextField(
      controller: cont,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
