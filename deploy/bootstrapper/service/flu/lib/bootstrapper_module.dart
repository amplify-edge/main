import 'package:bootstrapper/pkg/routes/paths.dart';
import 'package:bootstrapper/pkg/view/bootstrap_view.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pkg/view/view_model/bootstrap_view_model.dart';

class BootstrapperModule extends ChildModule {
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
        Bind.lazySingleton((i) => BootstrapViewModel())
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) {
          return BootstrapView(
            routePlaceholder: SuperadminPaths(baseRoute).bootstrapDetailsPage,
          );
        }),
        ChildRoute('/bootstraps',
            child: (_, args) => BootstrapView(
                  routePlaceholder:
                      SuperadminPaths(baseRoute).bootstrapDetailsPage,
                )),
        ChildRoute(
          '/bootstraps/:id',
          child: (_, args) => BootstrapView(
            id: args.params['id'] ?? '',
            routePlaceholder: SuperadminPaths(baseRoute).bootstrapDetailsPage,
          ),
        ),
      ];

  static Inject get to => Inject<BootstrapperModule>();
}
