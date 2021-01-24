class SuperadminPaths {
  final String baseRoute;
  String bootstrapPage;
  String bootstrapDetailsPage;

  SuperadminPaths(this.baseRoute)
      : bootstrapPage = '$baseRoute/bootstraps',
        bootstrapDetailsPage = '$baseRoute/bootstraps/:id';
}
