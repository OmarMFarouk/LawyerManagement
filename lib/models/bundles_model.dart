class Bundle {
  String? bundleId;
  String? bundlePrice;
  String? bundleMonthsCount;
  String? bundleTitle;
  bool? hasOffer;

  Bundle(
      {this.bundleId,
      this.bundlePrice,
      this.bundleMonthsCount,
      this.bundleTitle,
      this.hasOffer});

  Bundle.fromJson(Map<String, dynamic> json) {
    bundleId = json['bundle_id'];
    bundlePrice = json['bundle_price'];
    bundleMonthsCount = json['bundle_monthsCount'];
    bundleTitle = json['bundle_title'];
    hasOffer = bool.parse(json['bundle_hasOffer'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bundle_id'] = bundleId;
    data['bundle_price'] = bundlePrice;
    data['bundle_monthsCount'] = bundleMonthsCount;
    data['bundle_title'] = bundleTitle;
    data['bundle_hasOffer'] = hasOffer;
    return data;
  }
}

class BundlesModel {
  bool? success;
  String? message;
  List<Bundle?>? bundles;

  BundlesModel({this.success, this.message, this.bundles});

  BundlesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['bundles'] != null) {
      bundles = <Bundle>[];
      json['bundles'].forEach((v) {
        bundles!.add(Bundle.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['bundles'] = bundles?.map((v) => v?.toJson()).toList();
    return data;
  }
}
