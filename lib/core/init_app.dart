import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../features/auth/injection_helper.dart';

import 'network/local/shared_preferences_manager.dart';

final getItInstance = GetIt.instance;

final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPreferencesManager.init();


  await initAuthFeature();


}
