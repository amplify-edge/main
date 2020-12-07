class Paths {
  final String baseRoute;
  String bootstrapPage;
  String bootstrapDetailsPage;

  Paths(this.baseRoute)
      : bootstrapPage = '$baseRoute/bootstrap',
        bootstrapDetailsPage = '$baseRoute/bootstrap/:id';
}
