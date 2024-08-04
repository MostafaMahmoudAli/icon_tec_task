import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icon_tec_task/core/utils/app_strings.dart';
import 'package:icon_tec_task/features/auth/presentation/view/widget/sigh_in_down_section_widget.dart';
import 'package:icon_tec_task/features/auth/presentation/view/widget/sign_in_up_section_widget.dart';
import '../../../../core/utils/app_colors.dart';



class SignInView extends StatelessWidget {
  const SignInView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColors.secondaryColor,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      body: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          actions: [
            Text(
              AppStrings.signInTitle,
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            IconButton(
              icon: Icon(
                Icons.arrow_forward_outlined,
                color: AppColors.whiteColor,
                size: 26.sp,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                decoration: BoxDecoration(
                  color: AppColors.offWhiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60.0.r),
                    topRight: Radius.circular(60.0.r),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    textDirection: TextDirection.rtl,
                    children: [
                      const SignInUpSectionWidget(),
                      SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.01),
                      const SignInDownSectionWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


