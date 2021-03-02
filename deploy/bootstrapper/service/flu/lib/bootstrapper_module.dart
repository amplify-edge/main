import 'package:bootstrapper/pkg/routes/paths.dart';
import 'package:bootstrapper/pkg/view/bootstrap_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:random_string/random_string.dart';

class BootstrapperModule extends Module {
  final String baseRoute;
  final String url;

  BootstrapperModule({
    String baseRoute,
    String url,
  })  : this.baseRoute = (baseRoute == '/') ? '' : baseRoute,
        this.url = url;

  String get getUrl => this.url;

  @override
  List<Bind> get binds => [
        Bind.singleton((i) => SuperadminPaths(baseRoute)),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) {
          return BootstrapView(
            key: Key(randomString(32)),
            bsList: args.data ?? [],
            routePlaceholder: SuperadminPaths(baseRoute).bootstrapDetailsPage,
          );
        }),
        ChildRoute(
          '/bootstraps',
          child: (_, args) => BootstrapView(
            key: Key(randomString(32)),
            bsList: args.data ?? [],
            routePlaceholder: SuperadminPaths(baseRoute).bootstrapDetailsPage,
          ),
        ),
        ChildRoute(
          '/bootstraps/:id',
          child: (_, args) => BootstrapView(
            key: Key(randomString(32)),
            bsList: args.data ?? [],
            id: args.params['id'] ?? '',
            routePlaceholder: SuperadminPaths(baseRoute).bootstrapDetailsPage,
          ),
        ),
      ];

  static Inject get to => Inject<BootstrapperModule>();
}
