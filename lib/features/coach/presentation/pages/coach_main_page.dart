import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_mates_android/config/theme/colors.dart';
import 'package:move_mates_android/core/constants/coach/coach_page_constants.dart';
import 'package:move_mates_android/features/user_auth/domain/usecases/user_sign_out.dart';
import 'package:move_mates_android/features/user_auth/presentation/cubit/user_auth_cubit.dart';
import 'package:move_mates_android/features/user_auth/presentation/cubit/user_auth_state.dart';
import 'package:move_mates_android/features/user_auth/presentation/pages/auth_page.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/signup/asset_icon_widget.dart';

import '../../../../core/constants/coach/bottom_navigation_data.dart';
import '../../../../user_auth_injection_container.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  static const id = 'user_page';

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  int currentPage = 0;

  void changePage(int index) {
    setState(() {
      currentPage = index;
    });
  }
  void doSignOut(BuildContext context) {
    context.read<UserAuthCubit>().onUserSignOut(SignOutParam());
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserAuthCubit>(
      create: (_) => sl<UserAuthCubit>(),
      child:
          BlocBuilder<UserAuthCubit, UserAuthState>(builder: (context, state) {
            if (state is Loaded) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushReplacementNamed(AuthPage.id);
            });
            }

        return Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(state is Loading ? 'Выход...' : 'Главная',
                  textAlign: TextAlign.center),
            ),
            actions: [
              IconButton(
                  onPressed: ()=>doSignOut(context),
                  icon: const Icon(Icons.exit_to_app))
            ],
          ),
          body: CoachPageConstants.coachPagesList[currentPage],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentPage,
              onTap: changePage,
              items: UserPageData.bottomNavigationBarModelList
                  .map((e) => BottomNavigationBarItem(
                      icon: AssetIcon(path: e.path, color: CoachColor.icon),
                      label: e.name))
                  .toList()),
        );
      }),
    );
  }
}

class BottomNavigationBarModel {
  final String name;
  final String path;

  const BottomNavigationBarModel({
    required this.name,
    required this.path,
  });
}
