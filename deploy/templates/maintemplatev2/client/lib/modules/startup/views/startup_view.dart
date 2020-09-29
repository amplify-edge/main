

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:maintemplate/modules/startup/view_model/startup_view_model.dart';
import 'package:provider_architecture/provider_architecture.dart';

import '../../../core/core.dart';

class StartupView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider.withConsumer(
      viewModel: StartUpViewModel(),
    //  onModelReady: (model) => model.handleStartUpLogic(),
      builder: (context, model, child) =>
           Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
               const SizedBox(height: 16.0),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/icon/placeholder.png',
                width: 200,
                height: 100,
              ),
            ),
            const SizedBox(height: 16.0),
              RaisedButton(
                onPressed: (){},
                child: Text("Sign In")),
              SizedBox(height:16),
              InkWell(
                onTap: (){
                  Modular.to.pushNamed(Paths.modMain);
                },
                child: Text("Get Started", style : TextStyle(color: Colors.blue,))
              )

            ],
          ),
        ),
      ),
    );
  
  }
}