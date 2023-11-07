import 'package:flutter/material.dart';
import 'package:flutter_application_api/%20common/constans/colors.dart';
import 'package:flutter_application_api/di/get_it.dart';
import 'package:flutter_application_api/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_application_api/features/home/presentation/view/home_data/home_data_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// TextEditingController email = TextEditingController();
// TextEditingController password = TextEditingController();
// final goloblemail = GlobalKey<FormState>();
// String errorText = "";

abstract class HomeDataWigets extends State<HomeDataScrene> {
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

  Widget appIcon({required IconData icons}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        icons,
        size: 22.h,
        color: white,
      ),
    );
  }

  ///TextFiled
  Widget textFiledSugar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(color: Colors.black),
          ),
          hintText: "Foundati",
          contentPadding: const EdgeInsets.all(1),
          hintStyle: GoogleFonts.inter(
            color: black,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  ///catagoriList
  Widget sugarList({required HomeLoadedState state}) {
    print("dcfdcdccddcdcdc");
    return SizedBox(
      height: 110.h,
      child: ListView.builder(
        itemCount: state.productDataEntity[0].contentData!.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final collectionData = state.productDataEntity[0].contentData![index];
          return Column(
            children: [
              Container(
                height: 70.h,
                width: 70.w,
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(image: NetworkImage(collectionData.mediaUrl.toString()), fit: BoxFit.cover)),
              ),
              Text(
                collectionData.mediaText.toString(),
                style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w600),
              )
            ],
          );
        },
      ),
    );
  }

  //sliderpage
  Widget sliderItems({
    required HomeLoadedState state,
  }) {
    return SizedBox(
        height: 240.h,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            PageView(
              onPageChanged: (value) {
                homeCubit.updatePageIndex(value);
              },
              children: List.generate(state.productDataEntity[1].contentData!.length, (index) {
                var sliderData = state.productDataEntity[1].contentData![index];
                return Container(
                  height: 240.h,
                  width: 340.w,
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(image: NetworkImage(sliderData.mediaUrl.toString()), fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                );
              }),
            ),
            Positioned(
              bottom: 20.h,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    state.productDataEntity[1].contentData!.length,
                    (index) => Padding(
                          padding: const EdgeInsets.all(2),
                          child: InkWell(
                            onTap: () {},
                            child: CircleAvatar(radius: 5, backgroundColor: state.index == index ? white : grey),
                          ),
                        )),
              ),
            )
          ],
        ));
  }

