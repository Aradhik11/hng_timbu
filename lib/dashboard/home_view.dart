import 'package:flutter/material.dart';
import 'package:hng_stage_two/api.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List product = [];
  ApiService apiService = ApiService();

  Future<void> getProduct() async {
    product = await apiService.getProductList();
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
      backgroundColor: const Color(0xffF3F3F3),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Aradhik Store'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Align(
                  alignment: Alignment.topLeft,
                  child: Text('Most Purchased',
                      style:
                          TextStyle(fontSize: 21, color: Color(0xff797979)))),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: product.length,
                    itemBuilder: (_, index) {
                      final realProduct = product[index];
                      print(product.length);
                      return Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: Container(
                            width: 150,
                            height: 180,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Image.network(
                                    realProduct.photo,
                                    width: 100,
                                    height: 70,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    realProduct.name,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'NGN ${realProduct.currentPrice}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xfff0c100),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              const Align(
                  alignment: Alignment.topLeft,
                  child: Text('Regular',
                      style:
                          TextStyle(fontSize: 21, color: Color(0xff797979)))),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: product.length,
                    itemBuilder: (_, index) {
                      final realProduct = product[index];
                      print(product.length);
                      return Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: Container(
                            width: 150,
                            height: 180,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Image.network(
                                    realProduct.photo,
                                    width: 100,
                                    height: 70,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    realProduct.name,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'NGN ${realProduct.currentPrice}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Color(0xfff0c100),
                                        fontWeight: FontWeight.w600),
                                  ),
                                 
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
