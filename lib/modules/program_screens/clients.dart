import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyermanagement/blocs/client_bloc/client_cubit.dart';
import 'package:lawyermanagement/blocs/client_bloc/client_states.dart';
import 'package:lawyermanagement/models/clients_model.dart';

import '../../components/client/client_floating_button.dart';
import '../../components/client/client_tile.dart';

class ClientsScreen extends StatelessWidget {
  const ClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClientCubit, ClientStates>(
      listener: (context, state) {
        if (state is ClientAdded) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.green,
              content: Text('Client Added Successfully')));
        }
        if (state is ClientFailure) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Try again later...'),
            backgroundColor: Colors.red,
          ));
        }
      },
      builder: (context, state) {
        final formKey = GlobalKey<FormState>();
        var cubit = ClientCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButton:
              ClientFloatingButton(formKey: formKey, cubit: cubit),
          body: Card(
            color: Colors.white,
            elevation: 4,
            margin: const EdgeInsets.all(40),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Clients',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 250,
                        child: TextField(
                          onChanged: (value) => cubit.getMatch(query: value),
                          decoration: InputDecoration(
                            hintText: 'Search clients...',
                            hintStyle: TextStyle(
                                color: Colors.grey[600], fontSize: 16),
                            prefixIcon: const Icon(
                              CupertinoIcons.search,
                              color: Colors.indigo,
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: const [
                      Expanded(
                        child: Text(
                          'Name',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.indigo),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Phone',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.indigo),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Email',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.indigo),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Delete',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.indigo),
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
                              Client clientDetails = cubit.searchList[index];
                              return ClientTile(clientDetails: clientDetails);
                            },
                          ),
                        )
                      : cubit.clientsModel != null
                          ? Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: cubit.clientsModel!.clients!.length,
                                itemBuilder: (context, index) {
                                  Client clientDetails =
                                      cubit.clientsModel!.clients![index]!;
                                  return ClientTile(
                                      clientDetails: clientDetails);
                                },
                              ),
                            )
                          : const Expanded(
                              child: Center(
                                child: Text(
                                  'No clients found',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                ),
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
