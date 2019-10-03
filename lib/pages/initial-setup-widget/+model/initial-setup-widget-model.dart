import 'package:kinship_mobile/app-state.dart';
import 'package:redux/redux.dart';

class InitialSetupWidgetModel{

  InitialSetupWidgetModel();

  static InitialSetupWidgetModel fromStore(Store<AppState> store) =>
    new InitialSetupWidgetModel();
}

