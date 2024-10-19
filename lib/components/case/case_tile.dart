import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyermanagement/modules/program_screens/case_details.dart';
import '../../blocs/case_bloc/case_cubit.dart';
import '../../models/cases_model.dart';

class CaseTile extends StatelessWidget {
  const CaseTile({
    super.key,
    required this.caseDetails,
  });

  final Case caseDetails;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CaseDetailsScreen(caseDetails: caseDetails),
        ),
      ),
      hoverColor: Colors.indigo[50],
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Use a threshold to determine when to switch layout
              bool isNarrow = constraints.maxWidth < 600;
              return isNarrow
                  ? _buildColumnLayout(context)
                  : _buildRowLayout(context);
            },
          ),
        ),
      ),
    );
  }

  Column _buildColumnLayout(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildCaseInfoRow(
            Icons.description, Colors.indigo, caseDetails.caseSubject!),
        const SizedBox(height: 10),
        _buildCaseInfoRow(
            Icons.confirmation_number, Colors.green, caseDetails.caseNumber!),
        const SizedBox(height: 10),
        _buildCaseInfoRow(
            Icons.person, Colors.orange, caseDetails.caseClientName!),
        const SizedBox(height: 10),
        _buildCaseInfoRow(Icons.category, Colors.blue, caseDetails.caseType!),
        const SizedBox(height: 10),
      ],
    );
  }

  Row _buildRowLayout(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: _buildCaseInfoRow(
                Icons.description, Colors.indigo, caseDetails.caseSubject!)),
        Expanded(
            child: _buildCaseInfoRow(Icons.confirmation_number, Colors.green,
                caseDetails.caseNumber!)),
        Expanded(
            child: _buildCaseInfoRow(
                Icons.person, Colors.orange, caseDetails.caseClientName!)),
        Expanded(
            child: _buildCaseInfoRow(
                Icons.category, Colors.blue, caseDetails.caseType!)),
        Expanded(
          child: TextButton.icon(
            onPressed: () {
              BlocProvider.of<CaseCubit>(context)
                  .deleteCase(caseId: caseDetails.caseId);
            },
            label: const Text('Delete'),
            icon: const Icon(
              CupertinoIcons.delete,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCaseInfoRow(IconData icon, Color iconColor, String text) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
