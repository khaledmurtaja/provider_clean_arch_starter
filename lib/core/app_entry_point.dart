import 'package:flutter/material.dart';

import '../features/auth/domain/entites/user_entity.dart';
import '../features/auth/presentation/providers/user_refresh_token_provider.dart';
import 'init_app.dart';
import 'utils/widgets/loading_widget.dart';


class AppEntryPoint extends StatelessWidget {
  const AppEntryPoint({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserEntity?>(
      future: getItInstance<UserRefreshTokenProvider>().getUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(body: Center(child: LoadingAnimationWidget()));
        } else if (snapshot.hasData && snapshot.data != null) {
          return  Container(child: Text("Home screen should be here"),);
        } else {
          return  Container(child: Text("Login screen should be here"),);
        }
      },
    );
  }
}
