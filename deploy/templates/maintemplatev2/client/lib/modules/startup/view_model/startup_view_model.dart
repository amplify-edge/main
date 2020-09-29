import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:maintemplate/core/core.dart';

class StartUpViewModel extends ChangeNotifier{
  bool _isLoggedIn = true;

  void handleStartUpLogic() {
    if (_isLoggedIn == true) {
      Future.delayed(Duration(seconds: 3), () {
        Modular.to.pushNamed(Paths.modMain);
      });
    } else {
      Modular.to.pushNamed(Paths.login);
    }
  }

  
}
