import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyermanagement/blocs/case_bloc/case_cubit.dart';
import 'package:lawyermanagement/blocs/case_bloc/case_states.dart';
import 'package:lawyermanagement/models/cases_model.dart';

import '../../components/case/case_floating_button.dart';
import '../../components/case/case_tile.dart';

class CaseScreen extends StatelessWidget {
  const CaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CaseCubit, CaseStates>(builder: (context, state) {
      final formKey = GlobalKey<FormState>();
      var cubit = CaseCubit.get(context);

      return Scaffold(
        backgroundColor: Colors.transparent, // Soft background color
        floatingActionButton:
            CaseFloatingButton(formKey: formKey, cubit: cubit),
        body: Card(
          color: Colors.white,
          elevation: 5,
          margin: const EdgeInsets.all(
              40), // Slightly reduced margin for better compactness
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Cases',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo, // Accent color
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 250, // Slightly increased search bar width
                      child: TextField(
                        onChanged: (value) => cubit.getMatch(query: value),
                        decoration: InputDecoration(
                          hintText: 'Find a case...',
                          prefixIcon: const Icon(CupertinoIcons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Case Subject',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600, // Semi-bold for headers
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Case Number',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Client',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Case Type',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Delete',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(),
                cubit.searchList.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: cubit.searchList.length,
                          itemBuilder: (context, index) {
                            Case caseDetails = cubit.searchList[index];
                            return CaseTile(caseDetails: caseDetails);
                          },
                        ),
                      )
                    : cubit.casesModel != null
                        ? Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: cubit.casesModel!.cases!.length,
                              itemBuilder: (context, index) {
                                Case caseDetails =
                                    cubit.casesModel!.cases![index]!;
                                return CaseTile(caseDetails: caseDetails);
                              },
                            ),
                          )
                        : const SizedBox()
              ],
            ),
          ),
        ),
      );
    }, listener: (context, state) {
      if (state is CaseAdded) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Case Added Successfully'),
          ),
        );
      }
      if (state is CaseFailure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.msg),
            backgroundColor: Colors.red,
          ),
        );
      }
    });
  }
}
