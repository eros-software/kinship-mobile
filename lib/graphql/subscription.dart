import 'package:kinship_mobile/env.dart';
import 'package:soma_graphql_flutter/subscription.dart';

Subscription subscription = Subscription(
  env.baseWebSocket,
  protocols: ['graphql-ws'],
  headers: {'Authorization': 'Bearer', 'Content-Yype': 'application/json'},
);

getSubscription() {
  return subscription;
}
