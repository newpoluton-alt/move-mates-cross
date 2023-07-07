import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../ui/auth/custom_snackbar_builder.dart';
import '../../ui/auth/login/login_page.dart';
import '../../ui/auth/models.dart';
import '../../ui/user/user_page.dart';
import '../auth_bloc/auth_bloc_state.dart';
import '../models/auth_post_model.dart';

class AuthBlocTools {
  static void writeCredentialsIntoStorage(AuthStateLoaded state) async {
    const FlutterSecureStorage storage = FlutterSecureStorage();
    storage.aOptions.copyWith(encryptedSharedPreferences: true);

    await storage.write(
      key: StorageKeys.id,
      value: (state.credentials as LoginResponse).id.toString(),
    );
    await storage.write(
      key: StorageKeys.userName,
      value: (state.credentials as LoginResponse).userName,
    );
    await storage.write(
      key: StorageKeys.email,
      value: (state.credentials as LoginResponse).email,
    );
    await storage.write(
      key: StorageKeys.token,
      value: (state.credentials as LoginResponse).token,
    );
    await storage.write(
      key: StorageKeys.roles,
      value: (state.credentials as LoginResponse).roles.toString(),
    );
  }

  static void isStateChanged({
    required String id,
    required AuthState state,
    required BuildContext context,
    void Function(AuthStateLoaded state)? writeCredentials,
  }) {
    if (state is AuthStateLoaded) {
      if (writeCredentials != null) writeCredentials(state);
      Future.delayed(Duration.zero, () {
        if (id == LoginPage.id) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              UserPage.id, (Route<dynamic> route) => false);
        } else {
          Navigator.of(context).pushReplacementNamed(LoginPage.id);
        }
      });
    }
    if (state is AuthStateError) {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        ScaffoldMessenger.of(context)
            .showSnackBar(buildCustomAuthSnackBar(state.error));
      });
    }
  }

}