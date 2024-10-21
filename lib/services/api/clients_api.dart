import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:lawyermanagement/blocs/auth_bloc/auth_cubit.dart';
import 'package:lawyermanagement/models/clients_model.dart';
import 'package:lawyermanagement/services/api/endpoints.dart';

class ClientsApi {
  Future fetchDropDownClients() async {
    try {
      var request = await http.post(Uri.parse(ApiEndPoints.showClientsDropDown),
          body: {'vendor_id': currentVendor!.vendordetails!.vendorid});
      if (request.statusCode < 300) {
        var response = jsonDecode(request.body);
        return response;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future fetchClients() async {
    try {
      var request = await http.post(Uri.parse(ApiEndPoints.showClients),
          body: {'vendor_id': currentVendor!.vendordetails!.vendorid});
      if (request.statusCode < 300) {
        var response = jsonDecode(request.body);
        return response;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future addClient({required Client model}) async {
    try {
      var request = await http.post(Uri.parse(ApiEndPoints.addClient),
          body: model.toJson());
      if (request.statusCode < 300) {
        print(request.body);
        var response = jsonDecode(request.body);
        return response;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future deleteClient({required clientId}) async {
    try {
      var request = await http.post(Uri.parse(ApiEndPoints.deleteClient),
          body: {
            'vendor_id': currentVendor!.vendordetails!.vendorid,
            'client_id': clientId
          });
      if (request.statusCode < 300) {
        var response = jsonDecode(request.body);
        return response;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
