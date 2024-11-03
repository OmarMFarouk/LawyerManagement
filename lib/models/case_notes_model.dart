class CaseNote {
  String? id;
  String? vendorId;
  String? commentBody;
  String? caseId;
  String? clientId;
  String? dateAdded;

  CaseNote(
      {this.id,
      this.vendorId,
      this.commentBody,
      this.caseId,
      this.clientId,
      this.dateAdded});

  CaseNote.fromJson(Map<String, dynamic> json) {
    id = json['comment_id'];
    vendorId = json['vendor_id'];
    commentBody = json['comment_body'];
    caseId = json['case_id'];
    clientId = json['case_clientId'];
    dateAdded = json['comment_dateCreated'];
  }
}

class CaseNotesModel {
  List<CaseNote?>? notes;

  CaseNotesModel({this.notes});

  CaseNotesModel.fromJson(Map<String, dynamic> json) {
    if (json['comments'] != null) {
      notes = <CaseNote>[];
      json['comments'].forEach((v) {
        notes!.add(CaseNote.fromJson(v));
      });
    }
  }
}
