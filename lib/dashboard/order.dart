import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../constant/asset_constant.dart';
import '../model/product.dart';
import '../theme/pallete.dart';

class Order extends StatefulWidget {
  final List cart;
  final Function(Product) removeFromCart;
  const Order({super.key, required this.cart, required this.removeFromCart});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
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
            const Text('Order Summary'),
            Expanded(
              child: ListView.builder(
                  itemCount: widget.cart.length,
                  itemBuilder: (_, index) {
                    final orderItem = widget.cart[index] as Product;
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 90,
                                height: 90,
                                child: Image.network(orderItem.photo),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${orderItem.name}',
                                    style:
                                        const TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  const Text('Brain booster pills'),
                                  RichText(
                                      text: const TextSpan(
                                          text: 'Vemdor: ',
                                          style: TextStyle(
                                              color: Pallete.blackColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                          children: [
                                        TextSpan(
                                            text: 'Aradhik',
                                            style: TextStyle(
                                                color: Pallete.shadeGrey))
                                      ])),
                                  Text(
                                    ' #${orderItem.currentPrice}',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        color: Pallete.pinkColor,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const Text(
                                    'In stock',
                                    style: TextStyle(
                                      color: Pallete.yellowColor,
                                      fontSize: 10,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 65,
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Pallete.pinkColor,
                                      ),
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(AssetConstant.iconDelete),
                              const SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    widget.removeFromCart(orderItem);
                                    setState(() {});
                                  },
                                  child: const Text('Remove')),
                              const SizedBox(
                                width: 160,
                              ),
                              SizedBox(
                                height: 30,
                                width: 70,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Pallete.shadeGrey,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        '-',
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text('1',
                                          style: TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.w400)),
                                      Text('+',
                                          style: TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
