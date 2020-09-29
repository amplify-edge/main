import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mod_main/modules/orgs/data/org_model.dart';
import 'package:mod_main/core/shared_widgets/campaign_header.dart';
import '../../../core/core.dart';

class OrgDetailView extends StatelessWidget {
  final Org org;
  final bool showBackButton;

  const OrgDetailView({Key key, this.org, this.showBackButton = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: showBackButton,
        title:
            Text(ModMainLocalizations.of(context).translate('campaignDetails')),
      ),
      body: Column(
        children: <Widget>[
          CampaignHeader(
            org: org,
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                //   CarouselWithIndicator(imgList: campaign.videoURL),
                ListTile(
                  title: Text(
                    ModMainLocalizations.of(context).translate('campaignName'),
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text(org.campaignName),
                ),
                const SizedBox(height: 16.0),
                ListTile(
                  title: Text(
                    ModMainLocalizations.of(context).translate('category'),
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text(org.category),
                ),
                const SizedBox(height: 16.0),
                ListTile(
                  title: Text(
                    ModMainLocalizations.of(context).translate('actionType'),
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text(org.actionType),
                ),
                const SizedBox(height: 16.0),
                ListTile(
                  title: Text(
                    ModMainLocalizations.of(context)
                            .translate('actionLocation') +
                        ' / ' +
                        ModMainLocalizations.of(context).translate('time'),
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text(
                      '${org.actionLocation} / ${DateFormat('yyyy MMM dd HH:MM').format(org.actionTime)}'),
                ),
                const SizedBox(height: 16.0),
                ListTile(
                  title: Text(
                    ModMainLocalizations.of(context)
                        .translate('lengthOfTheAction'),
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text('${org.actionLength} ${org.uom}'),
                ),
                const SizedBox(height: 16.0),
                ListTile(
                  title: Text(
                    ModMainLocalizations.of(context).translate('goal'),
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text(org.goal),
                ),
                const SizedBox(height: 16.0),
                ListTile(
                  title: Text(
                    ModMainLocalizations.of(context).translate('strategy'),
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text(org.strategy),
                ),
                const SizedBox(height: 16.0),
                ListTile(
                  title: Text(
                    ModMainLocalizations.of(context)
                        .translate('historicalPrecedents'),
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text(org.histPrecedents),
                ),
                const SizedBox(height: 16.0),
                ListTile(
                  title: Text(
                    ModMainLocalizations.of(context)
                        .translate('backingEndorsingOrganizations'),
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text(org.backingOrg.join('\n')),
                ),
                const SizedBox(height: 16.0),
                ListTile(
                  title: Text(
                    ModMainLocalizations.of(context)
                        .translate('peopleAlreadyPledged'),
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text(org.alreadyPledged.toString()),
                ),
                const SizedBox(height: 16.0),
                Card(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              ModMainLocalizations.of(context)
                                      .translate('weNeed') +
                                  ' :',
                              style: Theme.of(context).textTheme.title,
                            ),
                            subtitle: Text(
                              ModMainLocalizations.of(context)
                                  .translate('extrapolatedSimilarPastActions'),
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          ListTile(
                            title: Text(ModMainLocalizations.of(context)
                                .translate('pioneersToStart')),
                            trailing: Text(
                              '${org.minPioneers}',
                              style: TextStyle(
                                  color: Theme.of(context).accentColor),
                            ),
                          ),
                          ListTile(
                            title: Text(ModMainLocalizations.of(context)
                                .translate('rebelsMedia')),
                            trailing: Text(
                              '${org.minRebelsForMedia}',
                              style: TextStyle(
                                  color: Theme.of(context).accentColor),
                            ),
                          ),
                          ListTile(
                            title: Text(ModMainLocalizations.of(context)
                                .translate('rebelsWin')),
                            trailing: Text(
                              '${org.minRebelsToWin}',
                              style: TextStyle(
                                  color: Theme.of(context).accentColor),
                            ),
                          ),
                        ],
                      )),
                ),
                const SizedBox(height: 16.0),
                ListTile(
                  title: Text(
                    ModMainLocalizations.of(context)
                        .translate('contactDetails'),
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text(org.contact),
                ),
                const SizedBox(height: 16.0),
                ButtonBar(children: [
                  FlatButton(
                    onPressed: () {
                      Modular.to.pushNamed(Modular.get<Paths>()
                          .myNeeds
                          .replaceAll(':id', org.id));
                    },
                    child: Text(
                        ModMainLocalizations.of(context).translate("notReady")),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Modular.to.pushNamed('/account/signup');
                    },
                    child: Text(
                        ModMainLocalizations.of(context).translate("ready")),
                  ),
                ]),
                const SizedBox(height: 8.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
