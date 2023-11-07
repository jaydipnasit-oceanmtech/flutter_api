import 'package:flutter/material.dart';
import 'package:flutter_application_api/%20common/constans/colors.dart';
import 'package:flutter_application_api/di/get_it.dart';
import 'package:flutter_application_api/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_application_api/features/home/presentation/view/home_data/productdetial_Screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

abstract class ProductDetialView extends State<ProductDetial> {
  late HomeCubit homeCubit;
  @override
  void initState() {
    homeCubit = getItInstance<HomeCubit>();
    homeCubit.loadInitialData();

    super.initState();
  }

  @override
  void dispose() {
    homeCubit.close();
    super.dispose();
  }

  Widget textWidget({
    required String tital,
    required double size,
    required FontWeight weight,
    Color? color,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.h),
      child: Text(
        tital,
        style: GoogleFonts.poppins(fontSize: size.sp, fontWeight: weight, color: color),
      ),
    );
  }

  Widget commonButtton({required BuildContext context1}) {
    return Center(
      child: MaterialButton(
        onPressed: () {
          Navigator.pop(context1);
        },
        minWidth: 320.w,
        height: 40.h,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        color: black,
        child: textWidget(
          tital: 'Done',
          color: white,
          size: 15.sp,
          weight: FontWeight.w500,
        ),
      ),
    );
  }

  List color1 = [
    Colors.transparent,
    Colors.purple,
    Colors.indigo,
    Colors.deepOrange,
    Colors.yellow,
  ];

  Widget colorselect({required HomeLoadedState state}) {
    return Row(
        children: List.generate(
            5,
            (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                      onTap: () {
                        homeCubit.colorChange(index);
                      },
                      child: Container(
                        height: 30.h,
                        width: 30.h,
                        decoration: BoxDecoration(
                            color: color1[index],
                            border: Border.all(color: state.colorindex==index? Colors.black : Colors.white, width: 2.w),
                            shape: BoxShape.circle),
                      )),
                )));
  }
}
