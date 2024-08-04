import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_tec_task/features/auth/presentation/cubit/auth_cubit.dart';
import 'core/utils/app_theme.dart';
import 'core/utils/bloc_observer.dart';
import 'core/utils/injector.dart';
import 'features/auth/presentation/view/sign_in_view.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();
  await setupInjector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final designSize = const Size(300, 800);
  @override
  Widget build(BuildContext context)
  {
    return ScreenUtilInit(
      designSize: designSize,
      fontSizeResolver: (fontSize, instance) {
        final display = View.of(context).display;
        final screenSize = display.size / display.devicePixelRatio;
        final scaleWidth = screenSize.width / designSize.width;
        return fontSize * scaleWidth;
      },
      minTextAdapt: true,
      splitScreenMode: true,
      builder:(context, child) {
        return BlocProvider(
          create: (context) => getIt<AuthCubit>(),
          child: MaterialApp(
            home:const SignInView(),
            debugShowCheckedModeBanner: false,
            theme: appTheme(),
          ),
        );
      },
    );
  }
}


