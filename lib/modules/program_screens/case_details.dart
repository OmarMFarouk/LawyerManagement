import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lawyermanagement/blocs/case_bloc/case_cubit.dart';
import 'package:lawyermanagement/blocs/case_bloc/case_states.dart';
import 'package:lawyermanagement/components/case_details/case_details_fb.dart';
import 'package:lawyermanagement/models/case_files_model.dart';
import 'package:lawyermanagement/models/cases_model.dart';
import 'package:lawyermanagement/services/api/cases_api.dart';

import '../../blocs/client_bloc/client_states.dart';

class CaseDetailsScreen extends StatelessWidget {
  const CaseDetailsScreen({super.key, required this.caseDetails});
  final Case caseDetails;

  double getResponsiveFontSize(BuildContext context, double size) {
    return size * MediaQuery.of(context).textScaleFactor;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CaseCubit, CaseStates>(
      listener: (context, state) {
        if (state is ClientAdded) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.green,
              content: Text('Client Added Successfully')));
        }
        if (state is ClientFailure) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Try again later..'),
            backgroundColor: Colors.red,
          ));
        }
      },
      builder: (context, state) {
        var cubit = CaseCubit.get(context);
        final screenWidth = MediaQuery.of(context).size.width;

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Case Details',
              style: TextStyle(
                color: Colors.white,
                fontSize: getResponsiveFontSize(context, 20),
              ),
            ),
            backgroundColor: Colors.indigo[800],
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.person_alt_circle_fill,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: const Color(0xfff5f5f5),
          floatingActionButton: CaseDetailsFB(
            caseId: caseDetails.caseId!,
            cubit: cubit,
            caseClientId: caseDetails.caseClientId!,
          ),
          body: Card(
            color: Colors.white,
            elevation: 3,
            margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Case Information',
                        style: TextStyle(
                          fontSize: getResponsiveFontSize(context, 22),
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FontAwesomeIcons.share,
                          color: Colors.indigo,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          leading: const Icon(Icons.subject, color: Colors.indigo),
                          title: Text(
                            'Case Subject',
                            style: TextStyle(fontSize: getResponsiveFontSize(context, 16)),
                          ),
                          subtitle: Text(caseDetails.caseSubject!),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          leading: const Icon(Icons.confirmation_number, color: Colors.green),
                          title: Text(
                            'Case Number',
                            style: TextStyle(fontSize: getResponsiveFontSize(context, 16)),
                          ),
                          subtitle: Text(caseDetails.caseNumber!),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          leading: const Icon(Icons.person, color: Colors.orange),
                          title: Text(
                            'Client',
                            style: TextStyle(fontSize: getResponsiveFontSize(context, 16)),
                          ),
                          subtitle: Text(caseDetails.caseClientName!),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          leading: const Icon(Icons.category, color: Colors.blue),
                          title: Text(
                            'Case Type',
                            style: TextStyle(fontSize: getResponsiveFontSize(context, 16)),
                          ),
                          subtitle: Text(caseDetails.caseType!),
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  const SizedBox(height: 10),

                  // Case Files Section
                  Text(
                    'Case Files',
                    style: TextStyle(
                      fontSize: getResponsiveFontSize(context, 18),
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: FutureBuilder(
                      future: CasesApi().fetchCaseFiles(caseId: caseDetails.caseId),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          CaseFilesModel caseFiles = CaseFilesModel.fromJson(snapshot.data);
                          return GridView.builder(
                            itemCount: caseFiles.files!.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                              crossAxisCount: screenWidth > 600 ? 4 : 2, // Responsive columns
                              childAspectRatio: 2 / 1,
                            ),
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                CasesApi().downloadFile(caseFiles.files![index]!.filepath!);
                              },
                              child: Ink(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.indigo[50],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'File ${index + 1}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(caseFiles.files![index]!.filedateAdded!),
                                    const Spacer(),
                                    Text(
                                      caseFiles.files![index]!.filepath!
                                          .split('.')
                                          .last
                                          .toUpperCase(),
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
