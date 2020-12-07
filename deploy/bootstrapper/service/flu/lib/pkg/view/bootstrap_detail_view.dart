import 'package:bootstrapper/pkg/i18n/bootstrap_localization.dart';
import 'package:bootstrapper/pkg/view/view_model/bootstrap_detail_view_model.dart';
import 'package:code_editor/code_editor.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class BootstrapDetailsView extends StatelessWidget {
  final String id;
  final bool isLoading;

  const BootstrapDetailsView(
      {Key key, @required this.id, this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider.withConsumer(
      viewModelBuilder: () => BootstrapDetailViewModel(id: id),
      onModelReady: (BootstrapDetailViewModel model) async {
        await model.fetchCurrentBootstrap();
      },
      builder: (context, BootstrapDetailViewModel model, child) =>
          model.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: true,
                    title: Text(
                      BootstrapLocalizations.of(context)
                          .translate('bootstrapDetails'),
                    ),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CodeEditor(
                            model: model.getEditorModel(),
                            edit: true,
                            onSubmit: model.onSubmit,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
    );
  }
}
