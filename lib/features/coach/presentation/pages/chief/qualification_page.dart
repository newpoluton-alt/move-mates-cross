import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/theme/colors/grey_color.dart';
import 'package:move_mates_android/config/theme/text_styles/app_text_style.dart';
import 'package:move_mates_android/features/coach/presentation/pages/chief/qualification_fields_page.dart';

import '../../../../user_auth/presentation/widgets/auth_page/auth_page_validation_button_widget.dart';
import '../../wigets/qualification_page/qualification_page_add_information_button_widget.dart';
import '../../wigets/qualification_page/qualification_page_app_bar_back_button.dart';

class QualificationPage extends StatefulWidget {
  const QualificationPage({super.key});

  static const String id = 'qualification_page';

  @override
  State<QualificationPage> createState() => _QualificationPageState();
}

class _QualificationPageState extends State<QualificationPage> {
  late List<QualificationInformationModel> _qualificationInfoList;

  @override
  void initState() {
    _qualificationInfoList = [];
    super.initState();
  }

  void _addQualificationInfoModel(QualificationInformationModel model) {
    setState(() {
      _qualificationInfoList.add(model);
    });
  }

  void _refreshQualificationInfoModel(QualificationInformationModel model) {
    setState(() {
      int elementIndex = _qualificationInfoList
          .indexWhere((element) => element.id == model.id);
      _qualificationInfoList[elementIndex] = model;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 115.w,
        title: const Text('Квалификация'),
        backgroundColor: GreyColor.g8.withOpacity(0),
        leading: const QualificationPageAppBarBackButton(),
      ),
      backgroundColor: GreyColor.g8,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 31.h),
                  ..._qualificationInfoList.map(
                    (model) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => QualificationFieldsPage(
                                  model: model,
                                  addQualificationInfoModel:
                                      _addQualificationInfoModel,
                                  refreshQualificationInfoModel:
                                      _refreshQualificationInfoModel,
                                )));
                      },
                      child: Container(
                        height: 98.h,
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: 11.h),
                        padding: EdgeInsets.symmetric(
                          horizontal: 9.w,
                          vertical: 13.h,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.r)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model.title,
                              maxLines: null,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyle.semiBold(
                                  fontSize: 13.sp, color: Colors.black),
                            ),

                            Text(
                              maxLines: 2,
                              model.description,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyle.semiBold(
                                  fontSize: 16.sp, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  QualificationPageAddInformationButtonWidget(
                    addQualificationInfoModel: _addQualificationInfoModel,
                  ),
                  SizedBox(height: 90.h)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 15.h),
              alignment: Alignment.bottomCenter,
              child: AuthPageValidationButtonWidget(
                name: 'Добавить',
                buttonColor: Colors.black,
                textStyle:
                    AppTextStyle.semiBold(fontSize: 15.sp, color: Colors.white),
                onPushing: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QualificationInformationModel {
  final String id;
  final String title;
  final String description;

  const QualificationInformationModel({
    required this.id,
    required this.title,
    required this.description,
  });
}
