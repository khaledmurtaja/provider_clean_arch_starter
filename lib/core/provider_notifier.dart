import 'package:provider/provider.dart';
import 'package:nested/nested.dart';
import '../features/auth/presentation/providers/user_refresh_token_provider.dart';
import 'init_app.dart';

class ProvidersNotifier {
  ProvidersNotifier._();

  static List<SingleChildWidget> providersNotifier = [
    ChangeNotifierProvider(
      create: (context) => getItInstance<UserRefreshTokenProvider>(),
    ),
  ];
}
