import 'package:bootstrapper/pkg/i18n/bootstrap_localization.dart';
import 'package:bootstrapper/pkg/view/bootstrap_detail_view.dart';
import 'package:bootstrapper/pkg/view/view_model/bootstrap_view_model.dart';
import 'package:bootstrapper/rpc/v2/main_bootstrap_models.pb.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:sys_core/pkg/widgets/admin_master_details.dart';

class BootstrapView extends StatefulWidget {
  final String id;
  final List<BS> bsList;
  final String routePlaceholder;

  const BootstrapView(
      {Key key, this.id = '', this.bsList, this.routePlaceholder})
      : super(key: key);

  @override
  _BootstrapViewState createState() => _BootstrapViewState();
}

class _BootstrapViewState extends State<BootstrapView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider.withConsumer(
      viewModelBuilder: () => BootstrapViewModel(widget.bsList),
      onModelReady: (BootstrapViewModel model) async {
        if (widget.bsList == null || widget.bsList.isEmpty) {
          await model.fetchBootstraps();
        }
      },
      builder: (context, BootstrapViewModel model, child) => Scaffold(
        body: model.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : AdminMasterDetails<BS>(
                enableSearchBar: false,
                id: widget.id,
                activeId: model.activeId,
                items: model.bootstrapList,
                labelBuilder: (item) => item.fileId,
                routeWithIdPlaceholder: widget.routePlaceholder,
                detailsBuilder: (context, widgetId, isFullScreen) {
                  return BootstrapDetailsView(
                    id: widgetId,
                    deleteCallback: () async {
                      await model.refreshBootstrapList();
                    },
                  );
                },
                noItemsAvailable: Center(
                  child: Text(
                    BootstrapLocalizations.of(context)
                        .translate('noBootstraps'),
                    style: Theme.of(context).copyWith().textTheme.subtitle2,
                    textAlign: TextAlign.center,
                  ),
                ),
                noItemsSelected: Center(
                  child: Container(),
                ),
                disableBackButtonOnNoItemSelected: false,
                masterAppBarTitle: Text(BootstrapLocalizations.of(context)
                    .translate('selectBootstrap')),
                isLoadingMoreItems: false,
                hasMoreItems: false,
              ),
      ),
    );
  }
}