//   ///Bestsellers
  Widget bestsellers({required String text, required HomeLoadedState state}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textItems(text: text, color: black, size: 20),
        SizedBox(height: 2.h),
        Container(
            height: 320.h,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: NetworkImage(
                      state.productDataEntity[2].backgroundImg.toString(),
                    ),
                    fit: BoxFit.cover)),
            child: ListView.builder(
              itemCount: state.productDataEntity[2].contentData!.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                var bestsellers = state.productDataEntity[2].contentData![index];
                ;
                var pricedata = bestsellers.productJson!.variants![0];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 25.h),
                  child: Container(
                    height: 210.h,
                    width: 145.w,
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
                    child: Column(children: [
                      Container(
                        height: 130.h,
                        width: 145.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(10.r), bottom: Radius.circular(5.r)),
                            image: DecorationImage(
                              image: NetworkImage(
                                bestsellers.productJson!.image!.src.toString(),
                              ),
                            )),
                      ),
                      SizedBox(height: 2.h),
                      Text(bestsellers.productJson!.title.toString(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(color: black, fontWeight: FontWeight.w500, fontSize: 12.sp)),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          commonText(
                              text: pricedata.compareAtPrice != null
                                  ? "₹${pricedata.compareAtPrice.toString().split(".")[0]}"
                                  : "993",
                              color: grey),
                          SizedBox(width: 5.w),
                          commonText(text: "₹${pricedata.price.toString().split(".")[0]}", color: black),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      bestseButton(
                        tax: textItems(text: "Buy Now", color: white, size: 15),
                        onpress: () {
                          // Navigator.push(
                          //   context,
                          //   pageNaviagation(
                          //       screen: ProductDetial(
                          //     productid: bestsellers.productJson!.image!.src.toString(),
                          //     tital: bestsellers.productJson!.title.toString(),
                          //     price: pricedata.price.toString().split(".")[0],
                          //     discount: pricedata.compareAtPrice.toString(),
                          //     status: bestsellers.productJson!.status.toString(),
                          //     idno: bestsellers.productJson!.id,
                          //     titalproduct: data.resbody!.sections![2].title,
                          //   )),
                          // );
                        },
                      ),
                    ]),
                  ),
                );
              },
            )),
      ],
    );
  }

  ///HOT DEALS Widgets
  Widget hotDeals({required String text, required HomeLoadedState state}) {
    var dataCount = state.productDataEntity[3].contentData!.length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textItems(text: text, color: black, size: 20),
        SizedBox(height: 15.h),
        SizedBox(
          height: 220.h,
          child: ListView.builder(
            itemCount: dataCount,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final hotDeals = state.productDataEntity[3].contentData![index];
              return Container(
                height: 200.h,
                width: 340.w,
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(image: NetworkImage(hotDeals.mediaUrl.toString()), fit: BoxFit.fill),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.r),
                    bottomRight: Radius.circular(15.r),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  ///TopPick Widgets
  Widget topPicks({
    required String text,
    required double bottomL,
    required double bottomR,
    // ignore: non_constant_identifier_names
    required double TopR,
    // ignore: non_constant_identifier_names
    required double TopL,
    required HomeLoadedState state,
  }) {
    var dataCount = state.productDataEntity[6].contentData!.length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textItems(text: text, color: black, size: 20),
        SizedBox(height: 15.h),
        SizedBox(
          height: 220.h,
          child: ListView.builder(
            itemCount: dataCount,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final hotDeals = state.productDataEntity[6].contentData![index];
              return Container(
                height: 200.h,
                width: 340.w,
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(image: NetworkImage(hotDeals.mediaUrl.toString()), fit: BoxFit.fill),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(bottomL),
                    bottomRight: Radius.circular(bottomR),
                    topLeft: Radius.circular(TopL),
                    topRight: Radius.circular(TopR),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

//SUGAR BEAUTY BLOG Widgets
  Widget sugarWidgets({
    required String text,
    required double bottomL,
    required double bottomR,
    // ignore: non_constant_identifier_names
    required double TopR,
    // ignore: non_constant_identifier_names
    required double TopL,
    required HomeLoadedState state,
  }) {
    var dataCount = state.productDataEntity[13].contentData!.length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textItems(text: text, color: black, size: 20),
        SizedBox(height: 15.h),
        SizedBox(
          height: 220.h,
          child: ListView.builder(
            itemCount: dataCount,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final hotDeals = state.productDataEntity[13].contentData![index];
              return Container(
                height: 200.h,
                width: 340.w,
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(image: NetworkImage(hotDeals.mediaUrl.toString()), fit: BoxFit.fill),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(bottomL),
                    bottomRight: Radius.circular(bottomR),
                    topLeft: Radius.circular(TopL),
                    topRight: Radius.circular(TopR),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

//   ///JUSTIN && TRY BEFORE Widgets
  Widget justIn({required String text, required HomeLoadedState state}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textItems(text: text, color: black, size: 20),
        SizedBox(height: 7.h),
        SizedBox(
          height: 280.h,
          child: ListView.builder(
            itemCount: state.productDataEntity[4].contentData!.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              var bestsellers = state.productDataEntity[4].contentData![index];
              var pricedata = bestsellers.productJson!.variants![0];
              return Container(
                height: 260.h,
                width: 140.w,
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(blurRadius: 1.r, spreadRadius: 0, offset: (const Offset(0, 0)), color: grey)],
                    borderRadius: BorderRadius.circular(10.r)),
                child: Column(children: [
                  Container(
                    height: 130.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(10.r), bottom: Radius.circular(5.r)),
                        image: DecorationImage(
                            image: NetworkImage(
                              bestsellers.productJson!.image!.src.toString(),
                            ),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(height: 2.h),
                  commonText(text: bestsellers.productJson!.title.toString(), color: black, align: TextAlign.center),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      commonText(
                          text: pricedata.compareAtPrice != null
                              ? "₹${pricedata.compareAtPrice.toString().split(".")[0]}"
                              : "₹999",
                          color: grey),
                      SizedBox(width: 10.w),
                      commonText(text: "₹${pricedata.price.toString().split(".")[0]}", color: black)
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  bestseButton(
                    tax: textItems(text: "Buy Now", color: white, size: 15),
                    onpress: () {
                      // Navigator.push(
                      //     context,
                      //     pageNaviagation(
                      //       screen: ProductDetial(
                      //         productid: bestsellers.productJson!.image!.src.toString(),
                      //         tital: bestsellers.productJson!.title.toString(),
                      //         price: pricedata.price.toString().split(".")[0],
                      //         discount: pricedata.compareAtPrice.toString(),
                      //         status: bestsellers.productJson!.status.toString(),
                      //         idno: bestsellers.productJson!.id,
                      //         titalproduct: data.resbody!.sections![4].title,
                      //       ),
                      //     ));
                    },
                  ),
                ]),
              );
            },
          ),
        ),
      ],
    );
  }

  ///GiftingWidgetWidgets
  Widget giftingWidget({required String text, required HomeLoadedState state}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textItems(text: text, color: black, size: 20),
        SizedBox(height: 7.h),
        SizedBox(
          height: 280.h,
          child: ListView.builder(
            itemCount: state.productDataEntity[7].contentData!.length,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              var bestsellers = state.productDataEntity[7].contentData![index];
              var pricedata = bestsellers.productJson!.variants![0];
              return Container(
                height: 260.h,
                width: 140.w,
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(blurRadius: 1.r, spreadRadius: 1, offset: (const Offset(0, 0)), color: grey),
                    ],
                    borderRadius: BorderRadius.circular(10.r)),
                child: Column(
                  children: [
                    Container(
                      height: 130.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(top: Radius.circular(10.r), bottom: Radius.circular(5.r)),
                          image: DecorationImage(
                            image: NetworkImage(
                              bestsellers.productJson!.image!.src.toString(),
                            ),
                            fit: BoxFit.fill,
                          )),
                    ),
                    SizedBox(height: 2.h),
                    Text(bestsellers.productJson!.title.toString(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(color: black, fontWeight: FontWeight.w500, fontSize: 12.sp)),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        commonText(text: "₹${pricedata.compareAtPrice.toString().split(".")[0]}", color: grey),
                        SizedBox(width: 10.w),
                        commonText(text: "₹${pricedata.price.toString().split(".")[0]}", color: black),
                      ],
                    ),
                    const Spacer(),
                    bestseButton(
                      onpress: () {
                        // Navigator.push(
                        //     context,
                        //     pageNaviagation(
                        //       screen: ProductDetial(
                        //         productid: bestsellers.productJson!.image!.src.toString(),
                        //         tital: bestsellers.productJson!.title.toString(),
                        //         price: pricedata.price.toString().split(".")[0],
                        //         discount: pricedata.compareAtPrice.toString(),
                        //         status: bestsellers.productJson!.status.toString(),
                        //         idno: bestsellers.productJson!.id,
                        //         titalproduct: data.resbody!.sections![7].title,
                        //       ),
                        //     ));
                      },
                      tax: textItems(text: "Buy Now", color: white, size: 15),
                    ),
                    SizedBox(height: 8.h),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  ///SuperSavers Widgets
  Widget superSavers({required String text, required HomeLoadedState state}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textItems(text: text, color: black, size: 20),
        SizedBox(height: 2.h),
        Container(
            height: 320.h,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: NetworkImage(
                      state.productDataEntity[9].backgroundImg.toString(),
                    ),
                    fit: BoxFit.fill)),
            child: ListView.builder(
              itemCount: state.productDataEntity[9].contentData!.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                var bestsellers = state.productDataEntity[9].contentData![index];
                var pricedata = bestsellers.productJson!.variants![0];
                return Padding(
                  padding: EdgeInsets.only(top: 18.h, bottom: 25.h),
                  child: Container(
                    height: 210.h,
                    width: 145.w,
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
                    child: Column(children: [
                      Container(
                        height: 130.h,
                        width: 145.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(10.r), bottom: Radius.circular(5.r)),
                            image: DecorationImage(
                                image: NetworkImage(
                                  bestsellers.productJson!.image!.src.toString(),
                                ),
                                fit: BoxFit.fill)),
                      ),
                      SizedBox(height: 2.h),
                      commonText(
                          text: bestsellers.productJson!.title.toString(),
                          color: black,
                          line: 2,
                          align: TextAlign.center),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          commonText(text: "₹${pricedata.compareAtPrice.toString().split(".")[0]}", color: grey),
                          SizedBox(width: 10.w),
                          commonText(text: "₹${pricedata.price.toString().split(".")[0]}", color: black),
                        ],
                      ),
                      const Spacer(),
                      bestseButton(
                        tax: textItems(text: "Buy Now", color: white, size: 15),
                        onpress: () {
                          // Navigator.push(
                          //     context,
                          //     pageNaviagation(
                          //       screen: ProductDetial(
                          //         productid: bestsellers.productJson!.image!.src.toString(),
                          //         tital: bestsellers.productJson!.title.toString(),
                          //         price: pricedata.price.toString().split(".")[0],
                          //         discount: pricedata.compareAtPrice.toString(),
                          //         status: bestsellers.productJson!.status.toString(),
                          //         idno: bestsellers.productJson!.id,
                          //         titalproduct: data.resbody!.sections![9].title,
                          //       ),
                          //     ));
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ]),
                  ),
                );
              },
            )),
      ],
    );
  }

  ///NewlyWidget
  Widget newlyWidget({required HomeLoadedState state}) {
    return SizedBox(
      height: 250.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          PageView(
            onPageChanged: (value1) {},
            children: List.generate(state.productDataEntity[10].contentData!.length, (index) {
              var sliderData = state.productDataEntity[10].contentData![index];
              return Container(
                height: 250.h,
                width: 340.w,
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(image: NetworkImage(sliderData.mediaUrl.toString()), fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(15.r),
                ),
              );
            }),
          ),
          Positioned(
            bottom: 20.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  state.productDataEntity[10].contentData!.length,
                  (index) => Padding(
                        padding: const EdgeInsets.all(2),
                        child: CircleAvatar(
                          radius: 5,
                          //backgroundColor: pagviewCubit1.state != index ? grey : white,
                        ),
                      )),
            ),
          )
        ],
      ),
    );
  }

  ///referFriend
  Widget referFriend({required String text, required HomeLoadedState state}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textItems(text: text, color: black, size: 20),
        Container(
          height: 170.h,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(blurRadius: 1.r, spreadRadius: 0, offset: (const Offset(0, 0)), color: grey)],
              image: DecorationImage(
                  image: NetworkImage(state.productDataEntity[8].contentData![0].mediaUrl.toString()),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(10.r)),
        ),
      ],
    );
  }

