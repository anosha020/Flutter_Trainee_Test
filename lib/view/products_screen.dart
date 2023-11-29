import 'package:flutter/material.dart';
import 'package:flutter_trainee_test/model/product_model.dart';
import 'package:flutter_trainee_test/service/product_api.dart';
import 'package:flutter_trainee_test/view/product_detail_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late Future<List<ProductsModel>> _products;
  @override
  void initState() {
    super.initState();
    _products = getProductsApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[850],
        title: const Text(
          "PRODUCTS",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back),
        actions: [
          const Icon(Icons.shopping_cart),
          Padding(
            padding: EdgeInsets.only(left: 15.w, right: 15.w),
            child: const Icon(Icons.menu),
          )
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Expanded(
          child: FutureBuilder(
              future: _products,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  // return ListView.builder(
                  //     itemCount: productList.length,
                  //     itemBuilder: (context, index) {
                  //       return ListTile(
                  //         leading: Image.network(productList[index].image!),
                  //         title: Text(productList[index].title!.toString()),
                  //         subtitle:
                  //             Text(productList[index].description!.toString()),
                  //         trailing: Text(
                  //             '\$${productList[index].price?.toStringAsFixed(2)}'),
                  //         onTap: () {
                  //           // Handle product tap
                  //           // You can navigate to a product detail page or perform other actions.
                  //         },
                  //       );
                  //     });
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 20.0,
                      childAspectRatio: 0.45,
                    ),
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      var product = snapshot.data![index];
                      return Card(
                        color: Colors.white,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ProductDetailScreen(product: product),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.w, right: 10.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  product.image!,
                                  height: 210.h,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.title!,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Text(product.category!),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Text(
                                          "Available: ${product.rating!.count!}"),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Text(
                                        '\$${product.price?.toStringAsFixed(2)}',
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              }),
        ),
      )),
    );
  }
}
