class Case {
  String? caseId;
  String? vendorId;
  String? caseSubject;
  String? caseType;
  String? caseNumber;
  String? caseArchiveNumber;
  String? caseCountry;
  String? caseCourtChamber;
  String? caseClientId;
  String? caseClientName;
  String? dateCreated;
  String? dateModified;

  Case(
      {this.caseId,
      this.vendorId,
      this.caseSubject,
      this.caseType,
      this.caseNumber,
      this.caseArchiveNumber,
      this.caseCountry,
      this.caseCourtChamber,
      this.caseClientId,
      this.caseClientName,
      this.dateCreated,
      this.dateModified});

  Case.fromJson(Map<String, dynamic> json) {
    caseId = json['case_id'];
    vendorId = json['vendor_id'];
    caseSubject = json['case_subject'];
    caseType = json['case_type'];
    caseNumber = json['case_number'];
    caseArchiveNumber = json['case_archiveNumber'];
    caseCountry = json['case_country'];
    caseCourtChamber = json['case_courtChamber'];
    caseClientId = json['case_clientId'];
    caseClientName = json['case_clientName'];
    dateCreated = json['case_dateCreated'];
    dateModified = json['case_dateModified'];
  }

  Map<String, String> toJson() {
    final Map<String, String> data = <String, String>{};
    data['vendor_id'] = vendorId!;
    data['case_subject'] = caseSubject!;
    data['case_type'] = caseType!;
    data['case_number'] = caseNumber!;
    data['case_archiveNumber'] = caseArchiveNumber!;
    data['case_country'] = caseCountry!;
    data['case_courtChamber'] = caseCourtChamber!;
    data['case_clientId'] = caseClientId!;
    return data;
  }
}

class CasesModel {
  List<Case?>? cases;

  CasesModel({this.cases});

  CasesModel.fromJson(Map<String, dynamic> json) {
    if (json['cases'] != null) {
      cases = <Case>[];
      json['cases'].forEach((v) {
        cases!.add(Case.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cases'] = cases?.map((v) => v?.toJson()).toList();
    return data;
  }
}
