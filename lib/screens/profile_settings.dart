import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:health_link/const/colors.dart';
import 'package:health_link/screens/home/notifications.dart';

class ProfileSettingsPage extends StatefulWidget {
  final bool back;
  const ProfileSettingsPage({super.key, this.back = false});

  @override
  State<ProfileSettingsPage> createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  String _selectedAddressType = 'Home'; // Default address type

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
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
                                "Profile Settings",
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
                  height: size.height,
                  decoration: const BoxDecoration(
                      color: Color(0xfff2f2f2),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      )),
                  child: Padding(
                    padding: EdgeInsets.all(size.width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height * 0.04),
                        Row(
                          children: [
                            Icon(Icons.person,
                                color: NavyBlue, size: size.height * 0.025),
                            SizedBox(width: size.width * 0.03),
                            Text(
                              "Name",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.02),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Enter your name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        Row(
                          children: [
                            Icon(Icons.email,
                                color: NavyBlue, size: size.height * 0.025),
                            SizedBox(width: size.width * 0.03),
                            Text(
                              "Email",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.02),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Enter your email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        Row(
                          children: [
                            Icon(Icons.location_on,
                                color: NavyBlue, size: size.height * 0.025),
                            SizedBox(width: size.width * 0.03),
                            Text(
                              "Address",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: size.height * 0.02,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.02),
                        DropdownButtonFormField<String>(
                          value: _selectedAddressType,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          items: ['Home', 'Office', 'Other']
                              .map((addressType) => DropdownMenuItem(
                                    value: addressType,
                                    child: Text(addressType),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedAddressType = value!;
                            });
                          },
                        ),
                        SizedBox(height: size.height * 0.02),
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Enter your address",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Implement password reset functionality here
                          },
                          child: Text(
                            "Reset Password",
                            style: TextStyle(
                              color: BlueGrotto,
                              fontSize: size.height * 0.02,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        ElevatedButton(
                          onPressed: () {
                            // Implement update functionality here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: NavyBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.01,
                              horizontal: size.width * 0.05,
                            ),
                          ),
                          child: Text(
                            "Update",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: size.height * 0.025,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
