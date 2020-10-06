import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:maintemplatev2/core/core.dart';

class StartUpViewModel extends ChangeNotifier {
  bool _isLoggedIn = true;

  void handleStartUpLogic() {
    if (_isLoggedIn == true) {
      Future.delayed(Duration(seconds: 3), () {
        Modular.to.pushNamed(Paths.modDisco);
      });
    } else {
      Modular.to.pushNamed(Paths.login);
    }
  }
}
