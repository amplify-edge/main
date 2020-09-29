import 'package:flutter_modular/flutter_modular.dart';
import 'package:mod_main/core/core.dart';
import 'package:mod_main/core/shared_repositories/mocks/mock_org_repository.dart';
import 'package:mod_main/core/shared_repositories/mocks/mock_support_role_answer_repository.dart';
import 'package:mod_main/core/shared_repositories/mocks/mock_support_role_repository.dart';
import 'package:mod_main/core/shared_repositories/mocks/mock_user_need_answer_repository.dart';
import 'package:mod_main/core/shared_repositories/mocks/mock_user_need_repository.dart';
import 'package:mod_main/modules/org_manager/orgs/views/org_master_detail_view.dart';
import 'package:mod_main/modules/support_roles/services/support_role_answer_service.dart';
import 'package:mod_main/modules/user_needs/services/user_need_answer_service.dart';
import 'orgs/service/orgs_service.dart';
import 'orgs/views/org_view.dart';
import 'user_needs/services/user_need_service.dart';
import 'splash/views/splash_view.dart';
import 'support_roles/services/support_role_service.dart';
import 'support_roles/views/support_role_view.dart';
import 'user_needs/views/user_need_view.dart';
import 'userinfo/views/userinfo_view.dart';

class MainAppModule extends ChildModule {
  final String baseRoute;
  final String url;
  final String urlNative;

  // static String cutOffBaseRoute(String route) {
  //   if (route.indexOf(baseRoute) < 0) return route;
  //   return route.substring(
  //       route.indexOf(baseRoute) + baseRoute.length, route.length);
  // }

  MainAppModule({
    String baseRoute,
    String url,
    String urlNative,
  })  : this.baseRoute = (baseRoute == '/') ? '' : baseRoute,
        this.url = url,
        this.urlNative = urlNative;

  @override
  List<Bind> get binds => [
        Bind((i) => Paths(baseRoute)),
        Bind((i) => EnvConfig(url, urlNative)),
        Bind((i) => OrgsService(
            repository:
                MockOrgRepository())), // TODO Replace this later with OrgRepository
        Bind((i) => UserNeedService(
            repository:
                MockUserNeedRepository())), // TODO Replace this later with UserNeedRepository
        Bind((i) => UserNeedAnswerService(
            repository:
                MockUserNeedAnswerRepository())), // TODO Replace this later with UserNeedAnswerRepository
        Bind((i) => SupportRoleService(
            repository:
                MockSupportRoleRepository())), // TODO Replace this later with SupportRoleRepository
        Bind((i) => SupportRoleAnswerService(
            repository:
                MockSupportRoleAnswerRepository())), // TODO Replace this later with SupportRoleRepository
      ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter("/", child: (_, args) => SplashView()),
    /// Non-Admin Dashboard Routes
    ModularRouter("/userInfo", child: (_, args) => UserInfoView()),
    ModularRouter("/orgs", child: (_, args) => OrgView(),),
    ModularRouter("/orgs/:id", child: (_, args) => OrgView(id: int.tryParse(args.params['id']) ?? -1,)),
    ModularRouter("/myneeds/orgs/:id", child: (_, args) => UserNeedsView(orgID: args.params['id'],)),
    ModularRouter("/supportRoles/orgs/:id", child: (_, args) => SupportRoleView(orgId: args.params['id'],)),
    /// Admin Dashboard Routes
    ModularRouter("/dashboard/orgs", child: (_, args) => OrgMasterDetailView()),
    ModularRouter("/dashboard/orgs/:id", child: (_, args) => OrgMasterDetailView(id: int.tryParse(args.params['id']) ?? -1,)),
  ];

  static Inject get to => Inject<MainAppModule>.of();
}
