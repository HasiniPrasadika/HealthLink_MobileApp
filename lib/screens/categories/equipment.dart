import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:health_link/const/colors.dart';
import 'package:health_link/const/prescriptionData.dart';
import 'package:health_link/models/product_model.dart';
import 'package:health_link/screens/home/notifications.dart';
import 'package:health_link/widgets/product_card.dart';

class EquipmentPage extends StatefulWidget {
  const EquipmentPage({super.key});

  @override
  State<EquipmentPage> createState() => _EquipmentPageState();
}

class _EquipmentPageState extends State<EquipmentPage> {
  final List<ProductModel> products = prescriptionMedicines;

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
                              "Medical Equipment",
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * 0.005,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(size.width * 0.05,
                          size.width * 0.05, size.width * 0.05, 0),
                      child: Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(30.0),
                        shadowColor: const Color(0x55434343),
                        child: const TextField(
                          textAlign: TextAlign.start,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            hintText: "Search for Medicines...",
                            prefixIcon: Icon(
                              Icons.search,
                              color: NavyBlue,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.05),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 3 / 3.6, // Adjust as needed
                            ),
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              return productCard(
                                size: size,
                                product: products[index],
                              );
                            },
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.05, // Add some bottom padding
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
