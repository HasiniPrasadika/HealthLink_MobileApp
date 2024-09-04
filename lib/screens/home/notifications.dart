import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:health_link/const/colors.dart';

class NotificationPage extends StatefulWidget {
  final bool back;
  const NotificationPage({super.key, this.back = false});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
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
                              "Notifications",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.height * 0.025,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width,
                padding: EdgeInsets.all(size.width * 0.05),
                decoration: const BoxDecoration(
                    color: Color(0xfff2f2f2),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * 0.02),
                    Text(
                      "Order Status",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: size.height * 0.03,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    _buildNotificationCard(
                      size,
                      title: "Order #12345",
                      subtitle: "Your order has been shipped.",
                      icon: Icons.local_shipping,
                      iconColor: Colors.blue,
                    ),
                    SizedBox(height: size.height * 0.02),
                    _buildNotificationCard(
                      size,
                      title: "Order #12346",
                      subtitle: "Your order has been delivered.",
                      icon: Icons.check_circle,
                      iconColor: Colors.green,
                    ),
                    SizedBox(height: size.height * 0.04),
                    Text(
                      "New Discounts",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: size.height * 0.03,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    _buildNotificationCard(
                      size,
                      title: "Summer Sale!",
                      subtitle: "Get 20% off on selected items.",
                      icon: Icons.local_offer,
                      iconColor: Colors.red,
                    ),
                    SizedBox(height: size.height * 0.04),
                    Text(
                      "New Products",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: size.height * 0.03,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    _buildNotificationCard(
                      size,
                      title: "New Vitamin C Supplement",
                      subtitle: "Boost your immunity with our new product.",
                      icon: Icons.new_releases,
                      iconColor: Colors.orange,
                    ),
                    SizedBox(height: size.height * 0.04),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationCard(Size size,
      {required String title,
      required String subtitle,
      required IconData icon,
      required Color iconColor}) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: iconColor,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: size.height * 0.022,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: Colors.black,
            fontSize: size.height * 0.018,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
      ),
    );
  }
}
