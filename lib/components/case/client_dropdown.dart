import 'package:flutter/material.dart';
import 'package:lawyermanagement/models/clients_dropdown_model.dart';
import 'package:lawyermanagement/services/api/clients_api.dart';
import 'package:searchfield/searchfield.dart';

class ClientSearchDropDown extends StatelessWidget {
  const ClientSearchDropDown(
      {super.key,
      required this.value,
      required this.onSelection,
      required this.title});
  final String title;
  final String value;
  final Function(SearchFieldListItem) onSelection;

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
                    onSuggestionTap: onSelection,
                    searchInputDecoration: SearchInputDecoration(
                        hintText: title,
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
