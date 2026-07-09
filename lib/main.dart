import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';
import 'core/app_entry_point.dart';
import 'core/init_app.dart';
import 'core/provider_notifier.dart';
import 'core/utils/constants/themes/app_theme.dart';


void main() async {
  await initApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      useInheritedMediaQuery: true,
      child: MultiProvider(
        providers: ProvidersNotifier.providersNotifier,
        child: ToastificationWrapper(
          child: MaterialApp(
            navigatorObservers: [routeObserver],
            debugShowCheckedModeBanner: false,
            locale: const Locale("ar"),
            home: const AppEntryPoint(),
            theme: AppTheme.instance.lightAppTheme(),
          ),
        ),
      ),
    );
  }
}
