import 'package:bootstrapper/pkg/routes/paths.dart';
import 'package:bootstrapper/pkg/view/bootstrap_view.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'pkg/shared_repositories/bootstrap_repo.dart';

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
        Bind.singleton((i) => Paths(baseRoute)),
        Bind.lazySingleton((i) => BootstrapRepo()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) {
          return BootstrapView();
        }),
        ChildRoute('/bootstraps', child: (_, args) => BootstrapView()),
        ChildRoute(
          '/bootstraps/:id',
          child: (_, args) => BootstrapView(
            id: args.params['id'] ?? '',
          ),
        ),
      ];

  static Inject get to => Inject<BootstrapperModule>();
}
