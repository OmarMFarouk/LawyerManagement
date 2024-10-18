
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lawyermanagement/modules/landing_screens/register.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 1437;
    final isMobile = MediaQuery.of(context).size.width > 859;
    return Container(
      color: Colors.grey[100],
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
            Container(
            height: 600,
            width: double.infinity,
            padding: const EdgeInsets.all(100),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/slider_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.gavel, size: 40, color: Colors.teal), // Law-related icon
                    SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        'Your Legal Case Management Solution',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  'Streamline your law firm operations with cloud-based, efficient tools.',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Manage cases, clients, and documents securely, all in one place.',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  width: 160,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: MaterialButton(
                    hoverColor: Colors.teal[100],
                    hoverElevation: 5,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterScreen()),
                      );
                    },
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
                height: 50,
              ),
              isMobile?
              const Column(
                children: [
                  Text(
                    '3 different areas in the system',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'They are designed to communicate ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    'between all parties to the case from anywhere.',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ) : Column(
                children: [
                  Text(
                    '3 different areas in the system',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'They are designed to communicate ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w800),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      'between all parties to the case from anywhere.',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ) ,
              Padding(
                padding: const EdgeInsets.all(60),
                child:
                    isMobile?
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 450, // Set a fixed height for all
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          alignment: AlignmentDirectional.topStart,
                          decoration: BoxDecoration(
                            border: Border.all(
                                style: BorderStyle.solid,
                                color: Colors.blueAccent,
                                width: 0.8),
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.lightBlue[50],
                          ),
                          child: Column(
                            children: [
                              Center(
                                child: Image.network(
                                  'https://tse3.mm.bing.net/th?id=OIP.uomkpLp6YJKUpxcrZk6zdQHaHk&pid=Api&P=0&h=220',
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Align(
                                alignment: AlignmentDirectional.topStart,
                                child: Text(
                                  'Management Area',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                width: 80,
                                height: 3,
                                color: Colors.blueAccent,
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'Manage the entire system, control all services and tasks such as quotes, invoices, and payments with ease.',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: SizedBox(
                        height: 450, // Same height
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          alignment: AlignmentDirectional.topStart,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                style: BorderStyle.solid,
                                color: Colors.green,
                                width: 0.8),
                            color: Colors.lightGreen[50],
                          ),
                          child: Column(
                            children: [
                              Center(
                                child: Image.network(
                                  'https://tse4.mm.bing.net/th?id=OIP.FMedmSO92dUU_0OXs5Fs5wHaHa&pid=Api&P=0&h=220',
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Align(
                                alignment: AlignmentDirectional.topStart,
                                child: Text(
                                  'Staff Area',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                width: 80,
                                height: 3,
                                color: Colors.green,
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'Manage staff data, track employee performance, and handle employee requests efficiently.',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: SizedBox(
                        height: 450, // Same height
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          alignment: AlignmentDirectional.topStart,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                style: BorderStyle.solid,
                                color: Colors.orange,
                                width: 0.8),
                            color: Colors.orange[50],
                          ),
                          child: Column(
                            children: [
                              Center(
                                child: Image.network(
                                  'https://tse3.mm.bing.net/th?id=OIP.LpdNErdYL1plro9KoMPa0wHaH_&pid=Api&P=0&h=220',
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Align(
                                alignment: AlignmentDirectional.topStart,
                                child: Text(
                                  'Customers Area',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.orange,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                width: 80,
                                height: 3,
                                color: Colors.orange,
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'Manage customer interactions, follow up on requests, and add new customers easily.',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ) : Column(
                      children: [
                        SizedBox(
                          height: 450, // Set a fixed height for all
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            alignment: AlignmentDirectional.topStart,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  style: BorderStyle.solid,
                                  color: Colors.blueAccent,
                                  width: 0.8),
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.lightBlue[50],
                            ),
                            child: Column(
                              children: [
                                Center(
                                  child: Image.network(
                                    'https://tse3.mm.bing.net/th?id=OIP.uomkpLp6YJKUpxcrZk6zdQHaHk&pid=Api&P=0&h=220',
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: Text(
                                    'Management Area',
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  width: 80,
                                  height: 3,
                                  color: Colors.blueAccent,
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  'Manage the entire system, control all services and tasks such as quotes, invoices, and payments with ease.',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black54),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          height: 450, // Same height
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            alignment: AlignmentDirectional.topStart,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  style: BorderStyle.solid,
                                  color: Colors.green,
                                  width: 0.8),
                              color: Colors.lightGreen[50],
                            ),
                            child: Column(
                              children: [
                                Center(
                                  child: Image.network(
                                    'https://tse4.mm.bing.net/th?id=OIP.FMedmSO92dUU_0OXs5Fs5wHaHa&pid=Api&P=0&h=220',
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: Text(
                                    'Staff Area',
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  width: 80,
                                  height: 3,
                                  color: Colors.green,
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  'Manage staff data, track employee performance, and handle employee requests efficiently.',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black54),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          height: 450, // Same height
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            alignment: AlignmentDirectional.topStart,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  style: BorderStyle.solid,
                                  color: Colors.orange,
                                  width: 0.8),
                              color: Colors.orange[50],
                            ),
                            child: Column(
                              children: [
                                Center(
                                  child: Image.network(
                                    'https://tse3.mm.bing.net/th?id=OIP.LpdNErdYL1plro9KoMPa0wHaH_&pid=Api&P=0&h=220',
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: Text(
                                    'Customers Area',
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  width: 80,
                                  height: 3,
                                  color: Colors.orange,
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  'Manage customer interactions, follow up on requests, and add new customers easily.',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black54),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
              ),
              Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.yellow[600],
                    borderRadius: BorderRadius.circular(10)),
                child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                    },
                    child: const Text(
                      'Order now',
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
            Padding(
              padding: const EdgeInsets.all(80),
              child:
                  isDesktop?
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Updated Title for Case Screen
                        Text(
                          'Comprehensive Case Management System',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            fontFamily: 'Poppins',
                            color: Colors.indigo[900],
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Updated Body Text
                        Text(
                          'The case management system allows you to handle all legal cases efficiently, from client intake to final resolution. You can track case progress, upload and store relevant documents, generate reports, and search for specific files or cases quickly. With integrated search functionality, retrieving and managing case information has never been easier.',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                            color: Colors.grey[800],
                            height: 1.6,
                            wordSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 30),


                        Row(
                          children: [
                            // Icon + Text Combination for Print
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.indigo[100],
                                  ),
                                  child: Icon(
                                    FontAwesomeIcons.print,
                                    size: 28,
                                    color: Colors.indigo[900],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  'Print Case Files',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 40),

                            // Icon + Text Combination for File Management
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.indigo[100],
                                  ),
                                  child: Icon(
                                    FontAwesomeIcons.file,
                                    size: 28,
                                    color: Colors.indigo[900],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  'Manage Files',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 40),

                            // Icon + Text Combination for Search
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.indigo[100],
                                  ),
                                  child: Icon(
                                    FontAwesomeIcons.search,
                                    size: 28,
                                    color: Colors.indigo[900],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  'Search Cases',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 80),

                  // Image Section with Updated Image
                  const Expanded(
                    child: Image(image: AssetImage('images/Screenshot 2024-09-19 204829.png',
                      ),width: 380)
                  ),
                ],
              ) :
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(image: AssetImage('images/Screenshot 2024-09-19 204829.png',
                      ),width: double.infinity),
                      const SizedBox(height: 80),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Updated Title for Case Screen
                          Text(
                            'Comprehensive Case Management System',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              fontFamily: 'Poppins',
                              color: Colors.indigo[900],
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Updated Body Text
                          Text(
                            'The case management system allows you to handle all legal cases efficiently, from client intake to final resolution. You can track case progress, upload and store relevant documents, generate reports, and search for specific files or cases quickly. With integrated search functionality, retrieving and managing case information has never been easier.',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 16,
                              color: Colors.grey[800],
                              height: 1.6,
                              wordSpacing: 1.5,
                            ),
                          ),
                          const SizedBox(height: 30),
                          isMobile?
                          Row(
                            children: [
                              // Icon + Text Combination for Print
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.indigo[100],
                                    ),
                                    child: Icon(
                                      FontAwesomeIcons.print,
                                      size: 28,
                                      color: Colors.indigo[900],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    'Print Case Files',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.indigo,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 40),

                              // Icon + Text Combination for File Management
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.indigo[100],
                                    ),
                                    child: Icon(
                                      FontAwesomeIcons.file,
                                      size: 28,
                                      color: Colors.indigo[900],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    'Manage Files',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.indigo,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 40),

                              // Icon + Text Combination for Search
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.indigo[100],
                                    ),
                                    child: Icon(
                                      FontAwesomeIcons.search,
                                      size: 28,
                                      color: Colors.indigo[900],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    'Search Cases',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.indigo,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ) : Column(
                            children: [
                              // Icon + Text Combination for Print
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.indigo[100],
                                    ),
                                    child: Icon(
                                      FontAwesomeIcons.print,
                                      size: 28,
                                      color: Colors.indigo[900],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    'Print Case Files',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.indigo,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 40),

                              // Icon + Text Combination for File Management
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.indigo[100],
                                    ),
                                    child: Icon(
                                      FontAwesomeIcons.file,
                                      size: 28,
                                      color: Colors.indigo[900],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    'Manage Files',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.indigo,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 40),

                              // Icon + Text Combination for Search
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.indigo[100],
                                    ),
                                    child: Icon(
                                      FontAwesomeIcons.search,
                                      size: 28,
                                      color: Colors.indigo[900],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    'Search Cases',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic,
                                      color: Colors.indigo,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
            ),
              Padding(
            padding: const EdgeInsets.all(40),
            child:
            isDesktop?
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title with modern font
                      Text(
                        'Client Management',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          fontFamily: 'Poppins',
                          color: Colors.indigo[900], // Deep blue color
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Body Text with improved readability
                      Text(
                        'Easily manage client profiles with detailed records on their cases, legal consultations, and communication history. Track every interaction through emails or phone calls, and store essential documents related to each client. Keep track of financial transactions, invoices, and assign cases to relevant lawyers, ensuring a smooth and transparent legal process for each client.',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          color: Colors.grey[800],
                          height: 1.6,
                          wordSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Icon and Text Row with updated spacing and styling
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Icon + Text Combination 1: Search
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.indigo[50],
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.indigo.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  FontAwesomeIcons.search,
                                  size: 30,
                                  color: Colors.indigo[800],
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                'Search Clients',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.indigo[800],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 40),

                          // Icon + Text Combination 2: Email
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.indigo[50],
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.indigo.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  FontAwesomeIcons.envelope,
                                  size: 30,
                                  color: Colors.indigo[800],
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                'Email Clients',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.indigo[800],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 40),

                          // Icon + Text Combination 3: Phone
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.indigo[50],
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.indigo.withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  FontAwesomeIcons.phone,
                                  size: 30,
                                  color: Colors.indigo[800],
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                'Call Clients',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.indigo[800],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 40),

                // Image Section with the updated image
                Expanded(
                  child: Image.asset(
                    'images/Screenshot 2024-09-19 203923.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ],
            ) :  Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'images/Screenshot 2024-09-19 203923.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                const SizedBox(height: 40),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title with modern font
                    Text(
                      'Client Management',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        fontFamily: 'Poppins',
                        color: Colors.indigo[900], // Deep blue color
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Body Text with improved readability
                    Text(
                      'Easily manage client profiles with detailed records on their cases, legal consultations, and communication history. Track every interaction through emails or phone calls, and store essential documents related to each client. Keep track of financial transactions, invoices, and assign cases to relevant lawyers, ensuring a smooth and transparent legal process for each client.',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        color: Colors.grey[800],
                        height: 1.6,
                        wordSpacing: 1.5,
                      ),
                    ),
                    const SizedBox(height: 30),
                    isMobile?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.indigo[50],
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.indigo.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Icon(
                                FontAwesomeIcons.search,
                                size: 30,
                                color: Colors.indigo[800],
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Search Clients',
                              style: TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                color: Colors.indigo[800],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 40),

                        // Icon + Text Combination 2: Email
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.indigo[50],
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.indigo.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Icon(
                                FontAwesomeIcons.envelope,
                                size: 30,
                                color: Colors.indigo[800],
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Email Clients',
                              style: TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                color: Colors.indigo[800],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 40),

                        // Icon + Text Combination 3: Phone
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.indigo[50],
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.indigo.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Icon(
                                FontAwesomeIcons.phone,
                                size: 30,
                                color: Colors.indigo[800],
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Call Clients',
                              style: TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                color: Colors.indigo[800],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ) : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.indigo[50],
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.indigo.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Icon(
                                FontAwesomeIcons.search,
                                size: 30,
                                color: Colors.indigo[800],
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Search Clients',
                              style: TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                color: Colors.indigo[800],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 40),

                        // Icon + Text Combination 2: Email
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.indigo[50],
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.indigo.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Icon(
                                FontAwesomeIcons.envelope,
                                size: 30,
                                color: Colors.indigo[800],
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Email Clients',
                              style: TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                color: Colors.indigo[800],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 40),

                        // Icon + Text Combination 3: Phone
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.indigo[50],
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.indigo.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Icon(
                                FontAwesomeIcons.phone,
                                size: 30,
                                color: Colors.indigo[800],
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Call Clients',
                              style: TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.italic,
                                color: Colors.indigo[800],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

              ],
            ),
          ),
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
                        SizedBox(
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
                        SizedBox(
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
                    SizedBox(height: 20,),
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
    );
  }
}
