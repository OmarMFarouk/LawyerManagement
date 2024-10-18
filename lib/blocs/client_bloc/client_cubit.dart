import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:lawyermanagement/blocs/auth_bloc/auth_cubit.dart';
import 'package:lawyermanagement/models/clients_model.dart';
import 'package:lawyermanagement/services/api/Clients_api.dart';

import 'client_states.dart';

class ClientCubit extends Cubit<ClientStates> {
  ClientCubit() : super(ClientInitial());
  static ClientCubit get(context) => BlocProvider.of(context);
  TextEditingController clientName = TextEditingController();
  TextEditingController clientPhone = TextEditingController();
  TextEditingController clientEmail = TextEditingController();
  ClientsModel? clientsModel;
  List<Client> searchList = [];
  fetchClients() async {
    emit(ClientLoading());
    try {
      await ClientsApi().fetchClients().then((res) {
        clientsModel = ClientsModel.fromJson(res);
        emit(ClientInitial());
      });
    } catch (e) {
      emit(ClientFailure());
    }
  }

  addClient() async {
    Client newClient = Client(
        vendorId: currentVendor!.vendordetails!.vendorid,
        clientPhone: clientPhone.text.trim(),
        clientName: clientName.text.trim(),
        clientEmail: clientEmail.text.trim());
    emit(ClientLoading());
    EasyLoading.show(status: 'Adding...', dismissOnTap: true);
    await ClientsApi().addClient(model: newClient).then((res) {
      if (res['success'] == true) {
        emit(ClientAdded());
        clientEmail.clear();
        clientName.clear();
        clientPhone.clear();
        EasyLoading.dismiss();
        fetchClients();
      } else {
        emit(ClientFailure());
      }
    });
  }

  void getMatch({required String query}) {
    searchList.clear();
    for (Client? clientDetails in clientsModel!.clients!) {
      if (clientDetails!.clientName!
              .toLowerCase()
              .contains(query.toLowerCase()) ||
          clientDetails.clientPhone!
              .toLowerCase()
              .contains(query.toLowerCase()) ||
          clientDetails.clientEmail!
                  .toLowerCase()
                  .contains(query.toLowerCase()) &&
              !searchList.contains(clientDetails)) {
        searchList.add(clientDetails);
      }
      if (query == "") {
        searchList.clear();
      }
    }
    emit(ClientInitial());
  }
}
