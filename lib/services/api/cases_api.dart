import 'dart:html' as html;

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:lawyermanagement/models/cases_model.dart';
import 'package:lawyermanagement/services/api/endpoints.dart';

import '../../blocs/auth_bloc/auth_cubit.dart';

class CasesApi {
  Future fetchCases() async {
    try {
      var request = await http.post(Uri.parse(ApiEndPoints.showCases),
          body: {'vendor_id': currentVendor!.vendordetails!.vendorid});
      if (request.statusCode < 300) {
        var response = jsonDecode(request.body);
        return response;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future fetchCaseFiles({caseId}) async {
    try {
      var request = await http.post(Uri.parse(ApiEndPoints.showCaseFiles),
          body: {
            'vendor_id': currentVendor!.vendordetails!.vendorid,
            'case_id': caseId
          });
      if (request.statusCode < 300) {
        var response = jsonDecode(request.body);
        return response;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future fetchCaseComments({caseId}) async {
    try {
      var request = await http.post(Uri.parse(ApiEndPoints.showCaseComments),
          body: {
            'vendor_id': currentVendor!.vendordetails!.vendorid,
            'case_id': caseId
          });
      if (request.statusCode < 300) {
        var response = jsonDecode(request.body);
        return response;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future addCase(
      {required Case model,
      required fileData,
      required fileName,
      required fileSize}) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(ApiEndPoints.addCase),
      );
      Map<String, String> data = model.toJson();
      request.fields.addAll(data);
      request.files.add(http.MultipartFile.fromBytes(
          "file", fileData as List<int>,
          filename: fileName));
      http.StreamedResponse response = await request.send();
      final respStr = await response.stream.bytesToString();
      var jsonData = await jsonDecode(respStr);
      if (response.statusCode < 300) {
        return jsonData;
      } else {
        return 'error';
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future deleteCase({required caseId}) async {
    try {
      var request = await http.post(Uri.parse(ApiEndPoints.deleteCase), body: {
        'vendor_id': currentVendor!.vendordetails!.vendorid,
        'case_id': caseId
      });
      if (request.statusCode < 300) {
        var response = jsonDecode(request.body);
        return response;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future addComment(
      {required comment, required caseId, required caseClientId}) async {
    try {
      var request = await http.post(Uri.parse(ApiEndPoints.addComment), body: {
        'vendor_id': currentVendor!.vendordetails!.vendorid,
        'case_id': caseId,
        'case_clientId': caseClientId,
        'comment': comment
      });
      if (request.statusCode < 300) {
        var response = jsonDecode(request.body);
        return response;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future addCaseFile(
      {required caseId,
      required caseClientId,
      required fileData,
      required fileName,
      required fileSize}) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(ApiEndPoints.addCaseFile),
      );
      Map<String, String> data = {
        'case_id': caseId,
        'case_clientId': caseClientId,
        'vendor_id': currentVendor!.vendordetails!.vendorid!,
      };
      request.fields.addAll(data);
      request.files.add(http.MultipartFile.fromBytes(
          "file", fileData as List<int>,
          filename: fileName));
      http.StreamedResponse response = await request.send();
      final respStr = await response.stream.bytesToString();
      var jsonData = await jsonDecode(respStr);
      if (response.statusCode < 300) {
        return jsonData;
      } else {
        return 'error';
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void downloadFile(String url) {
    html.window.open(url, '_blank');
  }
}
