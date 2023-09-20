import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/theme/text_styles/coach/coach_home_text_style.dart';
import 'package:move_mates_android/features/coach/data/models/coach_clients_content_model.dart';
import 'package:move_mates_android/features/coach/data/models/coach_clients_model.dart';
import 'package:move_mates_android/features/coach/domain/entities/coach_clients_content_entity.dart';
import 'package:move_mates_android/features/coach/presentation/cubit/coach_get_client_list_cubit.dart';
import 'package:move_mates_android/features/coach/presentation/pages/coach_main_page.dart';

import '../../../../injection_container.dart';
import '../../../../user_auth/presentation/widgets/auth_page/auth_page_custom_snackbar_builder.dart';
import '../../../domain/usecase/get_clients_list_case.dart';
import '../../widgets/chief_page/chief_page_deeplink_widget.dart';
import '../../widgets/client_list_page/client_list_page_element_widget.dart';
import '../../widgets/client_list_page/client_list_page_search_text_field_widget.dart';

class ClientListPage extends StatefulWidget implements CoachPage {
  const ClientListPage({super.key});

  @override
  State<ClientListPage> createState() => _ClientListPageState();

  @override
  String pageNameValue() {
    return pageName;
  }

  static const String pageName = 'Ваши клиенты';
}

class _ClientListPageState extends State<ClientListPage> {
  final InputBorder _outlineTextFieldBorder = InputBorder.none;
  late final TextEditingController coachTextEditingController;
  late final CoachClientsSearchNotifier coachClientsSearchNotifier;

  @override
  void initState() {
    coachClientsSearchNotifier = CoachClientsSearchNotifier();
    coachTextEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    sl<CoachGetClientListCubit>().close();
    coachClientsSearchNotifier.dispose();
    super.dispose();
  }

  void checkIfTextHasChanges() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
      sl<CoachGetClientListCubit>()
        ..onGetClientsList(ClientsListParam(size: 999, page: 0)),
      child: BlocBuilder<CoachGetClientListCubit, CoachGetClientListState>(
          builder: (context, state) {
            if (state is CoachGetClientListError) {
              SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(buildAuthPageCustomSnackBar(state.error));
              });
            }
            if (state is CoachGetClientListLoaded) {
              coachClientsSearchNotifier.searchClients(
                  clientsContentModel: (state.model as CoachClientsModel)
                      .content,
                  query: coachTextEditingController.value);
            }
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClientListPageSearchTextFieldWidget(
                          checkIfTextHasChanges: checkIfTextHasChanges,
                          coachTextEditingController: coachTextEditingController,
                          outlineTextFieldBorder: _outlineTextFieldBorder),
                      ValueListenableBuilder<List<CoachClientsContentEntity>?>(
                          valueListenable: coachClientsSearchNotifier.clients,
                          builder: (context, clients, _) {
                            if (clients == null || clients.isEmpty) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  (clients != null)
                                      ? Container(
                                      margin: EdgeInsets.only(top: 26.h, bottom: 52.h),
                                      child: const ChiefPageDeepLinkWidget())
                                      : const SizedBox(),
                                  Container(
                                    margin: EdgeInsets.only(top: 111.h),
                                    child: (state is CoachGetClientListLoading)
                                        ? const CircularProgressIndicator()
                                        : Center(
                                        child: Text(
                                          'У вас пока нет клиентов',
                                          style: CoachHomeTextStyle.noTraining,
                                        )),
                                  ),
                                ],
                              );
                            }
                            return Column(
                              children: clients
                                  .map((e) =>
                                  ClientsListPageElementWidget(
                                      coachClientsContentModel:
                                      (e as CoachClientsContentModel)))
                                  .toList(),
                            );
                          })
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class CoachClientsSearchNotifier {
  final ValueNotifier<List<CoachClientsContentEntity>?> clients =
  ValueNotifier(null);

  void searchClients({
    required List<CoachClientsContentEntity> clientsContentModel,
    required TextEditingValue query,
  }) {
    clients.value = clientsContentModel.where((element) {
      if (query.text.isEmpty) {
        return true;
      } else {
        return element.email.contains(query.text);
      }
    }).toList();
  }

  void dispose() {
    clients.dispose();
  }
}
