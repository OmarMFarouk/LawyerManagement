import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lawyermanagement/layout/cubit/cubit.dart';
import 'package:lawyermanagement/layout/cubit/states.dart';
import 'package:lawyermanagement/modules/landing_screens/register.dart';

class PricesScreen extends StatelessWidget {
  const PricesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width > 859;
    return BlocProvider(
      create: (context) => WebCubit(),
      child: BlocConsumer<WebCubit, WebStates>(
        builder: (context, state) => Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blueGrey[100]!, // Light gradient start
                Colors.blueGrey[700]!, // Darker gradient end
              ],
              begin:
                  Alignment.topLeft, // Direction from top-left to bottom-right
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 4), // Slight shadow for depth
              ),
            ],
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [

                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/slider_bg.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: double.infinity,
                    child: Center(
                      child:
                          isMobile?
                      Padding(
                        padding: const EdgeInsets.all(100),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Our Legal Services and Pricing',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w900,
                                fontSize: 40,
                                color: Colors.yellowAccent,
                                shadows: [
                                  Shadow(
                                    offset: const Offset(3.0, 3.0),
                                    blurRadius: 5.0,
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),

                            // Body text
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                'At our law firm, we believe in providing exceptional legal services at a price that reflects the quality, expertise, and dedication we bring to each case. '
                                    'Our team of experienced attorneys is committed to delivering comprehensive legal solutions for both individuals and businesses. '
                                    'Whether you need assistance with corporate law, litigation, family law, real estate, or personal injury cases, our wide range of services ensures that your legal needs are met with the utmost professionalism.\n\n'

                                    'We understand that legal services can sometimes feel costly, but we strive to offer fair and transparent pricing. Our "Monthly Subscription" option, priced at 1000 EGP, provides individuals and small businesses with ongoing legal support at a fraction of the cost of hiring in-house legal counsel. '
                                    'For clients who require more frequent consultations and document reviews, our "Quarterly Subscription" at 1500 EGP is an ideal solution, offering peace of mind and immediate access to legal advice as your needs arise. '
                                    'For long-term legal partnership, our "Yearly Subscription" plan, priced at 5000 EGP, offers the best value, ensuring continuous legal guidance and assistance throughout the year.\n\n'

                                    'No matter which option you choose, you can expect full transparency, detailed explanations of legal processes, and personalized service that is tailored to your specific situation. '
                                    'With our firm, you are not just another client — you are a valued partner. Our dedicated lawyers will take the time to understand your unique challenges and will work diligently to protect your rights and interests at every step.\n\n'

                                    'Our pricing is a reflection of our commitment to excellence, and we are confident that you will find it fair and competitive within the industry. '
                                    'Contact us today to learn more about how our services can help you navigate the complexities of the legal system and provide you with the support you need at a price that suits your budget.',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 18,
                                  color: Colors.black,
                                  height: 1.5, // Line height for readability
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Call to Action Button
                            MaterialButton(
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                              color: Colors.teal,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              onPressed: () {
                                // Action when button is pressed
                              },
                              child: const Text(
                                'Scroll Down To Get Started Today',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              elevation: 5.0,
                            ),
                          ],
                        ),
                      ):
                          Padding(
                            padding: const EdgeInsets.all(30),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 70,
                                ),
                                Text(
                                  'Our Legal Services and Pricing',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w900,
                                    fontSize: 40,
                                    color: Colors.yellowAccent,
                                    shadows: [
                                      Shadow(
                                        offset: const Offset(3.0, 3.0),
                                        blurRadius: 5.0,
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 20),

                                // Body text
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Text(
                                    'At our law firm, we believe in providing exceptional legal services at a price that reflects the quality, expertise, and dedication we bring to each case. '
                                        'Our team of experienced attorneys is committed to delivering comprehensive legal solutions for both individuals and businesses. '
                                        'Whether you need assistance with corporate law, litigation, family law, real estate, or personal injury cases, our wide range of services ensures that your legal needs are met with the utmost professionalism.\n\n'

                                        'We understand that legal services can sometimes feel costly, but we strive to offer fair and transparent pricing. Our "Monthly Subscription" option, priced at 1000 EGP, provides individuals and small businesses with ongoing legal support at a fraction of the cost of hiring in-house legal counsel. '
                                        'For clients who require more frequent consultations and document reviews, our "Quarterly Subscription" at 1500 EGP is an ideal solution, offering peace of mind and immediate access to legal advice as your needs arise. '
                                        'For long-term legal partnership, our "Yearly Subscription" plan, priced at 5000 EGP, offers the best value, ensuring continuous legal guidance and assistance throughout the year.\n\n'

                                        'No matter which option you choose, you can expect full transparency, detailed explanations of legal processes, and personalized service that is tailored to your specific situation. '
                                        'With our firm, you are not just another client — you are a valued partner. Our dedicated lawyers will take the time to understand your unique challenges and will work diligently to protect your rights and interests at every step.\n\n'

                                        'Our pricing is a reflection of our commitment to excellence, and we are confident that you will find it fair and competitive within the industry. '
                                        'Contact us today to learn more about how our services can help you navigate the complexities of the legal system and provide you with the support you need at a price that suits your budget.',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 18,
                                      color: Colors.black,
                                      height: 1.5, // Line height for readability
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                                const SizedBox(height: 20),

                                // Call to Action Button
                                MaterialButton(
                                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                                  color: Colors.teal,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  onPressed: () {
                                    // Action when button is pressed
                                  },
                                  child: const Text(
                                    'Scroll Down To Get Started Today',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  elevation: 5.0,
                                ),
                              ],
                            ),
                          ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Subscription card
                  isMobile?
                  Padding(
                    padding: const EdgeInsets.all(100),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 300,
                            width: MediaQuery.of(context).size.width * 0.8,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                const BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 10,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    'Monthly Subscription',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                                const Divider(
                                  thickness: 1.5,
                                  color: Colors.black26,
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  child: Text(
                                    '10 Euro',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.teal,
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Per Month For User',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 18,
                                    color: Colors.black54,
                                  ),
                                ),
                                const Spacer(),

                                // "Start Now" Button
                                MaterialButton(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 40),
                                  color: Colors.teal,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => RegisterScreen()));
                                  },
                                  child: const Text(
                                    'Start Now',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  elevation: 5.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 20,),
                        Expanded(
                          child: Container(
                            height: 300,
                            width: MediaQuery.of(context).size.width * 0.8,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                const BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 10,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    'Free Trial',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                                const Divider(
                                  thickness: 1.5,
                                  color: Colors.black26,
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  child: Text(
                                    'Free Month',
                                    style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.teal,
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Per Month For User',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 18,
                                    color: Colors.black54,
                                  ),
                                ),
                                const Spacer(),

                                // "Start Now" Button
                                MaterialButton(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 40),
                                  color: Colors.teal,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => RegisterScreen()));
                                  },
                                  child: const Text(
                                    'Start Now',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.white,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  elevation: 5.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ):Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        Container(
                          height: 300,
                          width: MediaQuery.of(context).size.width * 0.8,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'Monthly Subscription',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              const Divider(
                                thickness: 1.5,
                                color: Colors.black26,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                child: Text(
                                  '10 Euro',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.teal,
                                  ),
                                ),
                              ),
                              const Text(
                                'Per Month For User',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 18,
                                  color: Colors.black54,
                                ),
                              ),
                              const Spacer(),

                              // "Start Now" Button
                              MaterialButton(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 40),
                                color: Colors.teal,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => RegisterScreen()));
                                },
                                child: const Text(
                                  'Start Now',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                elevation: 5.0,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Container(
                          height: 300,
                          width: MediaQuery.of(context).size.width * 0.8,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  'Free Trial',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              const Divider(
                                thickness: 1.5,
                                color: Colors.black26,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 15),
                                child: Text(
                                  'Free Month',
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.teal,
                                  ),
                                ),
                              ),
                              const Text(
                                'Per Month For User',
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 18,
                                  color: Colors.black54,
                                ),
                              ),
                              const Spacer(),

                              // "Start Now" Button
                              MaterialButton(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 40),
                                color: Colors.teal,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => RegisterScreen()));
                                },
                                child: const Text(
                                  'Start Now',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                elevation: 5.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Footer Section
                  isMobile?
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blueGrey[800]!, Colors.blueGrey[600]!],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        // Navigation Buttons
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
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              '© 2003-2024 Visaino.All rights reserved.',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        // Contact and Social Media
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
                            InkWell(
                              onTap: () {},
                              hoverColor: Colors.grey[700],
                              borderRadius: BorderRadius.circular(25),
                              child: const CircleAvatar(
                                backgroundColor: Colors.black,
                                child: FaIcon(
                                  FontAwesomeIcons.twitter,
                                  color: Colors.blue,
                                  size: 24,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {},
                              hoverColor: Colors.grey[700],
                              borderRadius: BorderRadius.circular(25),
                              child: CircleAvatar(
                                backgroundColor: Colors.black,
                                child: FaIcon(
                                  FontAwesomeIcons.facebook,
                                  color: Colors.blue[800],
                                  size: 24,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {},
                              hoverColor: Colors.grey[700],
                              borderRadius: BorderRadius.circular(25),
                              child: const CircleAvatar(
                                backgroundColor: Colors.black,
                                child: FaIcon(
                                  FontAwesomeIcons.instagram,
                                  color: Colors.red,
                                  size: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ) :
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blueGrey[800]!, Colors.blueGrey[600]!],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        // Navigation Buttons
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
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              '© 2003-2024 Visaino.All rights reserved.',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20,),
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
                            InkWell(
                              onTap: () {},
                              hoverColor: Colors.grey[700],
                              borderRadius: BorderRadius.circular(25),
                              child: const CircleAvatar(
                                backgroundColor: Colors.black,
                                child: FaIcon(
                                  FontAwesomeIcons.twitter,
                                  color: Colors.blue,
                                  size: 24,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {},
                              hoverColor: Colors.grey[700],
                              borderRadius: BorderRadius.circular(25),
                              child: CircleAvatar(
                                backgroundColor: Colors.black,
                                child: FaIcon(
                                  FontAwesomeIcons.facebook,
                                  color: Colors.blue[800],
                                  size: 24,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {},
                              hoverColor: Colors.grey[700],
                              borderRadius: BorderRadius.circular(25),
                              child: const CircleAvatar(
                                backgroundColor: Colors.black,
                                child: FaIcon(
                                  FontAwesomeIcons.instagram,
                                  color: Colors.red,
                                  size: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        listener: (context, state) {},
      ),
    );
  }
}
