import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lawyermanagement/blocs/auth_bloc/auth_cubit.dart';
import 'package:lawyermanagement/models/bundles_model.dart';

class PaymentDropDown extends StatelessWidget {
  const PaymentDropDown({super.key, required this.items, required this.title});
  final String title;
  final List<Bundle?> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DropdownButtonFormField(
        onChanged: (value) {},
        validator: (value) {
          if (BlocProvider.of<AuthCubit>(context).selectedBundle == null) {
            return '*Choose Bundle';
          }
          return null;
        },
        items: items.map((type) {
          return DropdownMenuItem(
            onTap: () {
              BlocProvider.of<AuthCubit>(context).selectedBundle = type;
            },
            value: type!.bundleId,
            child: Row(
              children: [
                Icon(
                  type.hasOffer!
                      ? FontAwesomeIcons.fireFlameCurved
                      : Icons.subtitles_sharp,
                  color: type.hasOffer! ? Colors.deepOrange : Colors.teal[800],
                ),
                const SizedBox(width: 10),
                Text('${type.bundleTitle!} - ${type.bundlePrice!} Euros'),
              ],
            ),
          );
        }).toList(),
        decoration: InputDecoration(
          labelText: title,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
