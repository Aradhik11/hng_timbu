import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hng_stage_two/dashboard/cart.dart';
import 'package:hng_stage_two/dashboard/order.dart';
import 'package:hng_stage_two/dashboard/payment.dart';
import 'package:hng_stage_two/dashboard/timbu_medical_view.dart';

import '../api.dart';
import '../constant/asset_constant.dart';
import '../model/product.dart';
import '../theme/pallete.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  List product = [];
  List cart = [];
  ApiService apiService = ApiService();

  addToCart(Product product) {
    if (cart.contains(product)) {
    } else {
      cart.add(product);
    }
    setState(() {});
  }

  Future<void> getProduct() async {
    product = await apiService.getProductList();
    setState(() {});
  }

  void removeFromCart(Product product) {
    cart.remove(product);
    setState(() {});
  }

  @override
  void initState() {
    getProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          MedicalView(product: product, addToCart: addToCart,),
          AddToCart(cart: cart, removeFromCart: removeFromCart,),
          Order(cart: cart, removeFromCart: removeFromCart,),
          Payment()
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
              label: 'Order'),
          BottomNavigationBarItem(
              backgroundColor: Pallete.whiteColor,
              icon: SvgPicture.asset(
                AssetConstant.iconLove,
                color: _currentIndex == 3 ? Pallete.yellowColor : null,
              ),
              label: 'Payment'),
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
            switch(_currentIndex){
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
              default: print('no cases');

            }
          });
        },
      ));
  }
}