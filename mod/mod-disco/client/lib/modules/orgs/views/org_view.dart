import 'package:floating_search_bar/ui/sliver_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mod_main/modules/orgs/data/org_model.dart';
import 'package:mod_main/modules/orgs/view_model/org_view_model.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:responsive_scaffold/responsive_scaffold.dart';
import 'package:mod_main/core/core.dart';
import 'package:sys_core/sys_core.dart';

import 'org_detail_view.dart';

class OrgView extends StatelessWidget {
  final int id;

  const OrgView({Key key, this.id = -1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider.withConsumer(
      viewModel: OrgViewModel(),
      builder: (context, OrgViewModel model, child) => Scaffold(
        body: GetCourageMasterDetail<Org>(
          enableSearchBar: true,
          id: id,
          items: model.orgs,
          labelBuilder: (item) => item.campaignName,
          imageBuilder: (item) => item.logoUrl,
          routeWithIdPlaceholder: Modular.get<Paths>().orgsId,
          detailsBuilder: (context, detailsId, isFullScreen) => OrgDetailView(
              org: model.orgs[detailsId], showBackButton: isFullScreen),
          noItemsAvailable: Center(
            child: Text(
              ModMainLocalizations.of(context).translate('noCampaigns'),
            ),
          ),
          noItemsSelected: Center(
              child: Text(ModMainLocalizations.of(context)
                  .translate('noItemsSelected'))),
          disableBackButtonOnNoItemSelected: false,
          masterAppBarTitle: Text(
              ModMainLocalizations.of(context).translate('selectCampaign')),
        ),
      ),
    );
  }
}
