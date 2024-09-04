import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:health_link/const/colors.dart';
import 'package:health_link/screens/common/splash_screen.dart';
import 'package:health_link/screens/helpcenter_page.dart';
import 'package:health_link/screens/home/main_page.dart';
import 'package:health_link/screens/home/notifications.dart';
import 'package:health_link/screens/myorders_page.dart';
import 'package:health_link/screens/profile_settings.dart';

class ProfilePage extends StatefulWidget {
  final bool back;
  const ProfilePage({super.key, this.back = false});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                            widget.back == true
                                ? Navigator.pop(context)
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const MainPage(),
                                    ),
                                  );
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
                              "My Account",
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.05),
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: size.width * 0.15,
                            backgroundImage: const AssetImage(
                                'assets/images/profile.png'), // Replace with your profile image
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                // Implement edit profile picture functionality
                              },
                              child: Container(
                                width: size.width * 0.08,
                                height: size.width * 0.08,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.edit,
                                  color: NavyBlue,
                                  size: size.width * 0.05,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.02),
                      Text(
                        'John Doe', // Replace with user's name
                        style: TextStyle(
                          color: NavyBlue,
                          fontSize: size.height * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      Text(
                        'johndoe@gmail.com', // Replace with user's email
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: size.height * 0.02,
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      Padding(
                        padding: EdgeInsets.all(size.width * 0.04),
                        child: Column(
                          children: [
                            _buildProfileOption(
                              size,
                              'Profile Settings',
                              Icons.settings,
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ProfileSettingsPage(),
                                  ),
                                );
                              },
                            ),
                            _buildProfileOption(
                              size,
                              'My Orders',
                              Icons.shopping_bag,
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MyOrdersPage(),
                                  ),
                                );
                              },
                            ),
                            _buildProfileOption(
                              size,
                              'Notifications',
                              Icons.notifications,
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const NotificationPage(),
                                  ),
                                );
                              },
                            ),
                            _buildProfileOption(
                              size,
                              'Help Center',
                              Icons.help,
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const HelpCenterPage(),
                                  ),
                                );
                              },
                            ),
                            _buildProfileOption(
                              size,
                              'Logout',
                              Icons.logout,
                              () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SplashScreen(),
                                  ),
                                  (Route<dynamic> route) => false,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * 0.06),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileOption(
      Size size, String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(
        icon,
        color: const Color.fromARGB(255, 60, 60, 60),
        size: size.height * 0.03,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: const Color.fromARGB(255, 60, 60, 60),
          fontSize: size.height * 0.022,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: const Color.fromARGB(255, 60, 60, 60),
        size: size.height * 0.03,
      ),
      onTap: onTap,
    );
  }
}
