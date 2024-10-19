import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:lawyermanagement/blocs/auth_bloc/auth_cubit.dart';
import 'package:lawyermanagement/services/api/endpoints.dart';

class AuthApi {
  Future updateUserInfo({
    required fullName,
    required orgName,
    required phone,
  }) async {
    try {
      var request =
          await http.post(Uri.parse(ApiEndPoints.updateUserInfo), body: {
        'api_key': ApiEndPoints.apiKey,
        'phone': phone,
        'org_name': orgName,
        'full_name': fullName,
        'vendor_id': currentVendor!.vendordetails!.vendorid,
      });
      if (request.statusCode < 300) {
        var response = jsonDecode(request.body);
        return response;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future register(
      {required org,
      required password,
      required name,
      required email,
      required phone,
      required country,
      required monthsPaid}) async {
    try {
      var request = await http.post(Uri.parse(ApiEndPoints.register), body: {
        'api_key': ApiEndPoints.apiKey,
        'organization': org,
        'name': name,
        'password': password,
        'email': email,
        'phone': phone,
        'country': country,
        'months_paid': monthsPaid
      });
      if (request.statusCode < 300) {
        var response = jsonDecode(request.body);
        return response;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future login({
    required password,
    required email,
    required otpCode,
  }) async {
    try {
      var request = await http.post(Uri.parse(ApiEndPoints.login), body: {
        'api_key': ApiEndPoints.apiKey,
        'password': password,
        'otp_code': otpCode,
        'email': email,
      });
      if (request.statusCode < 300) {
        var response = jsonDecode(request.body);
        return response;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future checkAuth({
    required email,
  }) async {
    try {
      var request = await http.post(Uri.parse(ApiEndPoints.checkAuth),
          body: {'email': email, 'api_key': ApiEndPoints.apiKey});
      if (request.statusCode < 300) {
        var response = jsonDecode(request.body);
        return bool.parse(response['exist'].toString());
      } else {
        return 'error';
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future checkRenewal({
    required email,
  }) async {
    try {
      var request = await http.post(Uri.parse(ApiEndPoints.checkRenewal),
          body: {'email': email, 'api_key': ApiEndPoints.apiKey});
      if (request.statusCode < 300) {
        var response = jsonDecode(request.body);
        return bool.parse(response['exist'].toString());
      } else {
        return 'error';
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
