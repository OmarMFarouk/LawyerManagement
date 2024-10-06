import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyermanagement/blocs/auth_bloc/auth_cubit.dart';
import 'package:lawyermanagement/models/countries_model.dart';

class CountriesDropDown extends StatelessWidget {
  const CountriesDropDown(
      {super.key, required this.items, required this.title});
  final String title;
  final List<CountryModule?> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DropdownButtonFormField(
        onChanged: (value) {},
        validator: (value) {
          if (BlocProvider.of<AuthCubit>(context).selectedCountry == null) {
            return '*Choose Country';
          }
          return null;
        },
        items: items.map((type) {
          return DropdownMenuItem(
            onTap: () {
              BlocProvider.of<AuthCubit>(context).selectedCountry = type;
            },
            value: type!.code,
            child: Row(
              children: [
                CountryFlag.fromCountryCode(
                  type.code!,
                  height: 20,
                  width: 20,
                ),
                const SizedBox(width: 10),
                Text(type.name!),
              ],
            ),
          );
        }).toList(),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: title,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
