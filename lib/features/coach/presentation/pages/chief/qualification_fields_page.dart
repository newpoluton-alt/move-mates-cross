import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/theme/colors/grey_color.dart';
import 'package:move_mates_android/config/theme/text_styles/app_text_style.dart';
import 'package:move_mates_android/features/coach/presentation/pages/chief/qualification_page.dart';
import 'package:move_mates_android/features/coach/presentation/wigets/qualification_fields_page/qualification_fields_page_common_text_field.dart';
import 'package:move_mates_android/features/coach/presentation/wigets/qualification_fields_page/qualification_fields_page_image_drag_widget.dart';
import 'package:move_mates_android/features/coach/presentation/wigets/qualification_page/qualification_page_app_bar_back_button.dart';

import '../../../../user_auth/presentation/widgets/auth_page/auth_page_validation_button_widget.dart';

// ignore: must_be_immutable
class QualificationFieldsPage extends StatefulWidget {
  QualificationInformationModel? model;
  final void Function(QualificationInformationModel model)
      addQualificationInfoModel;
  void Function(QualificationInformationModel model)?
      refreshQualificationInfoModel;

  QualificationFieldsPage({
    super.key,
    this.model,
    this.refreshQualificationInfoModel,
    required this.addQualificationInfoModel,
  });

  @override
  State<QualificationFieldsPage> createState() =>
      _QualificationFieldsPageState();
}

class _QualificationFieldsPageState extends State<QualificationFieldsPage> {
  late TextEditingController _nameTextEditingController;
  late GlobalKey<FormState> _qualificationFieldsPageGlobalKey;
  late TextEditingController _descriptionTextEditingController;

  @override
  void initState() {
    _nameTextEditingController =
        TextEditingController(text: widget.model?.title);
    _qualificationFieldsPageGlobalKey = GlobalKey<FormState>();
    _descriptionTextEditingController =
        TextEditingController(text: widget.model?.description);
    super.initState();
  }

  @override
  void dispose() {
    _descriptionTextEditingController.dispose();
    _nameTextEditingController.dispose();
    super.dispose();
  }

  void _qualificationFieldsPageSubmit() {
    if (!mounted) return;
    if (!_qualificationFieldsPageGlobalKey.currentState!.validate()) return;
    _qualificationFieldsPageGlobalKey.currentState!.save();

    if (widget.model != null && widget.refreshQualificationInfoModel != null) {
      widget.refreshQualificationInfoModel!(QualificationInformationModel(
          id: widget.model!.id,
          title: _nameTextEditingController.text,
          description: _descriptionTextEditingController.text));
    } else {
      widget.addQualificationInfoModel(QualificationInformationModel(
          id: UniqueKey().toString(),
          title: _nameTextEditingController.text,
          description: _descriptionTextEditingController.text));
    }
    Navigator.of(context).pop();
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
      body: Form(
        key: _qualificationFieldsPageGlobalKey,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25.h),
                  Text(
                    'Название',
                    style: AppTextStyle.medium(
                        fontSize: 15.sp, color: GreyColor.g9),
                  ),
                  SizedBox(height: 8.h),
                  QualificationFieldsPageCommonTextField(
                    textInputAction: TextInputAction.next,
                    textEditingController: _nameTextEditingController,
                  ),
                  SizedBox(height: 25.h),
                  Text(
                    'Описание',
                    style: AppTextStyle.medium(
                        fontSize: 15.sp, color: GreyColor.g9),
                  ),
                  SizedBox(height: 8.h),
                  QualificationFieldsPageCommonTextField(
                    textInputAction: TextInputAction.done,
                    textEditingController: _descriptionTextEditingController,
                  ),
                  SizedBox(height: 25.h),
                  const QualificationFieldsPageImageDragWidget(),
                  Text(
                    'Загрузить свои дипломы, сертификаты',
                    style: AppTextStyle.medium(
                        fontSize: 12.sp, color: GreyColor.g28),
                  ),
                  SizedBox(height: 40.h),
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(bottom: 45.h),
                    child: AuthPageValidationButtonWidget(
                      name: 'Добавить',
                      buttonColor: Colors.black,
                      textStyle: AppTextStyle.semiBold(
                        fontSize: 15.sp,
                        color: Colors.white,
                      ),
                      onPushing: _qualificationFieldsPageSubmit,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
