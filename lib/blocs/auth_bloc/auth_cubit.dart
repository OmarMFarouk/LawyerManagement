import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lawyermanagement/blocs/auth_bloc/auth_states.dart';
import 'package:lawyermanagement/models/bundles_model.dart';
import 'package:lawyermanagement/models/countries_model.dart';
import 'package:lawyermanagement/models/vendor_model.dart';
import 'package:lawyermanagement/services/app_shared.dart';
import '../../services/api/auth_api.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);
  TextEditingController firstNameCont = TextEditingController();
  TextEditingController lastNameCont = TextEditingController();
  TextEditingController orgCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();
  TextEditingController phoneCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  TextEditingController confirmPasswordCont = TextEditingController();
  String choosenBundleId = '1';
  String? paymentIntentSecret;
  Bundle? selectedBundle;
  CountryModule? selectedCountry;
  String? otpCode;
  registerClient() async {
    emit(AuthInitial());
    EasyLoading.show(status: 'Waiting...', dismissOnTap: false);
    await AuthApi()
        .register(
            country: selectedCountry!.name,
            name: '${firstNameCont.text.trim()} ${lastNameCont.text.trim()}',
            email: emailCont.text.trim(),
            org: orgCont.text.trim(),
            password: passwordCont.text.trim(),
            phone: phoneCont.text.trim(),
            monthsPaid: selectedBundle!.bundleMonthsCount)
        .then((res) {
      if (res == null || res == 'error') {
        EasyLoading.dismiss();
        emit(AuthFailure('Check Internet Connections', res['error_code']));
      }
      if (res['success'] == true) {
        emit(AuthSuccess(res['message']));
        clearControllers();
        EasyLoading.dismiss();
      } else {
        EasyLoading.dismiss();
        emit(AuthFailure(res['message'], res['error_code']));
      }
    });
  }

  loginClient() async {
    otpCode = generateRandomString(6);
    emit(AuthInitial());
    EasyLoading.show(status: 'Waiting...', dismissOnTap: false);
    await AuthApi()
        .login(
      otpCode: otpCode,
      email: emailCont.text.trim(),
      password: passwordCont.text.trim(),
    )
        .then((res) {
      if (res == null || res == 'error') {
        EasyLoading.dismiss();
        emit(AuthFailure('Check Internet Connections', res['error_code']));
      }
      if (res['success'] == true) {
        currentVendor = VendorModel.fromJson(res);

        emit(AuthSuccess(res['message']));

        EasyLoading.dismiss();
      } else {
        EasyLoading.dismiss();
        emit(AuthFailure(res['message'], res['error_code']));
      }
    });
  }

  checkOTP(otp) async {
    if (otpCode == otp) {
      emit(AuthSuccess('Logged in'));
      clearControllers();
      otpCode = null;
      EasyLoading.dismiss();
    } else {
      EasyLoading.dismiss();
      emit(AuthFailure('Wrong Otp', 4));
    }
  }

  updateUserInfo() async {
    emit(AuthInitial());
    EasyLoading.show(status: 'Waiting...', dismissOnTap: false);
    await AuthApi()
        .updateUserInfo(
      orgName: orgCont.text.trim(),
      phone: phoneCont.text.trim(),
      fullName: firstNameCont.text.trim(),
    )
        .then((res) {
      if (res == null || res == 'error') {
        EasyLoading.dismiss();
        emit(AuthFailure('Check Internet Connections', res['error_code']));
      }
      if (res['success'] == true) {
        currentVendor = VendorModel.fromJson(res);

        emit(AuthSuccess(res['message']));
        clearControllers();
        EasyLoading.dismiss();
      } else {
        EasyLoading.dismiss();
        emit(AuthFailure(res['message'], res['error_code']));
      }
    });
  }

  refreshState() {
    emit(AuthInitial());
  }

  clearControllers() {
    orgCont.clear();
    firstNameCont.clear();
    lastNameCont.clear();
    passwordCont.clear();
    confirmPasswordCont.clear();
    selectedCountry = null;
    selectedBundle = null;
    emailCont.clear();
    phoneCont.clear();
  }
}

late VendorModel? currentVendor;
String generateRandomString(int length) {
  const charSet = '0123456789';
  final random = Random();
  return String.fromCharCodes(
    Iterable.generate(
      length,
      (_) => charSet.codeUnits[random.nextInt(charSet.length)],
    ),
  );
}
