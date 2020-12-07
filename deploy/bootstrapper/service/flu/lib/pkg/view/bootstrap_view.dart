import 'package:bootstrapper/pkg/view/view_model/bootstrap_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

class BootstrapView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider.withConsumer(
      viewModelBuilder: () => BootstrapViewModel(),
      onModelReady: (BootstrapViewModel model) async {
        await model.fetchBootstraps();
      },
      builder: (context, BootstrapViewModel model, child) => Scaffold(
        body: NewG
      )
    );
  }
}
