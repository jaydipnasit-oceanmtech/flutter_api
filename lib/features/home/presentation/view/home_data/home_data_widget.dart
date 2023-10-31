import 'package:flutter/material.dart';
import 'package:flutter_application_api/di/get_it.dart';
import 'package:flutter_application_api/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_application_api/features/home/presentation/view/home_data/home_data_screen.dart';

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
  void deactivate() {
    homeCubit.close();
    super.deactivate();
  }

  Widget commonTile({required HomeLoadedState state, required int index}) {
    var productDetails = state.productDataEntity;
    return ListTile(
      onTap: () {},
      leading: CircleAvatar(
        backgroundImage: NetworkImage(productDetails[index].userProfile),
      ),
      title: Text(productDetails[index].categoryName),
      subtitle: Text(
        productDetails[index].subCategoryName,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text('${productDetails[index].minPrice} ${productDetails[index].currency}'),
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
