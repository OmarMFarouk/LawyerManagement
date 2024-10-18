import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lawyermanagement/components/auth/countries_dropdown.dart';
import 'package:lawyermanagement/models/countries_model.dart';

import '../../blocs/case_bloc/case_cubit.dart';
import '../general/my_field.dart';
import 'client_dropdown.dart';

class CaseFloatingButton extends StatelessWidget {
  const CaseFloatingButton(
      {super.key, required this.formKey, required this.cubit});

  final GlobalKey<FormState> formKey;
  final CaseCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.indigo[900], borderRadius: BorderRadius.circular(50)),
      child: TextButton.icon(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return StatefulBuilder(
                  builder: (context, StateSetter setState) => Dialog(
                    child: SingleChildScrollView(
                      child: Card(
                        margin: const EdgeInsets.all(20),
                        color: Colors.white,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Add Case',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[800],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                ClientSearchDropDown(
                                    value: 'value',
                                    onSelection: (p0) =>
                                        cubit.clientId = p0.item.clientid,
                                    title: 'Select a client..'),
                                const SizedBox(height: 16),
                                MyField(
                                    label: 'Case Subject',
                                    controller: cubit.subjectCont),
                                const SizedBox(height: 16),
                                MyField(
                                    label: 'Case Type',
                                    controller: cubit.typeCont),
                                const SizedBox(height: 16),
                                MyField(
                                    label: 'Case Number',
                                    controller: cubit.caseNumberCont),
                                const SizedBox(height: 16),
                                MyField(
                                    label: 'Archive Number',
                                    controller: cubit.archiveNumberCont),
                                const SizedBox(height: 16),
                                CountriesDropDown(
                                    isDashboard: true,
                                    items: countryModel.countries!,
                                    title: 'Country'),
                                const SizedBox(height: 16),
                                MyField(
                                    label: 'Court Chamber',
                                    controller: cubit.courtChamberCont),
                                const SizedBox(height: 16),
                                InkWell(
                                  onTap: () async {
                                    await cubit.pickFile();
                                    setState(() {});
                                  },
                                  child: Ink(
                                    height: 50,
                                    padding: const EdgeInsets.all(10),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFEBEBEB),
                                        border: Border.all(),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        cubit.pickedFile == null
                                            ? const Text('Choose File')
                                            : Text(cubit.pickedFile!.name),
                                        const Icon(Icons.upload_file)
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                MyField(
                                    label: 'Notes', controller: cubit.noteCont),
                                const SizedBox(height: 30),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (formKey.currentState!.validate() &&
                                          cubit.clientId.isNotEmpty) {
                                        cubit.addCase();
                                        Navigator.pop(context);
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blueGrey,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16, horizontal: 32),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: const Text(
                                      'Submit',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              });
        },
        label: const Text(
          'Add Case',
          style: TextStyle(color: CupertinoColors.white, fontSize: 18),
        ),
        icon: const Icon(
          Icons.balance,
          size: 27,
          color: Colors.white,
        ),
      ),
    );
  }
}
