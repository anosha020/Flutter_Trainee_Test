import 'package:flutter/material.dart';
import 'package:flutter_trainee_test/model/product_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductsModel product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey[850],
        title: const Text(
          "PRODUCT DETAILS",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
          // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        ),
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
          padding: EdgeInsets.only(top: 15.h),
          child: Column(
            children: [
              Image.network(
                widget.product.image!,
                height: 210.0
                    .h, // Set the desired height for the image in the detail screen
                width: double.infinity,
                fit: BoxFit.contain,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 30.0.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.title!,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24.0.sp),
                    ),
                    SizedBox(height: 5.0.h),
                    Text(
                      widget.product.category!,
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 15.sp),
                    ),
                    SizedBox(height: 8.0.h),
                    Text(widget.product.description!),
                    SizedBox(height: 20.0.h),
                    const Row(
                      children: [
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(Icons.star),
                        Icon(
                          Icons.star,
                          color: Colors.grey,
                        )
                      ],
                    ),
                    SizedBox(height: 20.0.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${widget.product.price?.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: 25.sp, fontWeight: FontWeight.bold),
                        ),
                        const Image(
                          image: AssetImage("assets/images/heart.png"),
                          color: Colors.black,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Icon(
                      Icons.shopping_cart_outlined,
                      size: 30.r,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
