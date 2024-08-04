import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_tec_task/core/utils/injector.dart';
import 'package:icon_tec_task/features/auth/presentation/cubit/auth_cubit.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/custom_text_field.dart';
import '../../../../../core/utils/regex.dart';

class SignInUpSectionWidget extends StatelessWidget {
  const SignInUpSectionWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit,AuthState>(
      builder:(context, state)
      {
        return state.maybeWhen(
          orElse: ()=> Column(
            children: [
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.13),
              Text(
                AppStrings.signInSubTitle,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.13),
              CustomTextField(
                validator:(value) => AppValidator.validateNumber(value),
                label: AppStrings.nameFormFieldLabel,
                controller: BlocProvider.of<AuthCubit>(context).numberEditingController,
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.greyColor,
                    style: BorderStyle.solid,
                    width: MediaQuery.sizeOf(context).width * 0.007,
                  ),
                ),
              ),
              CustomTextField(
                validator:(value) => AppValidator.validatePassword(value),
                label: AppStrings.passwordFormFieldLabel,
                controller:BlocProvider.of<AuthCubit>(context).passwordEditingController,
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.greyColor,
                    style: BorderStyle.solid,
                    width: MediaQuery.sizeOf(context).width * 0.007,
                  ),
                ),
                isObscureText: true,
              ),
            ],
          ),
        );
      }
    );
  }
}
