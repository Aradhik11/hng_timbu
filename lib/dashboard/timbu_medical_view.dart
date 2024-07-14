import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hng_stage_two/api.dart';
import 'package:hng_stage_two/constant/asset_constant.dart';
import 'package:hng_stage_two/dashboard/description.dart';
import '../model/product.dart';
import '../theme/pallete.dart';

class MedicalView extends StatefulWidget {
  final List product;
  final Function(Product) addToCart;
  const MedicalView(
      {super.key, required this.product, required this.addToCart});

  @override
  State<MedicalView> createState() => _MedicalViewState();
}

class _MedicalViewState extends State<MedicalView> {
  // List product = [];
  // List cart = [];
  // ApiService apiService = ApiService();

  // addToCart() {
  //   if (cart.contains(product)) {
  //   } else {
  //     cart.add(product);
  //   }
  //   setState(() {});
  // }

  // Future<void> getProduct() async {
  //   product = await apiService.getProductList();
  //   setState(() {});
  // }

  // @override
  // void initState() {
  //   getProduct();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        leading: SvgPicture.asset(
          AssetConstant.iconMenu,
          fit: BoxFit.scaleDown,
        ),
        actions: [
          SvgPicture.asset(AssetConstant.iconShop),
          const SizedBox(
            width: 7,
          ),
          SvgPicture.asset(AssetConstant.iconNotification),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              height: 48,
              child: TextField(
                // controller: searchController,

                onChanged: (value) async {
                  // var search =
                  //     await _searchViewModel.searchPosts(searchController.text);
                  // search = value;
                },
                decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Search for products...',
                    hintStyle: const TextStyle(
                        fontWeight: FontWeight.w300, fontSize: 12),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: SvgPicture.asset(
                        AssetConstant.iconSearch,
                        fit: BoxFit.scaleDown,
                        color: Pallete.blackColor,
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: SvgPicture.asset(
                        AssetConstant.iconFilter,
                        fit: BoxFit.scaleDown,
                        color: Pallete.blackColor,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                            color: Pallete.blueColor, width: 2.5)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                            color: Pallete.blackColor, width: 1))),
              ),
            ),

            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Category'),
                Text(
                  'Vitamins',
                  style: TextStyle(color: Pallete.pinkColor),
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  AssetConstant.iconGrid,
                  fit: BoxFit.scaleDown,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(Icons.menu)
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              
              child: GridView.builder(
                itemCount: widget.product.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 3, mainAxisSpacing: 3, crossAxisCount: 2),
                itemBuilder: (_, index) {
                  final realProduct = widget.product[index];
                  return Container(
                    height: 184,
                    width: 160,
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                        color: const Color(0xffF6FAFF),
                        border: Border.all(
                          width: 0.4
                        ),
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                            alignment: Alignment.topRight,
                            child: SvgPicture.asset(AssetConstant.iconLove)),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Description(
                                        photo: realProduct.photo,
                                        name: realProduct.name,
                                        description: realProduct.description,
                                        price: realProduct.currentPrice
                                            .toString())));
                          },
                          child: Image.network(
                            '${realProduct.photo}',
                            height: 60,
                            width: 120,
                          ),
                        ),
                        Text('${realProduct.name}'),
                        Row(
                          children: [
                            const Text('Niacin',style: TextStyle(fontSize: 12),),
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Text('1.8gram'))
                          ],
                        ),
                        const Row(
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
                              '(4.8 ratings)',
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '#${realProduct.currentPrice}',
                              style: const TextStyle(color: Pallete.pinkColor),
                            ),
                            GestureDetector(
                              onTap: () {
                                widget.addToCart(realProduct);
                                print('added to cart');
                                setState(() {});
                              },
                              child: SvgPicture.asset(
                                AssetConstant.iconShop,
                                color: Pallete.pinkColor,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(
              height: 10,
            ),
            // Expanded(
            //   child: Obx(() {
            //     return ListView.builder(
            //         itemCount: productViewModel.products.length,
            //         scrollDirection: Axis.horizontal,
            //         itemBuilder: (context, index) {
            //           final product = productViewModel.products[index];
            //           return Align(
            //             alignment: Alignment.topLeft,
            //             child: Padding(
            //               padding: const EdgeInsets.symmetric(horizontal: 7),
            //               child: Container(
            //                 width: 150,
            //                 height: 223,
            //                 padding: const EdgeInsets.symmetric(horizontal: 20),
            //                 decoration:
            //                 BoxDecoration(color: Pallete.whiteColor, borderRadius: BorderRadius.circular(10) ),
            //                 child: Padding(
            //                   padding: const EdgeInsets.symmetric(
            //                       vertical: 10,),
            //                   child: GestureDetector(
            //                     onTap: (){
            //                       Navigator.push(context, MaterialPageRoute(builder: (context) => PurchaseView(imgUrl: 'https://connectus-853807fba958.herokuapp.com${product.imageUrl}', nameOfProduct: product.name, description: product.description, username: product.name, productId: product.id,)));
            //                     },
            //                     child: Column(
            //                       crossAxisAlignment: CrossAxisAlignment.start,
            //                       children: [
            //                         const Row(
            //                           children: [
            //                             CircleAvatar(
            //                               radius: 10,
            //                             ),
            //                             SizedBox(
            //                               width: 10,
            //                             ),
            //                             Text('Username')
            //                           ],
            //                         ),
            //                         const SizedBox(
            //                           height: 15,
            //                         ),
            //                         Image.network(
            //                           'https://connectus-853807fba958.herokuapp.com${product.imageUrl}',
            //                           width: 100,
            //                           height: 70,
            //                         ),
            //                         const SizedBox(
            //                           height: 15,
            //                         ),
            //                         Text(
            //                           product.name,
            //                           style: const TextStyle(
            //                               fontSize: 14,
            //                               fontWeight: FontWeight.w700),
            //                         ),
            //                         const SizedBox(
            //                           height: 15,
            //                         ),
            //                         Text('${product.quantity} items left', style: TextStyle(color: Pallete.shadeGrey)),
            //                         const SizedBox(
            //                           height: 15,
            //                         ),
            //                         Text(
            //                           '£${product.price}',
            //                           style: TextStyle(
            //                               fontSize: 16,
            //                               color: Pallete.yellowColor,
            //                               fontWeight: FontWeight.w600),
            //                         )
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           );
            //         });
            //   })
            // ),
            // const Align(
            //     alignment: Alignment.topLeft,
            //     child: Text('Regular', style: TextStyle(fontSize: 21, color: Pallete.registrationColor))),
            // const SizedBox(
            //   height: 10,
            // ),
            // Expanded(
            //   child: Obx(() {
            //     return ListView.builder(
            //         itemCount: productViewModel.products.length,
            //         scrollDirection: Axis.horizontal,
            //         itemBuilder: (context, index) {
            //           final product = productViewModel.products[index];
            //           return Align(
            //             alignment: Alignment.topLeft,
            //             child: Padding(
            //               padding: const EdgeInsets.symmetric(horizontal: 7),
            //               child: Container(
            //                 width: 150,
            //                 height: 223,
            //                 padding: const EdgeInsets.symmetric(horizontal: 20),
            //                 decoration:
            //                 BoxDecoration(color: Pallete.whiteColor, borderRadius: BorderRadius.circular(10)),
            //                 child: Padding(
            //                   padding: const EdgeInsets.symmetric(
            //                     vertical: 10,),
            //                   child: GestureDetector(
            //                     onTap: (){
            //                       Navigator.push(context, MaterialPageRoute(builder: (context) => PurchaseView(imgUrl: 'https://connectus-853807fba958.herokuapp.com${product.imageUrl}', nameOfProduct: product.name, description: product.description, username: product.name, productId: product.id,)));
            //                     },
            //                     child: Column(
            //                       crossAxisAlignment: CrossAxisAlignment.start,
            //                       children: [
            //                         const Row(
            //                           children: [
            //                             CircleAvatar(
            //                               radius: 10,
            //                             ),
            //                             SizedBox(
            //                               width: 10,
            //                             ),
            //                             Text('Username')
            //                           ],
            //                         ),
            //                         const SizedBox(
            //                           height: 15,
            //                         ),
            //                         Image.network(
            //                           'https://connectus-853807fba958.herokuapp.com${product.imageUrl}',
            //                           width: 100,
            //                           height: 70,
            //                         ),
            //                         const SizedBox(
            //                           height: 15,
            //                         ),
            //                         Text(
            //                           product.name,
            //                           style: const TextStyle(
            //                               fontSize: 14,
            //                               fontWeight: FontWeight.w700),
            //                         ),
            //                         const SizedBox(
            //                           height: 15,
            //                         ),
            //                         Text('${product.quantity} items left', style: TextStyle(color: Pallete.shadeGrey),),
            //                         const SizedBox(
            //                           height: 15,
            //                         ),
            //                         Text(
            //                           '£${product.price}',
            //                           style: const TextStyle(
            //                               fontSize: 16,
            //                               color: Pallete.yellowColor,
            //                               fontWeight: FontWeight.w600),
            //                         )
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           );
            //         });
            //   })
            // ),
          ],
        ),
      ),
    );
  }
}
