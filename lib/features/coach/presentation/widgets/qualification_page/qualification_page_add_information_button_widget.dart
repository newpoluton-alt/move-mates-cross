import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import '../../../../../config/theme/text_styles/app_text_style.dart';
import '../../pages/main/qualification_fields_page.dart';
import '../../pages/main/qualification_page.dart';

class QualificationPageAddInformationButtonWidget extends StatelessWidget {
  final void Function(QualificationInformationModel model)
      addQualificationInfoModel;

  const QualificationPageAddInformationButtonWidget(
      {super.key, required this.addQualificationInfoModel});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => QualificationFieldsPage(
                  addQualificationInfoModel: addQualificationInfoModel,
                )));
      },
      height: 43.h,
      elevation: 0,
      minWidth: 158.w,
      color: GreyColor.g30,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
          side: const BorderSide(color: Colors.black)),
      child: Text('Добавить еще',
          style: AppTextStyle.semiBold(fontSize: 15.sp, color: Colors.black)),
    );
  }
}
