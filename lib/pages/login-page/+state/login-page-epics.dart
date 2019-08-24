import 'package:kinship_mobile/app-state.dart';
import 'package:kinship_mobile/pages/login-page/+state/login-page-actions.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

final loginPageEpics = combineEpics<AppState>([
  loginActionEpic, 
  errorActionEpic,
]);


Stream<dynamic> loginActionEpic(Stream<dynamic> actions, EpicStore<AppState> store) {

  return new Observable(actions)
    .ofType(new TypeToken<LoginAction>())
    .asyncMap((action) => print('login epic'));

}

Stream<dynamic> errorActionEpic(Stream<dynamic> actions, EpicStore<AppState> store) {

  return new Observable(actions)
    .ofType(new TypeToken<ErrorAction>())
    .asyncMap((action) => print('error epic'));

}