//////THIS OR THAT
  Widget thisThat({
    required double hight,
    required String text,
    required HomeLoadedState state,
  }) {
    var count = List.generate(state.productDataEntity[11].contentData!.length, (index) {
      var thatdata = state.productDataEntity[11].contentData![index].mediaUrl.toString();
      return Container(
        height: hight,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        decoration: BoxDecoration(
            color: Colors.grey,
            image: DecorationImage(image: NetworkImage(thatdata), fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(10.r)),
      );
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textItems(text: text, color: black, size: 20),
        SizedBox(
          height: 20.h,
        ),
        Column(
          children: count,
        )
      ],
    );
  }

  ///ExploreWidget
  Widget exploreWidget({
    required double hight,
    required String text,
    required HomeLoadedState state,
  }) {
    var count = state.productDataEntity[15].contentData!.length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textItems(text: text, color: black, size: 20),
        SizedBox(height: 5.h),
        Column(
          children: List.generate(count, (index) {
            var exploreData = NetworkImage(state.productDataEntity[15].contentData![index].mediaUrl.toString());
            return Container(
              height: hight,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(image: exploreData, fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(10.r)),
            );
          }),
        )
      ],
    );
  }

  ///SkINCARE BASICCS
  Widget skincareBasics({required String text, required HomeLoadedState state}) {
    var count = state.productDataEntity[12].contentData!.length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textItems(text: text, color: black, size: 20),
        SizedBox(
          height: 7.h,
        ),
        SizedBox(
          height: 250.h,
          width: double.infinity,
          child: ListView.builder(
            itemCount: count,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              var bestsellers = state.productDataEntity[12].contentData![index];
              var pricedata = bestsellers.productJson!.variants![0];
              return Container(
                height: 100.h,
                width: 140.w,
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.r)),
                ),
                child: Column(children: [
                  Container(
                    height: 100.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(10.r), bottom: Radius.circular(5.r)),
                        image: DecorationImage(
                            image: NetworkImage(
                              bestsellers.productJson!.image!.src.toString(),
                            ),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(bestsellers.productJson!.title.toString(),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: GoogleFonts.poppins(color: black, fontWeight: FontWeight.w500, fontSize: 13.sp)),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      commonText(
                          text: pricedata.compareAtPrice != null
                              ? "₹${pricedata.compareAtPrice.toString().split(".")[0]}"
                              : "890",
                          color: grey),
                      SizedBox(width: 10.w),
                      commonText(text: "₹${pricedata.price.toString().split(".")[0]}", color: black)
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  bestseButton(
                    tax: textItems(text: "Buy Now", color: white, size: 15),
                    onpress: () {
                      // Navigator.push(
                      //   context,
                      //   pageNaviagation(
                      //     screen: ProductDetial(
                      //       productid: bestsellers.productJson!.image!.src.toString(),
                      //       tital: bestsellers.productJson!.title.toString(),
                      //       price: pricedata.price.toString().split(".")[0],
                      //       discount: pricedata.compareAtPrice.toString(),
                      //       status: bestsellers.productJson!.status.toString(),
                      //       idno: bestsellers.productJson!.id,
                      //       titalproduct: data.resbody!.sections![12].title,
                      //     ),
                      //   ),
                      // );
                    },
                  ),
                ]),
              );
            },
          ),
        ),
      ],
    );
  }

  ///Merch Station
  Widget merchStation({required String text, required HomeLoadedState state}) {
    var count = state.productDataEntity[14].contentData!.length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textItems(text: text, color: black, size: 20),
        SizedBox(height: 7.h),
        SizedBox(
          height: 250.h,
          width: double.infinity,
          child: ListView.builder(
            itemCount: count,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              var bestsellers = state.productDataEntity[14].contentData![index];
              var pricedata = bestsellers.productJson!.variants![0];
              return Container(
                height: 100.h,
                width: 140.w,
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.r)),
                ),
                child: Column(children: [
                  Container(
                    height: 100.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(10.r), bottom: Radius.circular(5.r)),
                        image: DecorationImage(
                            image: NetworkImage(
                              bestsellers.productJson!.image!.src.toString(),
                            ),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  commonText(
                      text: bestsellers.productJson!.title.toString(), align: TextAlign.center, line: 2, color: black),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      commonText(
                          text: pricedata.compareAtPrice != null
                              ? "₹${pricedata.compareAtPrice.toString().split(".")[0]}"
                              : "₹899",
                          color: grey),
                      SizedBox(width: 10.w),
                      commonText(
                        text: "₹${pricedata.price.toString().split(".")[0]}",
                        color: black,
                      )
                    ],
                  ),
                  SizedBox(height: 18.h),
                  bestseButton(
                    onpress: () {
                      // Navigator.push(
                      //     context,
                      //     pageNaviagation(
                      //       screen: ProductDetial(
                      //         productid: bestsellers.productJson!.image!.src.toString(),
                      //         tital: bestsellers.productJson!.title.toString(),
                      //         price: pricedata.price.toString().split(".")[0],
                      //         discount: pricedata.compareAtPrice.toString(),
                      //         status: bestsellers.productJson!.status.toString(),
                      //         idno: bestsellers.productJson!.id,
                      //         titalproduct: data.resbody!.sections![14].title,
                      //       ),
                      //     ));
                    },
                    tax: textItems(text: "Buy Now", color: white, size: 15),
                  ),
                ]),
              );
            },
          ),
        ),
      ],
    );
  }

  ///CommonTextItems
  Widget textItems({required Color color, required int size, required String text}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Text(
        text,
        style: GoogleFonts.poppins(color: color, fontSize: size.sp, fontWeight: FontWeight.w700),
      ),
    );
  }

  ///CommonText
  Widget commonText({required String text, required Color color, TextAlign? align, int? line}) {
    return Text(text,
        textAlign: align,
        maxLines: line,
        style: GoogleFonts.poppins(
          color: color,
          fontWeight: FontWeight.w600,
          fontSize: 12.sp,
        ));
  }

  Widget bestseButton({required Widget tax, required VoidCallback onpress}) {
    return MaterialButton(
      onPressed: onpress,
      height: 33.h,
      minWidth: 125.w,
      color: black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)),
      child: tax,
    );
  }

  ///Navigations Animastions
  Route pageNaviagation({required Widget screen}) {
    return PageRouteBuilder(
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          alignment: Alignment.center,
          scale: Tween<double>(begin: 2, end: 1).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.slowMiddle,
            ),
          ),
          child: child,
        );
      },
      transitionDuration: const Duration(seconds: 1),
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return screen;
      },
    );
  }
}





















  // Widget listTileCommon() {
  //   return Expanded(
  //     child: ListView.builder(
  //       itemCount: 10,
  //       physics: const BouncingScrollPhysics(),
  //       itemBuilder: (context, index) {
  //         return Card(
  //           elevation: 20,
  //           color: Colors.green.withOpacity(0.5),
  //           child: const ListTile(
  //             leading: Icon(
  //               Icons.person,
  //               color: Colors.black,
  //             ),
  //             textColor: Colors.white,
  //             subtitle: Text("abc"),
  //             title: Text("abc"),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  // Widget textFiledCommon({required String hint, required TextEditingController controller, required Color color}) {
  //   return Form(
  //     key: goloblemail,
  //     child: TextFormField(
  //       validator: (value) {
  //         bool emailValid =
  //             RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);

  //         if (emailValid) {
  //           return null;
  //         } else {
  //           return "Email Not -------";
  //         }
  //       },
  //       controller: controller,
  //       decoration: InputDecoration(
  //         hintText: hint,
  //         fillColor: Colors.white,
  //         filled: true,
  //         hintStyle: TextStyle(color: color),
  //         counterText: "",
  //         border: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(10),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget carouselSildercontainer() {
  //   return CarouselSlider(
  //       items: List.generate(
  //           3,
  //           (index) => Container(
  //                 height: 200,
  //                 width: 300,
  //                 color: Colors.amber,
  //               )),
  //       options: CarouselOptions(
  //         height: 400,
  //         aspectRatio: 16 / 9,
  //         viewportFraction: 0.8,
  //         initialPage: 0,
  //         enableInfiniteScroll: true,
  //         reverse: false,
  //         autoPlay: true,
  //         autoPlayInterval: Duration(seconds: 3),
  //         autoPlayAnimationDuration: Duration(milliseconds: 800),
  //         autoPlayCurve: Curves.fastOutSlowIn,
  //         enlargeCenterPage: true,
  //         enlargeFactor: 0.3,
  //         onPageChanged: (index, reason) {},
  //         scrollDirection: Axis.horizontal,
  //       ));
  // }

