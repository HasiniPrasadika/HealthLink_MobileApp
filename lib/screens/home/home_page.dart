import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_link/const/colors.dart';
import 'package:health_link/models/product_model.dart';
import 'package:health_link/screens/categories/children.dart';
import 'package:health_link/screens/categories/chronic.dart';
import 'package:health_link/screens/categories/equipment.dart';
import 'package:health_link/screens/categories/health_wellness.dart';
import 'package:health_link/screens/categories/otc.dart';
import 'package:health_link/screens/categories/personal_care.dart';
import 'package:health_link/screens/categories/prescription.dart';
import 'package:health_link/screens/categories/senior_care.dart';
import 'package:health_link/screens/category_page.dart';
import 'package:health_link/screens/home/cart_page.dart';
import 'package:health_link/screens/home/notifications.dart';
import 'package:health_link/screens/home/products_page.dart';
import 'package:health_link/widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> categories = [
    {
      'name': 'Prescription Medicines',
      'image': 'assets/images/prescription.png',
      'page': const PrescriptionPage()
    },
    {
      'name': 'Senior Care',
      'image': 'assets/images/senior_care.png',
      'page': const SeniorCarePage()
    },
    {
      'name': 'Personal Care',
      'image': 'assets/images/personal_care.png',
      'page': const PersonalCarePage()
    },
    {
      'name': 'Children\'s Health',
      'image': 'assets/images/children_health.png',
      'page': const ChildrenCarePage()
    },
    {
      'name': 'OTC Medicines',
      'image': 'assets/images/otc.png',
      'page': const OTCPage()
    },
    {
      'name': 'Health and Wellness',
      'image': 'assets/images/health_wellness.png',
      'page': const HealthWellnessPage()
    },
    {
      'name': 'Chronic Condition Management',
      'image': 'assets/images/chronic.png',
      'page': const ChronicPage()
    },
    {
      'name': 'Medical Equipment',
      'image': 'assets/images/equipment.png',
      'page': const EquipmentPage()
    },
  ];

  final List<ProductModel> products = [
    ProductModel(
      id: '0',
      name: 'Pedialyte',
      description:
          'Hydration. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec risus libero, egestas ac ultrices et, placerat ac mi. Integer quis efficitur ipsum. Fusce gravida lobortis efficitur. Mauris vitae malesuada eros, et aliquet quam.',
      quantity: 1,
      price: 5.00,
      imageUrl: 'assets/images/medicine/5.jpg',
      category: 'Children\'s Health',
    ),
    ProductModel(
      id: '1',
      name: 'Lisinopril',
      description:
          'High blood pressure management. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec risus libero, egestas ac ultrices et, placerat ac mi. Integer quis efficitur ipsum. Fusce gravida lobortis efficitur. Mauris vitae malesuada eros, et aliquet quam.',
      quantity: 30,
      price: 10.00,
      imageUrl: 'assets/images/medicine/2.jpg',
      category: 'Chronic Condition Management',
    ),
    ProductModel(
      id: '2',
      name: 'Blood Pressure Monitor',
      description:
          'Blood pressure tracking. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec risus libero, egestas ac ultrices et, placerat ac mi. Integer quis efficitur ipsum. Fusce gravida lobortis efficitur. Mauris vitae malesuada eros, et aliquet quam.',
      quantity: 1,
      price: 60.00,
      imageUrl: 'assets/images/medicine/3.jpg',
      category: 'Medical Equipment',
    ),
    ProductModel(
      id: '3',
      name: 'B-Complex Vitamins',
      description:
          'Energy support. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec risus libero, egestas ac ultrices et, placerat ac mi. Integer quis efficitur ipsum. Fusce gravida lobortis efficitur. Mauris vitae malesuada eros, et aliquet quam.',
      quantity: 100,
      price: 12.00,
      imageUrl: 'assets/images/medicine/4.jpg',
      category: 'Health and Wellness',
    ),
    ProductModel(
      id: '4',
      name: 'Afrin',
      description:
          'Nasal decongestant. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec risus libero, egestas ac ultrices et, placerat ac mi. Integer quis efficitur ipsum. Fusce gravida lobortis efficitur. Mauris vitae malesuada eros, et aliquet quam.',
      quantity: 1,
      price: 8.00,
      imageUrl: 'assets/images/medicine/5.jpg',
      category: 'OTC Medicine',
    ),
    ProductModel(
      id: '5',
      name: 'Cetaphil Cleanser',
      description:
          'Gentle skin cleanser. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec risus libero, egestas ac ultrices et, placerat ac mi. Integer quis efficitur ipsum. Fusce gravida lobortis efficitur. Mauris vitae malesuada eros, et aliquet quam.',
      quantity: 1,
      price: 12.00,
      imageUrl: 'assets/images/medicine/6.jpg',
      category: 'Personal Care',
    ),
    ProductModel(
      id: '6',
      name: 'Lipitor',
      description:
          'Lowers cholesterol. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec risus libero, egestas ac ultrices et, placerat ac mi. Integer quis efficitur ipsum. Fusce gravida lobortis efficitur. Mauris vitae malesuada eros, et aliquet quam.',
      quantity: 30,
      price: 120.00,
      imageUrl: 'assets/images/medicine/7.jpg',
      category: 'Prescription Medicine',
    ),
    ProductModel(
      id: '7',
      name: 'Theraflu',
      description:
          'Cold and flu relief. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec risus libero, egestas ac ultrices et, placerat ac mi. Integer quis efficitur ipsum. Fusce gravida lobortis efficitur. Mauris vitae malesuada eros, et aliquet quam.',
      quantity: 1,
      price: 8.00,
      imageUrl: 'assets/images/medicine/8.jpg',
      category: 'Senior Care',
    ),
  ];

  final List<Map<String, dynamic>> services = [
    {
      'title': 'We Deliver',
      'subtitle': 'Your Medicine',
      'description': 'Get your medicines delivered to your doorstep quickly.',
      'icon': 'assets/images/fast_delivery.png',
      'color': NavyBlue
    },
    {
      'title': 'Order Quickly',
      'subtitle': 'With Prescription',
      'description': 'We provide round-the-clock support for your convenience.',
      'icon': 'assets/images/24_support.png',
      'color': NavyBlue
    },
    {
      'title': 'Affordable',
      'subtitle': 'Prices',
      'description': 'Get the best prices on your medicines.',
      'icon': 'assets/images/low_price.png',
      'color': NavyBlue
    },
    {
      'title': 'Quality',
      'subtitle': 'Assurance',
      'description': 'All our medicines are quality checked and verified.',
      'icon': 'assets/images/medicine_quality.png',
      'color': NavyBlue
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CartPage(back: true)),
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
                            child: const Center(
                              child: Icon(
                                FontAwesomeIcons.cartShopping,
                                color: Colors.white,
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
                              "Hello, John Doe",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.height * 0.019,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Welcome to HealthLink",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.height * 0.02,
                                  fontWeight: FontWeight.w300),
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
                                  builder: (context) => const NotificationPage(
                                        back: true,
                                      )),
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
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.08),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'HealthLink',
                                style: TextStyle(
                                  color: BlueGrotto,
                                  fontSize: size.height * 0.05,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.55,
                                child: Text(
                                  'We will deliver your medications',
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 120, 120, 120),
                                    fontSize: size.width * 0.06,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.01),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ProductsPage(
                                            back: true,
                                          )),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffff5959),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                fixedSize:
                                    Size(size.width * 0.29, size.width * 0.08),
                              ),
                              child: Text(
                                "Order Now",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: size.height * 0.014,
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Top Categories',
                                style: TextStyle(
                                  fontSize: size.width * 0.05,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 60, 60, 60),
                                )),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CategoryPage()),
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Text('See All',
                                          style: TextStyle(
                                            fontSize: size.width * 0.03,
                                            fontWeight: FontWeight.w500,
                                            color: const Color.fromARGB(
                                                255, 123, 123, 123),
                                          )),
                                      Icon(
                                        Boxicons.bx_chevrons_right,
                                        size: size.width * 0.05,
                                        color: const Color.fromARGB(
                                            255, 123, 123, 123),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        )),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.05),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: categories.map((category) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                category['page']!),
                                      );
                                    },
                                    child: Container(
                                      width: size.width * 0.16,
                                      height: size.width * 0.16,
                                      decoration: BoxDecoration(
                                        color: BlueGreen.withOpacity(0.6),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(50)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            spreadRadius: 1,
                                            blurRadius: 2,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          category['image']!,
                                          width: size.width * 0.1,
                                          height: size.width * 0.1,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.01),
                                  SizedBox(
                                    width: size.width * 0.19,
                                    child: Text(
                                      category['name']!,
                                      style: TextStyle(
                                          fontSize: size.height * 0.015),
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Popular Products',
                                style: TextStyle(
                                  fontSize: size.width * 0.05,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(255, 60, 60, 60),
                                )),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const ProductsPage(
                                            back: true,
                                          )),
                                );
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('See All',
                                      style: TextStyle(
                                        fontSize: size.width * 0.03,
                                        fontWeight: FontWeight.w500,
                                        color: const Color.fromARGB(
                                            255, 123, 123, 123),
                                      )),
                                  Icon(
                                    Boxicons.bx_chevrons_right,
                                    size: size.width * 0.05,
                                    color: const Color.fromARGB(
                                        255, 123, 123, 123),
                                  )
                                ],
                              ),
                            )
                          ],
                        )),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: products.map((product) {
                              return productCard(
                                size: size,
                                product: product,
                              );
                            }).toList(),
                          ),
                        )),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.05),
                      child: Text('Services',
                          style: TextStyle(
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 60, 60, 60),
                          )),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Column(
                      children: services.map((service) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.05,
                            vertical: size.width * 0.025,
                          ),
                          child: Container(
                            width: size.width,
                            height: size.width * 0.5,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [NavyBlue, BlueGreen],
                              ),
                              color: service['color'],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.05),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        service['title']!,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: size.width * 0.06,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        service['subtitle']!,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: size.width * 0.06,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.4,
                                        child: Text(
                                          service['description']!,
                                          style: TextStyle(
                                            color: BabyBlue,
                                            fontSize: size.width * 0.038,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Image.asset(
                                    service['icon']!,
                                    width: size.width * 0.3,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
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
