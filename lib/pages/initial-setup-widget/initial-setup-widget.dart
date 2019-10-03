import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:kinship_mobile/app-state.dart';
import 'package:kinship_mobile/pages/initial-setup-widget/+model/initial-setup-widget-model.dart';
import 'package:kinship_mobile/pages/initial-setup-widget/+state/initial-setup-widget-actions.dart';

class InitialSetupWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, InitialSetupWidgetModel>(
      converter: (store) => InitialSetupWidgetModel.fromStore(store),
      onInit: (store) => store.dispatch(new VerifyPreferences()),
      builder: (context, model) {
        return Container();
      },
    );
  }
  
} 
