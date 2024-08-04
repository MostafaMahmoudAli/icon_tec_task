import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../widgets/home_grid_view_widget.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final List<String> tabs = [
    'assets/images/20338890_Cute_girl_bakery_logo_homemade_bakery_shop_hand_drawn_cartoon_art_illustration-removebg-preview.png',
    'assets/images/24246035_bakery_logo.png',
    'assets/images/29945504_wng_26_07_2022_9-removebg-preview.png',
    'assets/images/Cream_and_Black_Simple_Elegant_Catering_Food_Logo-removebg-preview.png',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: AppColors.lightGreyColor,
        appBar: AppBar(
          backgroundColor: AppColors.whiteColor,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColors.darkGreyColor,
            statusBarIconBrightness: Brightness.light,
          ),
          actions: [
            Text(
              AppStrings.signInTitle,
              textDirection: TextDirection.rtl,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(color: AppColors.primaryColor),
            ),
            IconButton(
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
                color: AppColors.primaryColor,
                size: 26.sp,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TabBar(
                padding: EdgeInsetsDirectional.symmetric(
                  vertical: 15.0.h,
                  horizontal: 15.0.w,
                ),
                isScrollable: true,
                tabs: tabs
                    .map(
                      (tab) => Tab(
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                          ),
                          child: Image(
                            image: AssetImage(
                              tab,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                unselectedLabelColor: AppColors.primaryColor,
                physics: const BouncingScrollPhysics(),
                indicatorColor:Colors.transparent,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                child: TabBarView(
                  children: tabs.map((tab) => HomeGridViewWidget()).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
