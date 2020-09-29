class BaseRepository {
  // This may OR may not be needed based on how the GRPC model works
  // Think of it like holding an instance of a MySQL socket connection
  // It's the entry point from which we make our requests
  // LIkely it will be a static api instance (we don't want to do the work multiple times)
  dynamic getConnection() {
    return "Something like DataApi.instance";
  }
}
