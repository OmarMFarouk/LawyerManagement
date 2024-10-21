import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lawyermanagement/blocs/auth_bloc/auth_cubit.dart';
import 'package:lawyermanagement/blocs/auth_bloc/auth_states.dart';
import 'package:lawyermanagement/services/api/auth_api.dart';
import 'package:url_launcher/link.dart';

import '../../modules/program_screens/layout.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _otpControllers =
      List.generate(6, (_) => TextEditingController());
  int _currentIndex = 0; // Track the current input field
  int _timerDuration = 30; // Duration for resend OTP timer
  late bool _isTimerActive;

  @override
  void initState() {
    super.initState();
    _isTimerActive = false; // Timer is initially inactive
  }

  void _startTimer() {
    setState(() {
      _isTimerActive = true;
    });
    Future.delayed(Duration(seconds: _timerDuration), () {
      setState(() {
        _isTimerActive = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.indigo[300]!, Colors.indigo[900]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: BlocConsumer<AuthCubit, AuthStates>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LayoutProgramScreen(),
                  ));
            }
            if (state is AuthFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.msg)));
            }
          },
          builder: (context, state) {
            var cubit = AuthCubit.get(context);
            final isMobile = MediaQuery.of(context).size.width > 859;
            return LayoutBuilder(
                builder: (context, constraints) => SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: IntrinsicHeight(
                          child: Column(
                            children: [
                              isMobile
                                  ? Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 80, vertical: 40),
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(30),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.9),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 10,
                                              offset: Offset(0, 5),
                                            ),
                                          ],
                                        ),
                                        child: Form(
                                          key: _formKey,
                                          child: Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Text(
                                                  'Enter the OTP',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                  textAlign: TextAlign.center,
                                                ),
                                                const SizedBox(height: 30),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children:
                                                      List.generate(6, (index) {
                                                    return SizedBox(
                                                      width: 40,
                                                      child: TextFormField(
                                                        controller:
                                                            _otpControllers[
                                                                index],
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        maxLength: 1,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                            fontSize: 24),
                                                        decoration:
                                                            InputDecoration(
                                                          counterText: '',
                                                          filled: true,
                                                          fillColor:
                                                              Colors.white,
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 2),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .blue,
                                                                    width: 2),
                                                          ),
                                                        ),
                                                        onChanged: (value) {
                                                          if (value
                                                              .isNotEmpty) {
                                                            _currentIndex = index <
                                                                    5
                                                                ? index + 1
                                                                : index; // Move to the next input
                                                            FocusScope.of(
                                                                    context)
                                                                .nextFocus();
                                                          } else {
                                                            _currentIndex = index >
                                                                    0
                                                                ? index - 1
                                                                : 0; // Move to the previous input
                                                            FocusScope.of(
                                                                    context)
                                                                .previousFocus();
                                                          }
                                                        },
                                                        validator: (value) {
                                                          if (value == null ||
                                                              value.isEmpty) {
                                                            return 'Required';
                                                          }
                                                          return null;
                                                        },
                                                      ),
                                                    );
                                                  }),
                                                ),
                                                const SizedBox(height: 30),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    if (_formKey.currentState!
                                                        .validate()) {
                                                      String s = '';
                                                      for (var element
                                                          in _otpControllers) {
                                                        s = '$s${element.text}';
                                                      }
                                                      cubit.checkOTP(
                                                          s.toLowerCase());
                                                    }
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.blue,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 50,
                                                        vertical: 15),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    elevation: 5,
                                                  ),
                                                  child: const Text('Verify',
                                                      style: TextStyle(
                                                          fontSize: 18)),
                                                ),
                                                const SizedBox(height: 20),
                                                _isTimerActive
                                                    ? Text(
                                                        'Resend OTP in $_timerDuration seconds',
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16),
                                                      )
                                                    : TextButton(
                                                        onPressed: () {
                                                          _startTimer();
                                                        },
                                                        child: const Text(
                                                            'Resend OTP',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16)),
                                                      ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 20),
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.9),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 10,
                                              offset: Offset(0, 5),
                                            ),
                                          ],
                                        ),
                                        child: Form(
                                          key: _formKey,
                                          child: Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Text(
                                                  'Enter the OTP',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                  textAlign: TextAlign.center,
                                                ),
                                                const SizedBox(height: 30),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children:
                                                      List.generate(6, (index) {
                                                    return SizedBox(
                                                      width: 40,
                                                      child: TextFormField(
                                                        controller:
                                                            _otpControllers[
                                                                index],
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        maxLength: 1,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                            fontSize: 24),
                                                        decoration:
                                                            InputDecoration(
                                                          counterText: '',
                                                          filled: true,
                                                          fillColor:
                                                              Colors.white,
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width: 2),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .blue,
                                                                    width: 2),
                                                          ),
                                                        ),
                                                        onChanged: (value) {
                                                          if (value
                                                              .isNotEmpty) {
                                                            _currentIndex = index <
                                                                    5
                                                                ? index + 1
                                                                : index; // Move to the next input
                                                            FocusScope.of(
                                                                    context)
                                                                .nextFocus();
                                                          } else {
                                                            _currentIndex = index >
                                                                    0
                                                                ? index - 1
                                                                : 0; // Move to the previous input
                                                            FocusScope.of(
                                                                    context)
                                                                .previousFocus();
                                                          }
                                                        },
                                                        validator: (value) {
                                                          if (value == null ||
                                                              value.isEmpty) {
                                                            return 'Required';
                                                          }
                                                          return null;
                                                        },
                                                      ),
                                                    );
                                                  }),
                                                ),
                                                const SizedBox(height: 30),
                                                ElevatedButton(
                                                  onPressed: () => AuthApi()
                                                      .resendOTP(
                                                          email: cubit
                                                              .emailCont.text,
                                                          otpCode:
                                                              cubit.otpCode),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.blue,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 50,
                                                        vertical: 15),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    elevation: 5,
                                                  ),
                                                  child: const Text('Verify',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.white)),
                                                ),
                                                const SizedBox(height: 20),
                                                _isTimerActive
                                                    ? Text(
                                                        'Resend OTP in $_timerDuration seconds',
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 16),
                                                      )
                                                    : TextButton(
                                                        onPressed: () {
                                                          _startTimer();
                                                        },
                                                        child: const Text(
                                                            'Resend OTP',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16)),
                                                      ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                              const Spacer(),
                              _buildFooter(context),
                            ],
                          ),
                        ),
                      ),
                    ));
          },
        ),
      ),
    );
  }

  Widget _buildFooter(context) {
    final isMobile = MediaQuery.of(context).size.width > 859;
    return isMobile
        ? Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.indigo[900]!, Colors.indigo[600]!],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                // Company Information
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ISTEDAFIH',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'KVK-number: 95019774',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      'Wijnkorenstraat 3 - 4706 PM',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      'Roosendaal - Netherlands',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '+31 64 83 17 668',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                // Navigation Links
                Column(
                  children: [
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Terms of Use',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Container(
                          width: 1,
                          height: 24,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 15),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Privacy Policy',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '© 2003-2024 Visaino. All rights reserved.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                // Contact and Social Media Icons
                Row(
                  children: [
                    const Text(
                      'Contact Us',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      width: 2,
                      height: 24,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 15),
                    Link(
                      uri: Uri.parse('https://wa.me/31648317668'),
                      target: LinkTarget.blank,
                      builder: (context, openLink) => InkWell(
                        onTap: openLink,
                        child: const CircleAvatar(
                          backgroundColor: Colors.black,
                          child: FaIcon(
                            FontAwesomeIcons.whatsapp,
                            color: Colors.green,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Link(
                      uri: Uri.parse(
                          'https://www.instagram.com/visaino.law/profilecard/?igsh=MXMyd2RyemFmbDR1aQ=='),
                      target: LinkTarget.blank,
                      builder: (context, openLink) => InkWell(
                        onTap: openLink,
                        hoverColor: Colors.grey[700],
                        borderRadius: BorderRadius.circular(25),
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          child: FaIcon(
                            FontAwesomeIcons.instagram,
                            color: Colors.red[800],
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Link(
                      uri: Uri.parse(
                          'https://www.facebook.com/profile.php?id=61566769034940'),
                      target: LinkTarget.blank,
                      builder: (context, openLink) => InkWell(
                        onTap: openLink,
                        hoverColor: Colors.grey[700],
                        borderRadius: BorderRadius.circular(25),
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          child: FaIcon(
                            FontAwesomeIcons.facebook,
                            color: Colors.indigo[900],
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        : Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.indigo[900]!, Colors.indigo[600]!],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Company Information
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ISTEDAFIH',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'KVK-number: 95019774',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      'Wijnkorenstraat 3 - 4706 PM',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      'Roosendaal - Netherlands',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '+31 64 83 17 668',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Navigation Links and Contact Section
                Column(
                  children: [
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Terms of Use',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Container(
                          width: 1,
                          height: 24,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 15),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Privacy Policy',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      '© 2003-2024 Visaino. All rights reserved.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Text(
                          'Contact Us',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Container(
                          width: 2,
                          height: 24,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 15),
                        Link(
                          uri: Uri.parse('https://wa.me/31648317668'),
                          target: LinkTarget.blank,
                          builder: (context, openLink) => InkWell(
                            onTap: openLink,
                            child: const CircleAvatar(
                              backgroundColor: Colors.black,
                              child: FaIcon(
                                FontAwesomeIcons.whatsapp,
                                color: Colors.green,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Link(
                          uri: Uri.parse(
                              'https://www.instagram.com/visaino.law/profilecard/?igsh=MXMyd2RyemFmbDR1aQ=='),
                          target: LinkTarget.blank,
                          builder: (context, openLink) => InkWell(
                            onTap: openLink,
                            hoverColor: Colors.grey[700],
                            borderRadius: BorderRadius.circular(25),
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              child: FaIcon(
                                FontAwesomeIcons.instagram,
                                color: Colors.red[800],
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Link(
                          uri: Uri.parse(
                              'https://www.facebook.com/profile.php?id=61566769034940'),
                          target: LinkTarget.blank,
                          builder: (context, openLink) => InkWell(
                            onTap: openLink,
                            hoverColor: Colors.grey[700],
                            borderRadius: BorderRadius.circular(25),
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              child: FaIcon(
                                FontAwesomeIcons.facebook,
                                color: Colors.indigo[900],
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
