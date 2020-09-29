import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mod_account/modules/signup/view_model/signup_view_model.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:mod_account/core/core.dart';



class SignUpView extends StatefulWidget {
  const SignUpView({Key key, this.campaignID}) : super(key: key);
  final String campaignID;
  @override
  SignUpViewState createState() => SignUpViewState();
}

class SignUpViewState extends State<SignUpView> {

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider.withConsumer(
      viewModel: SignUpViewModel(),
      builder: (context, SignUpViewModel model, child) =>
           Scaffold(
             appBar: AppBar(),
            body: ListView(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(ModAccountLocalizations.of(context).translate('signUpForAccount'),
                    style: Theme.of(context).textTheme.display1),
            ),
            const SizedBox(height: 32.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                  decoration: InputDecoration(
                    labelText: ModAccountLocalizations.of(context).translate('emailAddress') + ' *',
                    labelStyle: Theme.of(context).textTheme.bodyText2,
                    suffix: const Icon(Icons.email),
                  ),
                ),
            ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      '* ' + ModAccountLocalizations.of(context).translate('needProtonMail'),
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    InkWell(
                      onTap: () {
                        _showProtonMail(context);
                      },
                      child: Text(
                        ModAccountLocalizations.of(context).translate('explainWhy'),
                        style: Theme.of(context).textTheme.body2.copyWith(
                              color: Theme.of(context).accentColor,
                              fontStyle: FontStyle.italic,
                            ),
                      ),
                    )
                  ],
                ),
              ),
               const SizedBox(height: 32.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: ModAccountLocalizations.of(context).translate('password'),
                    labelStyle: Theme.of(context).textTheme.body2,
                    suffix: Icon(Icons.lock_outline),
                  ),
                ),
            ),
             Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Text(
                  ModAccountLocalizations.of(context).translate('passwordStrength'),
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
             const SizedBox(height: 32.0),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 16.0),
               child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: ModAccountLocalizations.of(context).translate('passwordAgain'),
                    labelStyle: Theme.of(context).textTheme.body2,
                    suffix: Icon(Icons.lock_outline),
                  ),
                ),
             ),
             const SizedBox(height: 32.0),
            ListTile(
              title: Text(ModAccountLocalizations.of(context).translate('meetOthersSharedInterest')),
            ),
            RadioListTile<bool>(
              title: Text(ModAccountLocalizations.of(context).translate('yes')),
              value: true,
              groupValue: model.meetOthers,
              onChanged: (value) {
               model.selectMeetOthers(value);
              },
            ),
            RadioListTile<bool>(
              title: Text(ModAccountLocalizations.of(context).translate('no')),
              value: false,
              groupValue: model.meetOthers,
              onChanged: (bool value) {
               model.selectMeetOthers(value);
              },
            ),
            ListTile(
              title: Text(ModAccountLocalizations.of(context).translate('civilDisobedienceTraining')),
            ),
             RadioListTile<bool>(
              title: Text(ModAccountLocalizations.of(context).translate('yes')),
              value: true,
              groupValue: model.haveTraining,
              onChanged: (value) {
               model.selectTraining(value);
              },
            ),
            RadioListTile<bool>(
              title: Text(ModAccountLocalizations.of(context).translate('no')),
              value: false,
              groupValue: model.haveTraining,
              onChanged: (bool value) {
               model.selectTraining(value);
              },
            ),
            ListTile(
              title: Text(ModAccountLocalizations.of(context).translate('setupNotificationChannel')),
            ),
            SwitchListTile(
              title: Text(ModAccountLocalizations.of(context).translate('email')),
              value: model.emailEnabled,
              onChanged: (bool value) {
                model.enableEmail(value);
              },
              secondary: const Icon(Icons.email),
            ),
            SwitchListTile(
              title: Text(ModAccountLocalizations.of(context).translate('appMessaging')),
              value: model.messagesEnabled,
              onChanged: (bool value) {
                model.enableMessages(value);
              },
              secondary: const Icon(Icons.message),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: RaisedButton(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(ModAccountLocalizations.of(context).translate('signUp'),
                              style: Theme.of(context).textTheme.body2),
                          onPressed: () {
                            Modular.to.pushReplacementNamed('/home');
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          _showBottomSheet(context);
                        },
                        child: Text(
                          ModAccountLocalizations.of(context).translate('privacyPolicy'),
                          style: Theme.of(context).textTheme.body2.copyWith(
                                color: Theme.of(context).accentColor,
                                decoration: TextDecoration.underline,
                              ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  void _showProtonMail(BuildContext context) {
    showModalBottomSheet<Widget>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      context: context,
      builder: (BuildContext con) {
        return Scrollbar(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 4),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 40,
                  color: Theme.of(context).colorScheme.secondaryVariant,
                  height: 4,
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SizedBox(height: 24),
                    ListTile(
                      title: Text(ModAccountLocalizations.of(context).translate('whyProtonMail')),
                      subtitle: Text(
                          ModAccountLocalizations.of(context).translate('protonMailExplanation')),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showBottomSheet(BuildContext context) {
   
    showModalBottomSheet<Widget>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      context: context,
      builder: (BuildContext con) {
        return Scrollbar(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 4),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 40,
                  color: Theme.of(context).colorScheme.secondaryVariant,
                  height: 4,
                ),
              ),
              const SizedBox(height: 8),
/*               const ListTile(
                title: Text(
                    'Currently in development, to assure a highly secure system based on End to End encryption principles. On the users devices all user data is encrypted at rest against the users public key. On our servers, all data in transit or at rest is encrypted against the users public key. User aggregation is not done.'),
              ), */
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8.0),
                  children: <Widget>[
                    const SizedBox(height: 24),
                    ListTile(
                      title: Text(ModAccountLocalizations.of(context).translate('privacyPolicy')),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}