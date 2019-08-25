import 'package:meta/meta.dart';

enum BuildFlavor { local, develop }

BuildEnvironment get env => _env;
BuildEnvironment _env;

class BuildEnvironment {
  final String baseUrl;
  final String baseUrlGraphql;
  final String baseWebSocket;
  final BuildFlavor flavor;

  BuildEnvironment._init({this.flavor, this.baseUrl, this.baseUrlGraphql, this.baseWebSocket});

  getBaseUrl() => baseUrl;

  getBaseUrlGraphql() => baseUrlGraphql;

  getBaseWebSocket() => baseWebSocket;

  static void init({@required flavor, @required baseUrl, @required baseUrlGraphql, @required baseWebSocket}) => _env ??= BuildEnvironment._init(flavor: flavor, baseUrl: baseUrl, baseUrlGraphql: baseUrlGraphql, baseWebSocket: baseWebSocket);
}
