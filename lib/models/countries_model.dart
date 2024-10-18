/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
import 'dart:convert';

import 'package:flutter/services.dart';

class CountryModule {
  String? name;
  String? code;

  CountryModule({this.name, this.code});

  CountryModule.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
  }
}

class CountryModel {
  List<CountryModule?>? countries;
  CountryModel({this.countries});
  CountryModel.fromJson(Map<String, dynamic> json) {
    if (json['countries'] != null) {
      countries = <CountryModule>[];
      json['countries'].forEach((v) {
        countries!.add(CountryModule.fromJson(v));
      });
    }
  }
  static fetchCountries() async {
    final String response = await rootBundle.loadString('countries.json');
    final data = await jsonDecode(response);
    countryModel = CountryModel.fromJson(data);
  }
}

late CountryModel countryModel;
