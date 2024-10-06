class VendorModel {
  bool? success;
  String? message;
  VendorDetails? vendordetails;

  VendorModel({this.success, this.message, this.vendordetails});

  VendorModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    vendordetails = json['vendor_details'] != null
        ? VendorDetails?.fromJson(json['vendor_details'])
        : null;
  }
}

class VendorDetails {
  String? vendorid;
  String? vendororganizationName;
  String? vendorname;
  String? vendorstartDate;
  String? vendorendDate;
  String? vendorphone;
  String? vendoremail;
  String? vendorcountry;
  String? vendordateCreated;
  String? vendorlastAccess;

  VendorDetails(
      {this.vendorid,
      this.vendororganizationName,
      this.vendorname,
      this.vendorstartDate,
      this.vendorendDate,
      this.vendorphone,
      this.vendoremail,
      this.vendorcountry,
      this.vendordateCreated,
      this.vendorlastAccess});

  VendorDetails.fromJson(Map<String, dynamic> json) {
    vendorid = json['vendor_id'];
    vendororganizationName = json['vendor_organizationName'];
    vendorname = json['vendor_name'];
    vendorstartDate = json['vendor_startDate'];
    vendorendDate = json['vendor_endDate'];
    vendorphone = json['vendor_phone'];
    vendoremail = json['vendor_email'];
    vendorcountry = json['vendor_country'];
    vendordateCreated = json['vendor_dateCreated'];
    vendorlastAccess = json['vendor_lastAccess'];
  }
}
