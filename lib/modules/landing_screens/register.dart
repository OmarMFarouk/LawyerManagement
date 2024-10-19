import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lawyermanagement/blocs/auth_bloc/auth_cubit.dart';
import 'package:lawyermanagement/blocs/auth_bloc/auth_states.dart';
import 'package:lawyermanagement/models/countries_model.dart';
import 'package:lawyermanagement/modules/program_screens/login.dart';
import 'package:lawyermanagement/services/api/auth_api.dart';
import 'package:url_launcher/link.dart';

import '../../components/auth/countries_dropdown.dart';
import '../../components/auth/payment_dialog.dart';

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width > 859;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.indigo[300]!, Colors.indigo[900]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: BlocConsumer<AuthCubit, AuthStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = AuthCubit.get(context);
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(50),
                              child: Text(
                                'Create Account',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 2.25,
                                ),
                              ),
                            ),
                            isMobile?
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 80, vertical: 40),
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(30),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    const BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 10,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      // Organization Name
                                      _buildTextField(
                                        controller: cubit.orgCont,
                                        icon: Icons.business,
                                        label: 'Organization Name',
                                        validator: (value) {
                                          if (value == null ||
                                              value.trim().isEmpty) {
                                            return 'Please enter organization name';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 20),
                                      _buildTextField(
                                        controller: cubit.firstNameCont,
                                        icon: Icons.person,
                                        label: 'First Name',
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your first name';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 20),
                                      _buildTextField(
                                        controller: cubit.lastNameCont,
                                        icon: Icons.person_outline,
                                        label: 'Last Name',
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your last name';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 20),
                                      _buildTextField(
                                        controller: cubit.emailCont,
                                        icon: Icons.email,
                                        label: 'Email',
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your email';
                                          } else if (!value.contains('@') ||
                                              !value.contains('.') ||
                                              value.endsWith('.') ||
                                              value.contains('.@') ||
                                              value.contains('@.') ||
                                              value.endsWith('@')) {
                                            return 'Invalid email';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 20),
                                      CountriesDropDown(
                                        title: 'Select Country',
                                        isDashboard: false,
                                        items: countryModel.countries!,
                                      ),
                                      const SizedBox(height: 20),
                                      _buildTextField(
                                        controller: cubit.phoneCont,
                                        icon: Icons.phone,
                                        label: 'Phone',
                                        keyboardType: TextInputType.phone,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your phone number';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 20),
                                      _buildTextField(
                                        controller: cubit.passwordCont,
                                        icon: Icons.lock,
                                        label: 'Password',
                                        obscureText: true,
                                        validator: (value) {
                                          if (value == null ||
                                              value.length < 6) {
                                            return 'Password must be at least 6 characters';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 20),
                                      _buildTextField(
                                        controller: cubit.confirmPasswordCont,
                                        icon: Icons.lock_outline,
                                        label: 'Confirm Password',
                                        obscureText: true,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please confirm your password';
                                          } else if (value !=
                                              cubit.passwordCont.text) {
                                            return 'Passwords mismatch';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 30),
                                      ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 30, vertical: 15),
                                          backgroundColor: Colors.indigo[700],
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        icon: const Icon(Icons.check_circle,
                                            color: Colors.white),
                                        label: const Text('Register',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white)),
                                        onPressed: () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            bool emailExist = await AuthApi()
                                                .checkAuth(
                                                    email:
                                                        cubit.emailCont.text);
                                            if (emailExist) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  backgroundColor: Colors.red,
                                                  content: Text(
                                                      'Email Already Exists'),
                                                ),
                                              );
                                            } else {
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    PaymentDialog(),
                                              );
                                            }
                                          }
                                        },
                                      ),
                                      const SizedBox(height: 30),
                                      Row(
                                        children: [
                                          const Text('Already have account?  '),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          LoginScreen()),
                                                );
                                              },
                                              child: Text('Login'))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ) : Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 20),
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    const BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 10,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      // Organization Name
                                      _buildTextField(
                                        controller: cubit.orgCont,
                                        icon: Icons.business,
                                        label: 'Organization Name',
                                        validator: (value) {
                                          if (value == null ||
                                              value.trim().isEmpty) {
                                            return 'Please enter organization name';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 20),
                                      _buildTextField(
                                        controller: cubit.firstNameCont,
                                        icon: Icons.person,
                                        label: 'First Name',
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your first name';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 20),
                                      _buildTextField(
                                        controller: cubit.lastNameCont,
                                        icon: Icons.person_outline,
                                        label: 'Last Name',
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your last name';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 20),
                                      _buildTextField(
                                        controller: cubit.emailCont,
                                        icon: Icons.email,
                                        label: 'Email',
                                        keyboardType:
                                        TextInputType.emailAddress,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your email';
                                          } else if (!value.contains('@') ||
                                              !value.contains('.') ||
                                              value.endsWith('.') ||
                                              value.contains('.@') ||
                                              value.contains('@.') ||
                                              value.endsWith('@')) {
                                            return 'Invalid email';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 20),
                                      CountriesDropDown(
                                        title: 'Select Country',
                                        isDashboard: false,
                                        items: countryModel.countries!,
                                      ),
                                      const SizedBox(height: 20),
                                      _buildTextField(
                                        controller: cubit.phoneCont,
                                        icon: Icons.phone,
                                        label: 'Phone',
                                        keyboardType: TextInputType.phone,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your phone number';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 20),
                                      _buildTextField(
                                        controller: cubit.passwordCont,
                                        icon: Icons.lock,
                                        label: 'Password',
                                        obscureText: true,
                                        validator: (value) {
                                          if (value == null ||
                                              value.length < 6) {
                                            return 'Password must be at least 6 characters';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 20),
                                      _buildTextField(
                                        controller: cubit.confirmPasswordCont,
                                        icon: Icons.lock_outline,
                                        label: 'Confirm Password',
                                        obscureText: true,
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please confirm your password';
                                          } else if (value !=
                                              cubit.passwordCont.text) {
                                            return 'Passwords mismatch';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 30),
                                      ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 30, vertical: 15),
                                          backgroundColor: Colors.indigo[700],
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                          ),
                                        ),
                                        icon: const Icon(Icons.check_circle,
                                            color: Colors.white),
                                        label: const Text('Register',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white)),
                                        onPressed: () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            bool emailExist = await AuthApi()
                                                .checkAuth(
                                                email:
                                                cubit.emailCont.text);
                                            if (emailExist) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  backgroundColor: Colors.red,
                                                  content: Text(
                                                      'Email Already Exists'),
                                                ),
                                              );
                                            } else {
                                              showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    PaymentDialog(),
                                              );
                                            }
                                          }
                                        },
                                      ),
                                      const SizedBox(height: 30),
                                      Row(
                                        children: [
                                          const Text('Already have account?  '),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          LoginScreen()),
                                                );
                                              },
                                              child: Text('Login'))
                                        ],
                                      )
                                    ],
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
                  );
                },
              ),
            );
          }),
    );
  }

  Widget _buildTextField({
    required IconData icon,
    required String label,
    required TextEditingController controller,
    bool obscureText = false,
    TextInputType? keyboardType,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      inputFormatters: label == 'Organization Name'
          ? []
          : [FilteringTextInputFormatter.deny(' ')],
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.indigo[600]),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      validator: validator,
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
