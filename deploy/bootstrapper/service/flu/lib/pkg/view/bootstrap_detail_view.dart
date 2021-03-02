import 'package:bootstrapper/pkg/i18n/bootstrap_localization.dart';
import 'package:bootstrapper/pkg/view/view_model/bootstrap_detail_view_model.dart';
import 'package:code_editor/code_editor.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';

class BootstrapDetailsView extends StatelessWidget {
  final String id;
  final Function deleteCallback;

  const BootstrapDetailsView({Key key, @required this.id, this.deleteCallback})
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
                    automaticallyImplyLeading: false,
                    title: Text(
                      BootstrapLocalizations.of(context).bootstrapDetails(),
                    ),
                    actions: [
                      IconButton(
                        autofocus: false,
                        tooltip: BootstrapLocalizations.of(context).execute(),
                        onPressed: model.onExecuteBootstrap(context, id),
                        icon: Icon(Icons.check, color: Colors.white),
                      ),
                      IconButton(
                        autofocus: false,
                        tooltip: BootstrapLocalizations.of(context).delete(),
                        onPressed: model.onDeleteBootstrap(
                            context, id, deleteCallback),
                        icon: Icon(
                          Icons.delete_outline,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 30),
                          model.getEditorModel(context),
                        ],
                      ),
                    ),
                  ),
                ),
    );
  }
}
