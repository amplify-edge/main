import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mod_main/core/shared_widgets/campaign_header.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:mod_main/modules/support_roles/data/support_role_model.dart';
import 'package:mod_main/core/shared_services/dynamic_widget_service.dart';
import 'package:mod_main/core/core.dart';

import '../view_model/supportRole_view_model.dart';

class SupportRoleView extends StatelessWidget {
  final String orgId;

  SupportRoleView({Key key, this.orgId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider.withConsumer(
      onModelReady: (SupportRoleViewModel model) {
        model.fetchOrgById(orgId);
      },
      viewModel: SupportRoleViewModel(),
      builder: (context, SupportRoleViewModel model, child) => Scaffold(
        appBar: AppBar(
          title:
              Text(ModMainLocalizations.of(context).translate('supportRoles')),
        ),
        body: (model.buzy)
            ? Center(child: Offstage())
            : Column(children: [
                CampaignHeader(
                  org: model.org,
                ),
                Expanded(
                  child: _buildSupportRolesList(context, model),
                ),
              ]),
      ),
    );
  }

  Widget _getNextButton(BuildContext context, SupportRoleViewModel model) =>
      ButtonBar(children: [
        RaisedButton(
          onPressed: () {
            model.save();
            Modular.to.pushNamed('/account/signup');
          },
          child: Text(ModMainLocalizations.of(context).translate('next')),
        )
      ]);

  Widget _buildSupportRolesList(context, SupportRoleViewModel model) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: model.supportRoles.length + 1, // +1 is for the next button
      itemBuilder: (BuildContext context, int index) {
        //add next button as last item to the list
        if (index == model.supportRoles.length) {
          return _getNextButton(context, model);
        } else {
          SupportRole sp = model.supportRoles[index];
          return DynamicSlider(
            title: sp.name,
            question: sp.description,
            current: model.minHours[sp.id] ?? 0.0,
            min: 0.0,
            max: 8.0,
            callbackInjection: (String value) {
              model.selectMinHours(double.tryParse(value) ?? 0.0, sp.id);
            },
          );
        }
      },
    );
  }
}
