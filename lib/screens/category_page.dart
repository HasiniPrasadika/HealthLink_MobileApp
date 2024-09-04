import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:health_link/const/colors.dart';
import 'package:health_link/screens/categories/children.dart';
import 'package:health_link/screens/categories/chronic.dart';
import 'package:health_link/screens/categories/equipment.dart';
import 'package:health_link/screens/categories/health_wellness.dart';
import 'package:health_link/screens/categories/otc.dart';
import 'package:health_link/screens/categories/personal_care.dart';
import 'package:health_link/screens/categories/prescription.dart';
import 'package:health_link/screens/categories/senior_care.dart';
import 'package:health_link/screens/home/notifications.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final List<Map<String, dynamic>> categories = const [
    {
      'name': 'Prescription Medicines',
      'image': 'assets/images/prescription.png',
      'page': PrescriptionPage(),
    },
    {
      'name': 'OTC Medicines',
      'image': 'assets/images/otc.png',
      'page': OTCPage(),
    },
    {
      'name': 'Health and Wellness',
      'image': 'assets/images/health_wellness.png',
      'page': HealthWellnessPage(),
    },
    {
      'name': 'Chronic Condition Management',
      'image': 'assets/images/chronic.png',
      'page': ChronicPage(),
    },
    {
      'name': 'Personal Care',
      'image': 'assets/images/personal_care.png',
      'page': PersonalCarePage(),
    },
    {
      'name': 'Children\'s Health',
      'image': 'assets/images/children_health.png',
      'page': ChildrenCarePage(),
    },
    {
      'name': 'Senior Care',
      'image': 'assets/images/senior_care.png',
      'page': SeniorCarePage(),
    },
    {
      'name': 'Medical Equipment',
      'image': 'assets/images/equipment.png',
      'page': EquipmentPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: NavyBlue,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              Padding(
                padding: EdgeInsets.all(size.width * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: size.width * 0.12,
                            height: size.width * 0.12,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(42, 255, 255, 255),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                            ),
                            child: Center(
                              child: Icon(
                                Boxicons.bx_chevron_left,
                                color: Colors.white,
                                size: size.width * 0.1,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.04,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "All Categories",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.height * 0.025,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const NotificationPage()),
                            );
                          },
                          child: Container(
                            width: size.width * 0.10,
                            height: size.width * 0.10,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(42, 255, 255, 255),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.notifications,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 1.8, // Adjust the position as needed
                          right: 1.8, // Adjust the position as needed
                          child: Container(
                            width: 10, // Adjust the size as needed
                            height: 10, // Adjust the size as needed
                            decoration: const BoxDecoration(
                              color: Color(0xffff5959),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: size.width,
                decoration: const BoxDecoration(
                    color: Color(0xfff2f2f2),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    )),
                child: ListView.builder(
                  physics:
                      const NeverScrollableScrollPhysics(), // Prevent scrolling inside the scroll view
                  shrinkWrap: true, // Take only the required height
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      leading: Image.asset(
                        category['image'],
                        width: 40.0,
                        height: 40.0,
                      ),
                      title: Text(
                        category['name'],
                        style: TextStyle(
                          fontSize: size.height * 0.02,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios,
                          size: size.height * 0.02),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => category['page']),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
