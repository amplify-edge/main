import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mod_main/core/core.dart';
import 'package:mod_main/modules/splash/view_model/splash_view_model.dart';
import 'package:provider_architecture/provider_architecture.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider.withConsumer(
      onModelReady: (model) => model.handleStartUpLogic(),
      viewModel: SplashViewModel(),
      builder: (context, SplashViewModel model, child) => Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RaisedButton(
                child: Text("Dashboard"),
                onPressed: (){
                  model.navigateToOrgManagement();
              }),
               RaisedButton(
                child: Text("Main"),
                onPressed: (){
                 model.navigateToMain();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
