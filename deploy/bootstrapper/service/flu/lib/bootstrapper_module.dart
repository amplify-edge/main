import 'package:bootstrapper/pkg/routes/paths.dart';
import 'package:bootstrapper/pkg/view/bootstrap_view.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BootstrapperModule extends ChildModule {
  final String baseRoute;
  final String url;

  BootstrapperModule({
    String baseRoute,
    String url,
  })  : this.baseRoute = (baseRoute == '/') ? '' : baseRoute,
        this.url = url;

  @override
  List<Bind> get binds => [
        Bind((i) => Paths(baseRoute)),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => BootstrapView()),
        ModularRouter('/bootstraps', child: (_, args) => BootstrapView()),
        ModularRouter(
          '/bootstraps/:id',
          child: (_, args) => BootstrapView(
            id: args.params['id'] ?? '',
          ),
        )
      ];

  static Inject get to => Inject<BootstrapperModule>.of();
}
