
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/colors/pink_color.dart';
import '../../../../../config/theme/text_styles/app_text_style.dart';
import '../../../../user_auth/domain/usecases/user_sign_out.dart';
import '../../../../user_auth/presentation/cubit/user_auth_cubit.dart';
import '../../../../user_auth/presentation/cubit/user_auth_state.dart';
import '../../../../user_auth/presentation/pages/auth_page.dart';
import '../../../../user_auth/presentation/widgets/auth_page/auth_page_custom_snackbar_builder.dart';

class ProfilePageExitButtonWidget extends StatelessWidget {
  const ProfilePageExitButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserAuthCubit, UserAuthState>(builder: (context, state) {
      if (state is UserAuthError) {
        SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
          ScaffoldMessenger.of(context)
              .showSnackBar(buildAuthPageCustomSnackBar('state.error'));
        });
      }
      if (state is UserAuthLoaded) {
        SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
          Navigator.of(context).pushReplacementNamed(AuthPage.id);
        });
      }

      return MaterialButton(
        height: 45.h,
        elevation: 0,
        minWidth: 350.w,
        color: Colors.white,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        onPressed: () {
          context.read<UserAuthCubit>().onUserSignOut(SignOutParam());
        },
        child: Text(
          'Выйти',
          style: AppTextStyle.medium(fontSize: 15.sp, color: PinkColor.p18),
        ),
      );
    });
  }
}
