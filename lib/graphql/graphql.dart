import 'package:kinship_mobile/graphql/client.dart';
import 'package:rxdart/rxdart.dart';


Future<dynamic> mutation(
    String body, {
    Map<String, dynamic> variables,
  }) async {
  client = getClient();
  dynamic response = await client.query(query: body, variables: variables);
  return (response.data.containsKey('errors')) ? response.data : response.data['data'];
}

Future<dynamic> query(
    String body, {
    Map<String, dynamic> variables,
  }) async {
  client = getClient();
  dynamic response = await client.query(query: body, variables: variables);
  return (response.data.containsKey('errors')) ? Observable.just(response.data) : Observable.just(response.data['data']);
}
