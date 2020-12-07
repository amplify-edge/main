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
        // ModularRouter("/userInfo", child: (_, args) => UserInfoView()),
        ModularRouter(Paths(baseRoute).bootstrapPage,
            child: (_, args) => BootstrapView()),
        ModularRouter(
          Paths(baseRoute).bootstrapDetailsPage,
          child: (_, args) => BootstrapView(
            id: args.params['id'] ?? '',
          ),
        )
      ];

  static Inject get to => Inject<BootstrapperModule>.of();
}
