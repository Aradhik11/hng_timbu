import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hng_stage_two/constant/asset_constant.dart';
import 'package:hng_stage_two/theme/pallete.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Payment Method'),
            const SizedBox(
              height: 7,
            ),
            Container(
              height: 170,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all()),
              child: Column(
                children: [
                  Container(
                    height: 30,
                    decoration: const BoxDecoration(
                        color: Color(0xffDCD6F7),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12))),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 7,
                        ),
                        const Text('Paystack'),
                        const SizedBox(
                          width: 60,
                        ),
                        SvgPicture.asset(AssetConstant.iconVisa),
                        SvgPicture.asset(AssetConstant.iconMastercard),
                        SvgPicture.asset(AssetConstant.iconPaypal)
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(child: SvgPicture.asset(AssetConstant.iconCard)),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'After clicking "pay now" you will be redirected to paystack to complete your purchase securely ',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            const Text('Delivery Address'),
            const SizedBox(
              height: 7,
            ),
            Container(
              height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Dhikrullah Abdur-Rahmon',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Adeyemo Akapo Street ! Lagos - Ikeja ! +2349022804539',
                        style:
                            TextStyle(fontSize: 7, fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      Container(
                        height: 15,
                        width: 45,
                        decoration: BoxDecoration(
                            color: Pallete.pinkColor,
                            borderRadius: BorderRadius.circular(3)),
                        child: const Center(
                            child: Text(
                          'Edit',
                          style: TextStyle(
                              fontSize: 7,
                              color: Pallete.whiteColor,
                              fontWeight: FontWeight.w300),
                        )),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            const Text('Shipping Method'),
            const SizedBox(
              height: 7,
            ),
            Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                  border: Border.all(),
                  color: const Color(0xffF9FBFD),
                  borderRadius: BorderRadius.circular(10)),
              child: const Text(
                  'Enter your shipping address to view available shipping methods.',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300)),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 11),
              decoration: BoxDecoration(
                  color: const Color(0xffF9FBFD),
                  borderRadius: BorderRadius.circular(5)),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Order Summary'),
                  Divider(),
                  Row(
                   
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Subtotal:',style: TextStyle(fontWeight: FontWeight.w300),),
                      Text('# 15,000.00',style: TextStyle(fontWeight: FontWeight.w300)),
                    ],
                  ),
                  Row(
                    
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tax:',style: TextStyle(fontWeight: FontWeight.w300)),
                      Text('# 500.00',style: TextStyle(fontWeight: FontWeight.w300)),
                    ],
                  ),
                  Row(
                    
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Shipping:',style: TextStyle(fontWeight: FontWeight.w300)),
                      Text('# 1,000.00',style: TextStyle(fontWeight: FontWeight.w300)),
                    ],
                  ),
                  Divider(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total:',style: TextStyle(fontWeight: FontWeight.w400)),
                        Text('# 16,500.00',style: TextStyle(color: Pallete.pinkColor, fontSize: 15, fontWeight: FontWeight.w600)),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 15,),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Pallete.pinkColor,
                    borderRadius: BorderRadius.circular(15)),
                child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Center(
                        child: Text(
                      'Pay Now',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16),
                    ))),
              ),
          ],
        ),
      ),
    );
  }
}
