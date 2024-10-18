import 'dart:async';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawyermanagement/blocs/auth_bloc/auth_cubit.dart';
import 'package:lawyermanagement/services/api/auth_api.dart';
import 'package:lawyermanagement/services/api/endpoints.dart';

class PaymentGateway extends StatefulWidget {
  const PaymentGateway(
      {super.key,
      required this.isPayment,
      required this.url,
      required this.email});
  final String url, email;
  final bool isPayment;

  @override
  State<PaymentGateway> createState() => _PaymentGatewayState();
}

class _PaymentGatewayState extends State<PaymentGateway> {
  Timer? timer;
  bool loading = true;
  int ticks = 0;
  @override
  void initState() {
    html.window.open(widget.url, 'new tab');
    widget.isPayment ? paymentChecker() : renewChecker();
    super.initState();
  }

  paymentChecker() {
    timer = Timer.periodic(const Duration(seconds: 5), (s) async {
      AuthApi().checkAuth(email: widget.email).then((res) {
        if (res == true) {
          setState(() {
            loading = false;
          });
          timer!.cancel();
          BlocProvider.of<AuthCubit>(context).registerClient();
        } else {
          setState(() {
            ticks += 1;
          });
        }
      });
    });
  }

  renewChecker() {
    timer = Timer.periodic(const Duration(seconds: 5), (s) async {
      AuthApi().checkRenewal(email: widget.email).then((res) {
        if (res == true) {
          setState(() {
            loading = false;
            timer!.cancel();
          });
          Future.delayed(const Duration(seconds: 1),
              () => BlocProvider.of<AuthCubit>(context).loginClient());
        } else {
          setState(() {
            ticks += 1;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF2F388F),
        appBar: AppBar(
          backgroundColor: Colors.teal[800],
          automaticallyImplyLeading: false,
          foregroundColor: Colors.white,
          title: const Text('Payment Gateway'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            loading == true
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.teal[800],
                        color: Colors.white,
                      ),
                    ),
                  )
                : const SizedBox(),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: TextButton(
                onPressed: loading
                    ? () {}
                    : () {
                        html.window.open(ApiEndPoints.loginPortal, 'Login');
                      },
                child: Text(
                  loading == true
                      ? 'Waiting For Payment Completion...'
                      : widget.isPayment
                          ? 'Congratulations, Login Here'
                          : "Congratulations, Logging....",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 120,
            ),
            ticks >= 30
                ? Center(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          html.window.open(widget.url, 'new tab');
                        },
                        child: const Text(
                          'Something went wrong? Click here',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        ));
  }
}
