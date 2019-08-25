import 'package:flutter/material.dart';
import 'package:kinship_mobile/env.dart';
import 'package:kinship_mobile/main.dart';

void main() {
  BuildEnvironment.init(
    flavor: BuildFlavor.local,
    baseUrl: 'http://10.0.2.2/api',
    baseUrlGraphql: 'http://10.0.2.2/api/graphql',
    baseWebSocket: 'ws://10.0.2.2/graphql'
  );
  assert(env != null);
  runApp(MyApp());
}
