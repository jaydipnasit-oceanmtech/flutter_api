import 'package:flutter/material.dart';
import 'package:flutter_application_api/%20common/constans/colors.dart';
import 'package:flutter_application_api/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_application_api/features/home/presentation/view/home_data/productdetial_screen_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetial extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final tital;
  // ignore: prefer_typing_uninitialized_variables
  final productid;
  // ignore: prefer_typing_uninitialized_variables
  final price;
  // ignore: prefer_typing_uninitialized_variables
  final discount;
  // ignore: prefer_typing_uninitialized_variables
  final idno;
  // ignore: prefer_typing_uninitialized_variables
  final status;
  // ignore: prefer_typing_uninitialized_variables
  final titalproduct;

  final HomeLoadedState state;
  const ProductDetial({
    super.key,
    required this.tital,
    required this.productid,
    required this.price,
    required this.discount,
    required this.idno,
    required this.status,
    required this.titalproduct,
    required this.state,
  });

  @override
  State<ProductDetial> createState() => _ProductDetialState();
}

class _ProductDetialState extends ProductDetialView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: black,
        leading: InkWell(
          child: const Icon(
            Icons.arrow_back,
            color: white,
          ),
          onTap: () {
            Navigator.pop(context);
            // colorimageCubit.state == 0;
          },
        ),
        title: textWidget(tital: "${widget.titalproduct}", size: 15.sp, weight: FontWeight.bold, color: white),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 350.h,
            width: 600.w,
            child: Image.network(
              widget.productid,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          colorselect(state: widget.state),
          SizedBox(
            height: 10.h,
          ),
          textWidget(
            tital: "${widget.tital}",
            size: 20,
            weight: FontWeight.bold,
          ),
          textWidget(
            tital: "Product Id: ₹${widget.idno}",
            size: 18,
            color: Colors.black,
            weight: FontWeight.w300,
          ),
          textWidget(
            tital: "prise: ₹${widget.price}",
            size: 18,
            color: Colors.black,
            weight: FontWeight.w400,
          ),
          textWidget(
            tital: "Discount: ₹${widget.discount == null ? widget.discount : "400"}",
            size: 18,
            color: Colors.black,
            weight: FontWeight.w300,
          ),
          textWidget(
            tital: "Product status ${widget.status}",
            size: 18,
            color: Colors.black,
            weight: FontWeight.w300,
          ),
          SizedBox(height: 20.h),
          commonButtton(context1: context),
          SizedBox(height: 10.h),
        ]),
      ),
    );
  }
}
