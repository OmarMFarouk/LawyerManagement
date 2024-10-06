import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyermanagement/blocs/case_bloc/case_cubit.dart';
import 'package:lawyermanagement/models/clients_dropdown_model.dart';
import 'package:lawyermanagement/services/api/clients_api.dart';
import 'package:searchfield/searchfield.dart';

class ClientSearchDropDown extends StatelessWidget {
  const ClientSearchDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: FutureBuilder(
            future: ClientsApi().fetchDropDownClients(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                ClientsDropDownModel dropDownData =
                    ClientsDropDownModel.fromJson(snapshot.data);
                return SearchField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '*Empty';
                      }
                      return null;
                    },
                    onTap: () {},
                    onSuggestionTap: (e) {
                      BlocProvider.of<CaseCubit>(context).selectedClient =
                          e.item;
                    },
                    searchInputDecoration: SearchInputDecoration(
                        hintText: 'Select a client...',
                        hintStyle: const TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                    suggestions: dropDownData.clients!
                        .map((e) => SearchFieldListItem(e!.clientname!,
                            item: e, child: Text(e.clientname!)))
                        .toList());
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}
