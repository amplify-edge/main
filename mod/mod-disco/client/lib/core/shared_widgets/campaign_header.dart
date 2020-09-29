import 'package:flutter/material.dart';
import 'package:mod_main/modules/orgs/data/org_model.dart';

class CampaignHeader extends StatelessWidget {
  final Org org;

  const CampaignHeader({Key key, @required this.org})
      : assert(org != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(org.logoUrl),
          ),
          title: Text(
            org.campaignName,
            style: Theme.of(context).textTheme.title,
          ),
          subtitle: Text(
            org.goal,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
