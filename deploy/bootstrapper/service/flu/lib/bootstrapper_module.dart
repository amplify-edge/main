import 'package:bootstrapper/pkg/routes/paths.dart';
import 'package:bootstrapper/pkg/view/bootstrap_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sys_share_sys_account_service/pkg/guards/admin_guard.dart';
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
        Bind((i) => Paths(baseRoute)),
        Bind((i) => BootstrapRepo()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/',
            child: (_, args){ 
              return GuardianWidget(widget: BootstrapView());
            }),
        ModularRouter('/bootstraps',
            child: (_, args) => GuardianWidget(widget: BootstrapView())),
        ModularRouter(
          '/bootstraps/:id',
          child: (_, args) => GuardianWidget(
              widget: BootstrapView(
            id: args.params['id'] ?? '',
          )),
        )
      ];

  static Inject get to => Inject<BootstrapperModule>.of();
}
