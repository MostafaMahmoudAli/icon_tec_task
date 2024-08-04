import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class HomeGridViewWidget extends StatelessWidget {
  const HomeGridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 6.0.w),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: MediaQuery.sizeOf(context).aspectRatio / 0.59,
        ),
        itemBuilder: (context, index) => SizedBox(
          height: 260.0.h,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 210.0.h,
                width: 140.0.w,
                padding:
                EdgeInsetsDirectional.symmetric(horizontal: 7.0.w),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(13.0.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.greyColor,
                      spreadRadius: 0,
                      blurRadius: 7,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "تشيز ستيك",
                      textDirection: TextDirection.rtl,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 7.0.h,
                    ),
                    Text(
                      "لحم ممزوج بأنواع بالجبن الجديد ",
                      textDirection: TextDirection.rtl,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    SizedBox(
                      height: 30.0.h,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.favorite_border_outlined),
                        ),
                        Spacer(),
                        Text("80 جنيه"),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                left: 7.0.w,
                bottom: 130.0.h,
                child: Image(
                  image: const AssetImage(
                    "assets/images/136530236_8766d8ec-f61c-4504-9190-cd18e791b903.jpg-removebg-preview.png",
                  ),
                  fit: BoxFit.contain,
                  width: 130.0.w,
                ),
              ),
            ],
          ),
        ),
        itemCount: 6,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
      ),
    );
  }
}
