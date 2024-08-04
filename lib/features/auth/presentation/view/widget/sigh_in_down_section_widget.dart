import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/custom_action_button.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../home/presentation/view/home_view.dart';
import '../../cubit/auth_cubit.dart';

class SignInDownSectionWidget extends StatelessWidget {
  const SignInDownSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
       state.whenOrNull(
         error:(message) =>  ScaffoldMessenger(
           child: SnackBar(
             content: Text("Wrong account"),
             backgroundColor:AppColors.red,
           ),
         ),
       );
      },
      builder: (context, state) => state.maybeWhen(
        orElse: () => Form(
          key: BlocProvider.of<AuthCubit>(context).loginFormKey,
          child: Column(
            children: [
              Text(
                AppStrings.forgetPassword,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.015,
              ),
              CustomActionButton(
                text: AppStrings.signInTitle,
                borderRadius: BorderRadius.circular(15.0.r),
                backGroundColor: AppColors.primaryColor,
                onTap: () async {
                  context.read<AuthCubit>().login();
                  if (context.read<AuthCubit>().success == true) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeView(),
                      ),
                    );
                  }
                },
                width: MediaQuery.sizeOf(context).width * 0.5,
                height: MediaQuery.sizeOf(context).height * 0.05,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.newAccount,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    AppStrings.doNotHaveAnAccount,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
