import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/link.dart'; // Add this package to use FontAwesome icons

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width > 859;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blueGrey[100]!, Colors.blueGrey[600]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              isMobile?
              Padding(
                padding: const EdgeInsets.all(100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About Our Legal Program',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey[900],
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Welcome to our comprehensive legal program designed specifically for law professionals. Our platform offers a range of tools and resources tailored to meet the needs of lawyers and legal firms. We provide a unique subscription-based service that includes access to an extensive library of legal documents, case management tools, client communication features, and ongoing legal education. Our mission is to support legal professionals in delivering exceptional service to their clients while streamlining their administrative tasks.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blueGrey[800],
                        height: 1.6,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.blueGrey[900]),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Access to a comprehensive database of legal documents and templates, regularly updated to comply with the latest regulations.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blueGrey[700],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.blueGrey[900]),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Advanced case management tools to help you track and manage client cases efficiently, from intake to resolution.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blueGrey[700],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.blueGrey[900]),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Client communication features including secure messaging and scheduling, designed to enhance client interaction and satisfaction.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blueGrey[700],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.blueGrey[900]),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Ongoing legal education and training resources to keep you updated with the latest legal developments and best practices.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blueGrey[700],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Our platform is dedicated to empowering legal professionals by providing them with the tools and resources they need to excel in their practice. We understand the challenges faced by law firms and solo practitioners, and we are committed to delivering solutions that enhance productivity and improve client outcomes.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blueGrey[800],
                        height: 1.6,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        FaIcon(FontAwesomeIcons.linkedin, size: 30, color: Colors.blueGrey[900]),
                        const SizedBox(width: 20),
                        FaIcon(FontAwesomeIcons.twitter, size: 30, color: Colors.blueGrey[900]),
                        const SizedBox(width: 20),
                        FaIcon(FontAwesomeIcons.facebook, size: 30, color: Colors.blueGrey[900]),
                      ],
                    ),
                  ],
                ),
              ) :
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 70,),
                    Text(
                      'About Our Legal Program',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey[900],
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Welcome to our comprehensive legal program designed specifically for law professionals. Our platform offers a range of tools and resources tailored to meet the needs of lawyers and legal firms. We provide a unique subscription-based service that includes access to an extensive library of legal documents, case management tools, client communication features, and ongoing legal education. Our mission is to support legal professionals in delivering exceptional service to their clients while streamlining their administrative tasks.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blueGrey[800],
                        height: 1.6,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.blueGrey[900]),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Access to a comprehensive database of legal documents and templates, regularly updated to comply with the latest regulations.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blueGrey[700],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.blueGrey[900]),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Advanced case management tools to help you track and manage client cases efficiently, from intake to resolution.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blueGrey[700],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.blueGrey[900]),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Client communication features including secure messaging and scheduling, designed to enhance client interaction and satisfaction.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blueGrey[700],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.blueGrey[900]),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Ongoing legal education and training resources to keep you updated with the latest legal developments and best practices.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blueGrey[700],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Our platform is dedicated to empowering legal professionals by providing them with the tools and resources they need to excel in their practice. We understand the challenges faced by law firms and solo practitioners, and we are committed to delivering solutions that enhance productivity and improve client outcomes.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blueGrey[800],
                        height: 1.6,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        FaIcon(FontAwesomeIcons.linkedin, size: 30, color: Colors.blueGrey[900]),
                        const SizedBox(width: 20),
                        FaIcon(FontAwesomeIcons.twitter, size: 30, color: Colors.blueGrey[900]),
                        const SizedBox(width: 20),
                        FaIcon(FontAwesomeIcons.facebook, size: 30, color: Colors.blueGrey[900]),
                      ],
                    ),
                  ],
                ),
              ),
              isMobile
                  ? Container(
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
                    // Company Information
                    Column(
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
                        const SizedBox(height: 5),
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
                    colors: [Colors.blueGrey[800]!, Colors.blueGrey[600]!],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Company Information
                    Column(
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
                        const SizedBox(height: 5),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
