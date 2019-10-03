import 'package:kinship_mobile/pages/initial-setup-widget/+state/initial-setup-widget-actions.dart';
import 'package:kinship_mobile/pages/initial-setup-widget/+state/initial-setup-widget-state.dart';
import 'package:redux/redux.dart';

final initialSetupWidgetReducers = combineReducers<InitialSetupWidgetState>([
  TypedReducer<InitialSetupWidgetState,VerifyPreferences>(_verifyPreferences),
  TypedReducer<InitialSetupWidgetState,DeletePreferences>(_deletePreferences),
  TypedReducer<InitialSetupWidgetState,SavePreferences>(_savePreferences),
]);

InitialSetupWidgetState _verifyPreferences(InitialSetupWidgetState state, VerifyPreferences action) => state;

InitialSetupWidgetState _deletePreferences(InitialSetupWidgetState state, DeletePreferences action) => state;

InitialSetupWidgetState _savePreferences(InitialSetupWidgetState state, SavePreferences action) => state;