//homeScreen package
// cupertino_icons: ^1.0.2 ###########
// carousel_slider: ^4.1.1 ###########
// image_picker: ^1.0.4   ###########
// intl: ^0.18.0      ###########
// marquee: ^2.2.1     ###########
// simple_gradient_text: ^1.2.2    ###########
// equatable: ^2.0.5     ###########
// http: ^1.0.0           ###########
// dartz: ^0.10.1
// get_it: ^7.6.0
// google_fonts: any    ###########
// flutter_bloc: ^8.1.1  ###########
// flutter_svg: ^2.0.6   ###########
// cached_network_image: ^3.2.2  ###########
// hive: ^2.2.3 
// path_provider: ^2.0.15  ###########
// sqflite: ^2.2.8+4
// permission_handler: ^10.3.0 
// dio: ^5.2.0
// share_plus: ^7.0.2
// url_launcher: ^6.1.11
// device_info_plus: ^9.0.0
// package_info_plus: ^4.0.1
// feedback: ^2.5.0
// flutter_screenutil: ^5.8.4
// firebase_core: ^2.2.0
// firebase_analytics: ^10.0.5
// firebase_crashlytics: ^3.0.5
// firebase_messaging: 14.6.4
// uuid: ^3.0.6
// screenshot: ^2.1.0
// video_player: ^2.7.0
// lottie: ^1.3.0
// lazy_load_scrollview: ^1.3.0
// flutter_math_fork: ^0.7.1
// auto_size_text: ^3.0.0
// flare_flutter: ^3.0.2
// image_cropper: ^5.0.0
// image_editor: ^1.1.0
// extended_image: ^8.1.0
// video_thumbnail: ^0.5.2
// in_app_purchase: ^3.0.7
// flutter_local_notifications: ^15.1.0+1
// dotted_border: ^2.0.0+2
// expansion_tile_card: ^2.0.0
// sms_autofill: ^2.3.0
// google_mobile_ads: ^3.0.0
// just_audio: ^0.9.34
// android_id: ^0.0.7
// media_scanner: ^2.1.0
// ffmpeg_kit_flutter_min_gpl: ^5.1.0
// flutter_inappwebview: ^6.0.0-beta.2
// in_app_update: ^4.1.4
// transparent_image: ^2.0.0
// location: ^5.0.3
// flutter_sim_country_code: ^0.1.2
// google_sign_in: ^5.4.2
// app_tracking_transparency: ^2.0.3
// connectivity_plus: ^4.0.2
// dart_ping: ^8.0.1
// flutter_rating_bar: ^4.0.1
// # Manish Patel
// visibility_detector: ^0.3.3
// geocoding: ^2.1.0
// location_geocoder: ^1.0.5
// geolocator: ^9.0.2
// google_maps_flutter: ^2.3.1
// provider: ^6.0.5
// # render: ^0.1.3+1
// flutter_animator: ^3.2.2
// flutter_image_compress: ^2.0.4
// # Parth Patel
// google_mlkit_commons: ^0.4.0
// google_mlkit_language_id: ^0.7.0
// flutter_html: ^3.0.0-alpha.6
// flutter_isolate: ^2.0.4
// android_alarm_manager_plus: ^3.0.2
// uri_to_file: ^0.2.0
// file_picker: ^5.2.7
// sign_in_with_apple: ^3.0.0
// crypto: ^3.0.1
// firebase_auth: 4.10.0
// palette_generator: ^0.3.3+2
// fraction: ^4.1.4
// photo_view: ^0.14.0
// photo_gallery: 1.2.0
// flutter_gradient_colors: ^2.1.1
// photofilters: ^3.0.1
// dart_ping_ios: ^3.0.0
// isolate_flutter: ^3.0.0
// disk_space: ^0.2.1
// system_info2: ^4.0.0
// flutter_staggered_grid_view: ^0.6.2
// flutter_quill: ^7.4.6
// vsc_quill_delta_to_html: ^1.0.3

