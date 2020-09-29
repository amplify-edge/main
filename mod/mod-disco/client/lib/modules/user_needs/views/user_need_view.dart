import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mod_main/core/shared_services/dynamic_widget_service.dart';
import 'package:mod_main/modules/orgs/data/org_model.dart';
import 'package:mod_main/modules/user_needs/data/user_need_model.dart';
import 'package:mod_main/modules/user_needs/view_model/userneed_view_model.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:mod_main/core/core.dart';

class UserNeedsView extends StatelessWidget {
  final String orgID;

  UserNeedsView({Key key, this.orgID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider.withConsumer(
      viewModel: UserNeedsViewModel(),
      onModelReady: (UserNeedsViewModel model) {
        model.initializeData(orgID);
      },
      builder: (context, UserNeedsViewModel model, child) => Scaffold(
        appBar: AppBar(
          title: Text(ModMainLocalizations.of(context).translate('yourNeeds')),
        ),
        body: (model.buzy)
            ? Center(child: Offstage())
            : ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(model.org.logoUrl),
                        ),
                        title: Text(
                          model.org.campaignName,
                          style: Theme.of(context).textTheme.title,
                        ),
                        isThreeLine: true,
                        subtitle: Text(
                          model.org.goal
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  ListTile(
                    title: Text(
                      ModMainLocalizations.of(context).translate('needsSatisifiedRequirement'),
                      style: Theme.of(context).textTheme.body1,
                    ),
                  ),
                  const SizedBox(height: 8.0),

                  //...this._dynamicFormWidgets,
                  ...model.buildWidgetList(context),
                  
                  ButtonBar(
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          model.navigateNext(context);
                        },
                        child: Text(ModMainLocalizations.of(context).translate('next')),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
