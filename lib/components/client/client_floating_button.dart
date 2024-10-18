import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../blocs/client_bloc/client_cubit.dart';
import '../general/my_field.dart';

class ClientFloatingButton extends StatelessWidget {
  const ClientFloatingButton({
    super.key,
    required this.formKey,
    required this.cubit,
  });

  final GlobalKey<FormState> formKey;
  final ClientCubit cubit;

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
            builder: (context) => Dialog(
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
                            'Add Client',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                            ),
                          ),
                          const SizedBox(height: 20),
                          MyField(label: 'Name', controller: cubit.clientName),
                          const SizedBox(height: 16),
                          MyField(label: 'Phone', controller: cubit.clientPhone),
                          const SizedBox(height: 16),
                          MyField(label: 'Email', controller: cubit.clientEmail),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  cubit.addClient();
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
        },
        label: const Text(
          'Add Client',
          style: TextStyle(color: CupertinoColors.white, fontSize: 18),
        ),
        icon: const Icon(
          Icons.person,
          size: 27,
          color: Colors.white,
        ),
      ),
    );
  }
}
