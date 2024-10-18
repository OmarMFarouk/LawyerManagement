class CaseFile {
  String? fileid;
  String? vendorid;
  String? filepath;
  String? caseid;
  String? clientid;
  String? filedateAdded;

  CaseFile(
      {this.fileid,
      this.vendorid,
      this.filepath,
      this.caseid,
      this.clientid,
      this.filedateAdded});

  CaseFile.fromJson(Map<String, dynamic> json) {
    fileid = json['file_id'];
    vendorid = json['vendor_id'];
    filepath = json['file_path'];
    caseid = json['case_id'];
    clientid = json['client_id'];
    filedateAdded = json['file_dateAdded'];
  }
}

class CaseFilesModel {
  List<CaseFile?>? files;

  CaseFilesModel({this.files});

  CaseFilesModel.fromJson(Map<String, dynamic> json) {
    if (json['files'] != null) {
      files = <CaseFile>[];
      json['files'].forEach((v) {
        files!.add(CaseFile.fromJson(v));
      });
    }
  }
}