// //listTileCommon(),
// textFiledCommon(
//   color: Colors.white,
//   controller: email,
//   hint: "Enter Email",
// ),
// const SizedBox(height: 20),
// //textFiledCommon(
// //     color: Colors.white,
// //     controller: password,
// //     hint: "Enter Passowrd",
// //   ),
// const SizedBox(height: 20),
// ElevatedButton(
//     onPressed: () {
//       if (goloblemail.currentState!.validate()) {
//         FocusScope.of(context).unfocus();
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Susssfull!")));
//       }
//     },
//     child: Text("Submit"))

//carouselSildercontainer(),

// BlocBuilder<HomeCubit, HomeState>(
//   bloc: homeCubit,
//   builder: (context, state) {
//     if (state is HomeLorderState) {
//       return Center(
//         child: Column(
//           children: [
//             CircleAvatar(
//               radius: 100,
//               backgroundImage: FileImage(File(state.image)),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             MaterialButton(
//                 color: Colors.amber,
//                 height: 50,
//                 minWidth: 50,
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//                 onPressed: () {
//                   homeCubit.selectImage();
//                 },
//                 child: const Icon(Icons.camera)),
//           ],
//         ),
//       );
//     } else if (state is HomeLordingState) {
//       return const CircularProgressIndicator();
//     }
//     return const SizedBox();
//   },
// )
// Expanded(
//             child: Marquee(
//               text: 'Some sample ',
//               style: const TextStyle(fontWeight: FontWeight.bold),
//               scrollAxis: Axis.horizontal,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               blankSpace: 20.0,
//               velocity: 100.0,
//               pauseAfterRound: const Duration(seconds: 1),
//               startPadding: 10.0,
//               accelerationDuration: const Duration(seconds: 1),
//               accelerationCurve: Curves.linear,
//               decelerationDuration: const Duration(milliseconds: 100),
//               decelerationCurve: Curves.easeOut,
//             ),
//           ),

// Center(
//           child: Expanded(
//             child: CachedNetworkImage(
//               imageUrl:
//                   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmt5COK8kAoQFSW7exx1-LBfSXR0XFyCkZ-w&usqp=CAU",
//               imageBuilder: (context, imageProvider) => Container(
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: imageProvider,
//                       fit: BoxFit.cover,
//                       colorFilter: const ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
//                 ),
//               ),
//               placeholder: (context, url) => const CircularProgressIndicator(),
//               errorWidget: (context, url, error) => const Icon(Icons.error),
//             ),
//           ),
//         ),
