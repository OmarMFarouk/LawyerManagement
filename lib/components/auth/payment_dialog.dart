import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyermanagement/blocs/auth_bloc/auth_cubit.dart';
import 'payment_dropdown.dart';
import 'package:lawyermanagement/models/bundles_model.dart';
import 'package:lawyermanagement/services/api/bundle_api.dart';
import 'package:lawyermanagement/services/api/endpoints.dart';

import '../../../services/payment_gateway.dart';

class PaymentDialog extends StatelessWidget {
  const PaymentDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Set dialog dimensions based on screen size
    final dialogHeight = screenHeight * 0.4; // Adjust to occupy 40% of height on smaller screens
    final dialogWidth = screenWidth * 0.85; // Adjust to occupy 85% of width on smaller screens

    return Dialog(
      backgroundColor: Colors.grey[100],
      insetPadding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.1, // Dynamic padding based on screen width
        vertical: screenHeight * 0.15,
      ),
      child: Container(
        height: dialogHeight,
        padding: const EdgeInsets.all(15),
        width: dialogWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.grey[100]!,
              Colors.grey[200]!,
            ],
            end: Alignment.topLeft,
            begin: Alignment.bottomRight,
          ),
        ),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Payment Details',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[900],
                ),
              ),
              FutureBuilder(
                future: BundleApi().fetchBundles(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    BundlesModel bundlesModel = BundlesModel.fromJson(snapshot.data);

                    return PaymentDropDown(
                      items: bundlesModel.bundles!,
                      title: 'Choose a Bundle',
                    );
                  }
                },
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentGateway(
                          isPayment: true,
                          email: BlocProvider.of<AuthCubit>(context).emailCont.text,
                          url:
                          '${ApiEndPoints.checkOut}&months_paid=${BlocProvider.of<AuthCubit>(context).selectedBundle!.bundleMonthsCount}&email=${BlocProvider.of<AuthCubit>(context).emailCont.text}&title=${BlocProvider.of<AuthCubit>(context).selectedBundle!.bundleTitle}&price=${double.parse(BlocProvider.of<AuthCubit>(context).selectedBundle!.bundlePrice.toString())}&is_renew=false',
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal[700],
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Pay Now',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
