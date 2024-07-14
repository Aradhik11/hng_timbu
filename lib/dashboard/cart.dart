import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hng_stage_two/constant/asset_constant.dart';
import 'package:hng_stage_two/dashboard/order.dart';
import 'package:hng_stage_two/model/product.dart';

import '../theme/pallete.dart';

class AddToCart extends StatefulWidget {
  final List cart;
  final Function(Product) removeFromCart;
  const AddToCart(
      {super.key, required this.cart, required this.removeFromCart});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SvgPicture.asset(
          AssetConstant.iconMenu,
          fit: BoxFit.scaleDown,
        ),
        title: RichText(
            text: const TextSpan(
                text: 'Timbu',
                style: TextStyle(
                    color: Pallete.pinkColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
                children: [
              TextSpan(text: 'Med', style: TextStyle(color: Pallete.shadeGrey))
            ])),
        actions: [
          SvgPicture.asset(AssetConstant.iconNotification),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const Text(
              'Cart Summary',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: widget.cart.length,
                  itemBuilder: (_, index) {
                    final cartItem = widget.cart[index] as Product;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        height: 90,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          children: [
                            Container(
                              width: 120,
                              height: 90,
                              decoration:
                                  const BoxDecoration(color: Pallete.shadeGrey),
                              child: Image.network(cartItem.photo),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Multi Vitamiins For Men',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(
                                      width: 40,
                                    ),
                                    SvgPicture.asset(
                                      AssetConstant.iconLove,
                                      fit: BoxFit.scaleDown,
                                    )
                                  ],
                                ),
                                Text(cartItem.name,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w200)),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('# ${cartItem.currentPrice}'),
                                    const SizedBox(
                                      width: 25,
                                    ),
                                    Container(
                                      height: 20,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: Pallete.shadeGrey,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            '-',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Text('1',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400)),
                                          Text('+',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400)),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          widget.removeFromCart(cartItem);
                                          setState(() {});
                                        },
                                        child: SvgPicture.asset(
                                            AssetConstant.iconDelete))
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Order(
                              cart: widget.cart,
                              removeFromCart: widget.removeFromCart,
                            )));
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Pallete.pinkColor,
                    borderRadius: BorderRadius.circular(15)),
                child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Center(
                        child: Text(
                      'Checkout',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ))),
              ),
            ),
            const SizedBox(
              height: 13,
            )
          ],
        ),
      ),
    );
  }
}
