# maintemplate

## Generating the i18n files

The files in this directory are based on ../lib/core/i18n/app_localization.dart
which defines all of the localizable strings used by the maintemplate
app. The maintemplate app uses
the [Dart `intl` package](https://github.com/dart-lang/intl).

Rebuilding everything requires two steps.

With the `maintemplate/client` as the current directory, generate
`intl_messages.arb` from `lib/core/i18n/app_localization.dart`:
```
flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/core/i18n/generated lib/core/i18n/app_localization.dart
```

Then make sure,  `$GOBIN` enviornment variable is set to the path where golang binary binary exists. Then run the following command to generate translations in `JSON` format.

```
i18n flutter --dir lib/core/i18n/generated --template lib/core/i18n/generated/intl_messages.arb --prefix lang --languages en,fr,es,ur -f
```

Once generated then, run following command to generate `.arb` files from `json`


```
i18n flutter --dir lib/core/i18n/generated
```

The `intl_messages.arb` file is a JSON format map with one entry for
each `Intl.message()` function defined in `app_localization.dart`. This
file was used to create the English, French, Urdu and Spanish localizations,
`lang_en.arb`,`lang_ur.arb`,`lang_fr.arb` and `lang_es.arb`.


With the `maintemplate/client` as the current directory, generate a
`lang_messages_<locale>.dart` for each `lang_<locale>.arb` file and
`lang_messages_all.dart`, which imports all of the messages files:

```
flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/core/i18n/generated \ --generated-file-prefix=lang_ --no-use-deferred-loading lib/core/i18n/app_localization.dart lib/core/i18n/generated/lang_en.arb lib/core/i18n/generated/lang_es.arb lib/core/i18n/generated/lang_fr.arb lib/core/i18n/generated/lang_ur.arb lib/core/i18n/generated/intl_messages.arb
```

The `AppLocalization` class uses the generated `initializeMessages()`
function (`lang_messages_all.dart`) to load the localized messages
and `Intl.message()` to look them up.

