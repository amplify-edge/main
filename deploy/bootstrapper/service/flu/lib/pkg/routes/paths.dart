class Paths {
  final String baseRoute;
  String bootstrapPage;
  String bootstrapDetailsPage;

  Paths(this.baseRoute)
      : bootstrapPage = '$baseRoute/bootstraps',
        bootstrapDetailsPage = '$baseRoute/bootstraps/:id';
}
