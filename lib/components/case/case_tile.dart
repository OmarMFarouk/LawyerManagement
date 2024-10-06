import 'package:flutter/material.dart';
import 'package:lawyermanagement/modules/program_screens/case_details.dart';
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
      hoverColor: Colors.indigo[50], // Hover effect color
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Better padding for readability
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Row(
                  children: [
                    const Icon(Icons.description, color: Colors.indigo), // Icon for case subject
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        caseDetails.caseSubject!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    const Icon(Icons.confirmation_number, color: Colors.green), // Icon for case number
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        caseDetails.caseNumber!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    const Icon(Icons.person, color: Colors.orange), // Icon for client name
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        caseDetails.caseClientName!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    const Icon(Icons.category, color: Colors.blue), // Icon for case type
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        caseDetails.caseType!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
