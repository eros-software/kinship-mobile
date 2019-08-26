
import 'package:kinship_mobile/env.dart';
import 'package:soma_graphql_flutter/graphql-client.dart';

GraphqlClient client = GraphqlClient(
  endPoint: env.getBaseUrlGraphql(),
);

setToken(String token) {
  client.apiToken = token;
}

getClient() {
  return client;
}