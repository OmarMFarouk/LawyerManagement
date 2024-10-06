/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class ClientDropDownItem {
  String? clientid;
  String? clientname;

  ClientDropDownItem({this.clientid, this.clientname});

  ClientDropDownItem.fromJson(Map<String, dynamic> json) {
    clientid = json['client_id'];
    clientname = json['client_name'];
  }
}

class ClientsDropDownModel {
  List<ClientDropDownItem?>? clients;

  ClientsDropDownModel({this.clients});

  ClientsDropDownModel.fromJson(Map<String, dynamic> json) {
    if (json['clients'] != null) {
      clients = <ClientDropDownItem>[];
      json['clients'].forEach((v) {
        clients!.add(ClientDropDownItem.fromJson(v));
      });
    }
  }
}
