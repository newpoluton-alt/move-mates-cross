import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../../coach/presentation/pages/coach_page.dart';
import 'user_auth_state.dart';
import '../pages/login_page.dart';
import '../widgets/auth/custom_snackbar_builder.dart';

class AuthBlocTools {

  static void isStateChanged({
    required String id,
    required UserAuthState state,
    required BuildContext context,
  }) {
    if (state is Loaded) {
      Future.delayed(Duration.zero, () {
        if (id == LoginPage.id) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              UserPage.id, (Route<dynamic> route) => false);
        } else {
          Navigator.of(context).pushReplacementNamed(LoginPage.id);
        }
      });
    }
    if (state is Error) {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        ScaffoldMessenger.of(context)
            .showSnackBar(buildCustomAuthSnackBar(state.error));
      });
    }
  }

}