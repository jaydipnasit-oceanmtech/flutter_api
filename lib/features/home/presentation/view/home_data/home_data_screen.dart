import 'package:flutter/material.dart';
import 'package:flutter_application_api/%20common/constans/colors.dart';
import 'package:flutter_application_api/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_application_api/features/home/presentation/view/home_data/home_data_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeDataScrene extends StatefulWidget {
  const HomeDataScrene({super.key});

  @override
  State<HomeDataScrene> createState() => _HomeDataScreneState();
}

class _HomeDataScreneState extends HomeDataWigets {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          ),
        ),
        titleSpacing: 1,
        title: Text(
          "S U G A R",
          style: GoogleFonts.poppins(
            color: white,
            fontWeight: FontWeight.w400,
            fontSize: 15.sp,
          ),
        ),
        backgroundColor: black,
        actions: [
          appIcon(icons: Icons.redeem),
          appIcon(icons: Icons.favorite_border_outlined),
          appIcon(icons: Icons.shopping_bag_outlined),
        ],
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: homeCubit,
        builder: (context, state) {
          if (state is HomeLordingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeLoadedState) {
            print("==========================${state.productDataEntity}");
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textFiledSugar(),
                  sugarList(state: state),
                  sliderItems(state: state),
                  sizedbox(),
                  bestsellers(text: "${state.productDataEntity[2].title}", state: state),
                  hotDeals(text: "${state.productDataEntity[3].title}", state: state),
                  SizedBox(height: 15.h),
                  justIn(text: "${state.productDataEntity[4].title}", state: state),
                  SizedBox(height: 13.h),
                  topPicks(
                      text: "${state.productDataEntity[6].title}",
                      TopL: 15.r,
                      TopR: 15.r,
                      bottomL: 15.r,
                      bottomR: 15.r,
                      state: state),
                  sizedbox(),
                  justIn(text: "TRY BEFORE YOU BUY", state: state),
                  sizedbox(),
                  giftingWidget(text: "${state.productDataEntity[7].title}", state: state,),
                  sizedbox(),
                  referFriend(text: "${state.productDataEntity[8].title}", state: state),
                  sizedbox(),
                  superSavers(text: "${state.productDataEntity[9].title}", state: state),
                  sizedbox(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.sp),
                    child: textItems(text: "${state.productDataEntity[10].title}", color: black, size: 20),
                  ),
                  sizedbox(),
                   newlyWidget(state: state),
                  SizedBox(height: 14.h),
                  thisThat(text: "${state.productDataEntity[11].title}", hight: 160.h, state: state),
                  sizedbox(),
                  skincareBasics(text: '${state.productDataEntity[12].title}', state: state),
                  sizedbox(),
                  sugarWidgets(
                      text: "${state.productDataEntity[13].title}",
                      TopL: 15.r,
                      TopR: 15.r,
                      bottomL: 15.r,
                      bottomR: 15.r,
                      state: state),
                  sizedbox(),
                  merchStation(text: '${state.productDataEntity[14].title}', state: state),
                  sizedbox(),
                  exploreWidget(
                    text: "${state.productDataEntity[15].title}",
                    hight: 180.h,
                    state: state,
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  SizedBox sizedbox({double? height}) => SizedBox(height: height ?? 10.h);
}
