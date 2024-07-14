import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hng_stage_two/constant/asset_constant.dart';
import 'package:hng_stage_two/theme/pallete.dart';

class Description extends StatefulWidget {
  String photo;
  String name;
  String description;
  String price;
  Description(
      {super.key,
      required this.photo,
      required this.name,
      required this.description,
      required this.price});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Pallete.pinkColor,
                    borderRadius: BorderRadius.circular(50)),
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 17,
                  color: Pallete.whiteColor,
                )),
          ),
          actions: [
            SvgPicture.asset(AssetConstant.iconCart),
            const SizedBox(
              width: 29,
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                child: Image.network(
                  widget.photo,
                  width: double.infinity,
                  height: 230,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              title: const Text('Multivitamins for men'),
              subtitle: const Text('multivitamins'),
              trailing: SizedBox(
                height: 30,
                width: 70,
                child: Container(
                  decoration: BoxDecoration(
                      color: Pallete.shadeGrey,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        '-',
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w400),
                      ),
                      Text('1',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w400)),
                      Text('+',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w400)),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Pallete.yellowColor,
                    size: 12,
                  ),
                  Icon(
                    Icons.star,
                    color: Pallete.yellowColor,
                    size: 12,
                  ),
                  Icon(
                    Icons.star,
                    color: Pallete.yellowColor,
                    size: 12,
                  ),
                  Icon(
                    Icons.star,
                    color: Pallete.yellowColor,
                    size: 12,
                  ),
                  Icon(
                    Icons.star,
                    color: Pallete.yellowColor,
                    size: 12,
                  ),
                  Text(
                    '(320 Reviews)',
                    style: TextStyle(fontSize: 10),
                  ),
                  SizedBox(width: 90,),
                  Text('Available in stock',style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600))
                ],
              ),
            ),
            const SizedBox(height: 30,),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text('Description'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Get a little lift from Men's Multivitamins, featuring a comprehensive blend of essential vitamins and minerals tailored for men's health. Experience sustained energy and overall well-being throughout the day. Men's Multivitamins offer a carefully formulated combination of nutrients to support immune function, muscle health, and mental clarity. This unique formulation makes a fresh statement for improved daily vitality and optimal performance.",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
              ),
            ),
            const SizedBox(
              height: 38,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Total Price',
                        style: TextStyle(
                            color: Pallete.shadeGrey,
                            fontWeight: FontWeight.w200,
                            wordSpacing: -1.9,
                            letterSpacing: -1,
                            fontSize: 12),
                      ),
                      Text(
                        '#${widget.price}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18),
                      ),
                    ],
                  ),
                  Container(
                    height: 37,
                    decoration: BoxDecoration(
                        color: Pallete.pinkColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AssetConstant.iconCart,
                            color: Pallete.whiteColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Add to cart',
                            style: TextStyle(color: Pallete.whiteColor),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                backgroundColor: Pallete.whiteColor,
                icon: SvgPicture.asset(
                  AssetConstant.iconHome,
                  color: _currentIndex == 0 ? Pallete.yellowColor : null,
                ),
                label: 'home'),
            BottomNavigationBarItem(
                backgroundColor: Pallete.whiteColor,
                icon: SvgPicture.asset(
                  AssetConstant.iconCart,
                  color: _currentIndex == 1 ? Pallete.yellowColor : null,
                ),
                label: 'Cart'),
            BottomNavigationBarItem(
                backgroundColor: Pallete.whiteColor,
                icon: SvgPicture.asset(
                  AssetConstant.iconDescriiption,
                  color: _currentIndex == 2 ? Pallete.yellowColor : null,
                ),
                label: 'market'),
            BottomNavigationBarItem(
                backgroundColor: Pallete.whiteColor,
                icon: SvgPicture.asset(
                  AssetConstant.iconLove,
                  color: _currentIndex == 3 ? Pallete.yellowColor : null,
                ),
                label: 'wallet'),
            BottomNavigationBarItem(
                backgroundColor: Pallete.whiteColor,
                icon: SvgPicture.asset(
                  AssetConstant.iconProfile,
                  color: _currentIndex == 4 ? Pallete.yellowColor : null,
                ),
                label: 'profile')
          ],
          currentIndex: _currentIndex,
          selectedItemColor: Pallete.yellowColor,
          onTap: (int newValue) {
            setState(() {
              _currentIndex = newValue;
              switch (_currentIndex) {
                case 0:
                  break;
                case 1:
                  break;
                case 2:
                  break;
                case 3:
                  break;
                case 4:
                  break;
                default:
                  print('no cases');
              }
            });
          },
        ));
  }
}
