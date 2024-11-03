import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../blocs/case_bloc/case_cubit.dart';
import '../general/my_field.dart';

class CommentFB extends StatelessWidget {
  const CommentFB(
      {super.key,
      required this.caseId,
      required this.caseClientId,
      required this.cubit});

  final CaseCubit cubit;
  final String caseId, caseClientId;
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Add Comment',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[800],
                                ),
                              ),
                              const SizedBox(height: 20),
                              MyField(
                                  label: 'Write a comment...',
                                  controller: cubit.noteCont),
                              const SizedBox(height: 30),
                              Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (cubit.noteCont.text.isNotEmpty) {
                                      cubit.addComment(
                                          caseId: caseId,
                                          caseClientId: caseClientId);
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
                );
              });
        },
        label: const Text(
          'Add Note',
          style: TextStyle(color: CupertinoColors.white, fontSize: 18),
        ),
        icon: const Icon(
          Icons.comment_bank_rounded,
          size: 27,
          color: Colors.white,
        ),
      ),
    );
  }
}
