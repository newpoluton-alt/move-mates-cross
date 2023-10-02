import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/theme/text_styles/app_text_style.dart';
import 'package:move_mates_android/features/coach/presentation/cubit/coach_profile_state.dart';
import 'package:move_mates_android/features/injection_container.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import '../../widgets/settings_page/settings_page_app_bar_widget.dart';
import '../../widgets/settings_page/settings_page_element_view_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  static const String id = 'settings_page';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CoachProfileCubit>(
      create: (_)=>sl<CoachProfileCubit>(),
      child: Scaffold(
        backgroundColor: GreyColor.g8,
        appBar: const SettingsPageAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    height: 80.r,
                    width: 80.r,
                    decoration: BoxDecoration(
                        color: GreyColor.g25,
                        borderRadius: BorderRadius.circular(80.r)),
                  ),
                ),
                SizedBox(height: 9.h),
                Text(
                  'Киррил Саратов',
                  style:
                      AppTextStyle.semiBold(fontSize: 20.sp, color: Colors.black),
                ),
                SizedBox(height: 9.h),
                Text(
                  '+996 999 999 999',
                  style:
                      AppTextStyle.normal(fontSize: 15.sp, color: GreyColor.g1),
                ),
                SizedBox(height: 36.h),
                const SettingsPageElementsViewWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SettingsPageElementModel extends Equatable {
  final String name;
  final String route;
  final String iconPath;

  const SettingsPageElementModel({
    required this.name,
    required this.route,
    required this.iconPath,
  });

  @override
  List<Object?> get props => [name, route, iconPath];
}
