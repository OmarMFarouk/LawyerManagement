import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:lawyermanagement/services/api/endpoints.dart';

class BundleApi {
  Future fetchBundles() async {
    try {
      var request = await http.post(Uri.parse(ApiEndPoints.showBundles), body: {
        'api_key': ApiEndPoints.apiKey,
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
