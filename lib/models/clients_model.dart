class Client {
  String? vendorId;
  String? clientId;
  String? clientName;
  String? clientEmail;
  String? clientPhone;

  Client(
      {this.clientId,
      this.clientName,
      this.clientEmail,
      this.clientPhone,
      this.vendorId});

  Client.fromJson(Map<String, dynamic> json) {
    clientId = json['client_id'];
    clientName = json['client_name'];
    clientPhone = json['client_phone'];
    clientEmail = json['client_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vendor_id'] = vendorId;
    data['client_name'] = clientName;
    data['client_phone'] = clientPhone;
    data['client_email'] = clientEmail;
    return data;
  }
}

class ClientsModel {
  List<Client?>? clients;

  ClientsModel({this.clients});

  ClientsModel.fromJson(Map<String, dynamic> json) {
    if (json['clients'] != null) {
      clients = <Client>[];
      json['clients'].forEach((v) {
        clients!.add(Client.fromJson(v));
      });
    }
  }
}
