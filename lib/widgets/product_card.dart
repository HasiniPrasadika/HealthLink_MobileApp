import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:health_link/const/colors.dart';
import 'package:health_link/models/product_model.dart';
import 'package:health_link/screens/item_page.dart';

class productCard extends StatelessWidget {
  final bool cart;
  final ProductModel product;
  const productCard(
      {super.key, required this.size, required this.product, this.cart = true});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          // Add any action on tap if needed
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ItemPage(medicine: product),
            ),
          );
        },
        child: Container(
          width: size.width * 0.36,
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: size.width * 0.4,
                height: size.width * 0.268,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  image: DecorationImage(
                    image: AssetImage(product.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(size.width * 0.03),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                        fontSize: size.height * 0.02,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff333333),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: size.height * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: size.height * 0.018,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        cart == true
                            ? Row(
                                children: [
                                  Icon(
                                    Boxicons.bx_heart,
                                    size: size.width * 0.055,
                                    color: BlueGrotto,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  Icon(
                                    Boxicons.bx_cart,
                                    size: size.width * 0.062,
                                    color: BlueGrotto,
                                  )
                                ],
                              )
                            : Row(
                                children: [
                                  Icon(
                                    Boxicons.bx_heart,
                                    size: size.width * 0.055,
                                    color: BlueGrotto,
                                  ),
                                ],
                              ),
                      ],
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
}
