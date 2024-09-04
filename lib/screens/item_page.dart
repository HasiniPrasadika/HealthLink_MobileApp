import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:health_link/const/colors.dart';
import 'package:health_link/models/product_model.dart';
import 'package:health_link/screens/home/notifications.dart';

class ItemPage extends StatefulWidget {
  final ProductModel medicine;
  const ItemPage({super.key, required this.medicine});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  int _quantity = 1;
  String _selectedPaymentMethod = 'Credit Card';
  String _selectedAddress = 'Home Address';

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
                              widget.medicine.name,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                        child: Image.asset(
                          widget.medicine.imageUrl,
                          width: size.width,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.width * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: size.height * 0.02),
                          Text(
                            widget.medicine.name,
                            style: TextStyle(
                                color: NavyBlue,
                                fontSize: size.height * 0.03,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: size.height * 0.01),
                          Text(
                            '\$${widget.medicine.price.toStringAsFixed(2)}',
                            style: TextStyle(
                                color: BlueGrotto,
                                fontSize: size.height * 0.025,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: size.height * 0.02),
                          Text(
                            widget.medicine.description,
                            style: TextStyle(
                              color: const Color.fromARGB(255, 108, 108, 108),
                              fontSize: size.height * 0.02,
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          _buildQuantitySelector(size),
                          SizedBox(height: size.height * 0.02),
                          _buildPaymentMethodSelector(size),
                          SizedBox(height: size.height * 0.02),
                          _buildAddressSelector(size),
                          SizedBox(height: size.height * 0.04),
                          _buildPlaceOrderButton(size),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuantitySelector(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Quantity',
          style: TextStyle(
            color: NavyBlue,
            fontSize: size.height * 0.025,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: Container(
                width: size.width * 0.06,
                height: size.width * 0.06,
                decoration: const BoxDecoration(
                    color: Color(0xFFE3E3E3),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Icon(
                  Icons.remove,
                  color: const Color(0xFF939393),
                  size: size.width * 0.05,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (_quantity > 1) {
                    _quantity--;
                  }
                });
              },
            ),
            Text(
              '$_quantity',
              style: TextStyle(
                color: Colors.black,
                fontSize: size.height * 0.024,
              ),
            ),
            IconButton(
              icon: Container(
                width: size.width * 0.06,
                height: size.width * 0.06,
                decoration: const BoxDecoration(
                    color: Color(0xFFE3E3E3),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Icon(
                  Icons.add,
                  color: const Color(0xFF939393),
                  size: size.width * 0.05,
                ),
              ),
              onPressed: () {
                setState(() {
                  _quantity++;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPaymentMethodSelector(Size size) {
    List<Map<String, String>> paymentMethods = [
      {'name': 'Credit Card', 'image': 'assets/images/credit.png'},
      {'name': 'Debit Card', 'image': 'assets/images/debit.png'},
      {'name': 'Cash on Delivery', 'image': 'assets/images/cashon.png'},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Method',
          style: TextStyle(
            color: NavyBlue,
            fontSize: size.height * 0.025,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Column(
          children: paymentMethods.map((method) {
            return RadioListTile<String>(
              title: Row(
                children: [
                  Image.asset(
                    method['image']!,
                    width: size.width * 0.07,
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  ),
                  Text(
                    method['name']!,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: size.height * 0.023,
                    ),
                  ),
                ],
              ),
              value: method['name']!,
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value!;
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildAddressSelector(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Delivery Address',
          style: TextStyle(
            color: NavyBlue,
            fontSize: size.height * 0.025,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: size.height * 0.01),
        DropdownButton<String>(
          value: _selectedAddress,
          isExpanded: true,
          items: ['Home Address', 'Office Address', 'Other']
              .map((address) => DropdownMenuItem<String>(
                    value: address,
                    child: Text(
                      address,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: size.height * 0.02,
                      ),
                    ),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              _selectedAddress = value!;
            });
          },
        ),
      ],
    );
  }

  Widget _buildPlaceOrderButton(Size size) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: NavyBlue,
          padding: EdgeInsets.symmetric(
              vertical: size.height * 0.015, horizontal: size.width * 0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          // Handle place order logic
        },
        child: Text(
          'Place Order',
          style: TextStyle(
            color: Colors.white,
            fontSize: size.height * 0.025,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
