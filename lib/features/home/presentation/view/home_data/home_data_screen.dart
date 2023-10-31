import 'package:flutter/material.dart';
import 'package:flutter_application_api/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_application_api/features/home/presentation/view/home_data/home_data_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeDataScrene extends StatefulWidget {
  const HomeDataScrene({super.key});

  @override
  State<HomeDataScrene> createState() => _HomeDataScreneState();
}

class _HomeDataScreneState extends HomeDataWigets {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 10.h,
          ),
          BlocBuilder<HomeCubit, HomeState>(
            bloc: homeCubit,
            builder: (context, state) {
              if (state is HomeLordingState && state is HomeInitialState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is HomeLoadedState) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.productDataEntity.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return commonTile(state: state, index: index);
                    },
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          )
        ],
      ),
    );
  }
}
