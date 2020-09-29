


class EnvConfig {
  final String url;
  final String urlNative;

  EnvConfig(this.url, this.urlNative);

  @override
  String toString() {
    return "EnvConfig {url: $url} \n {native url: $urlNative}";
  }
}