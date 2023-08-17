import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/theme/text_styles/coach/coach_home_text_style.dart';
import 'package:move_mates_android/features/coach/data/models/coach_clients_content_model.dart';
import 'package:move_mates_android/features/coach/data/models/coach_clients_model.dart';
import 'package:move_mates_android/features/coach/domain/entities/coach_clients_content_entity.dart';
import 'package:move_mates_android/features/coach/presentation/pages/coach_main_page.dart';
import 'package:move_mates_android/features/coach/presentation/wigets/client_list_page/coach_clients_element_widget.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/auth/custom_snackbar_builder.dart';

import '../../../injection_container.dart';
import '../../domain/usecase/get_clients_list_case.dart';
import '../cubit/coach_cubit.dart';
import '../cubit/coach_state.dart';
import '../wigets/client_list_page/coach_search_text_field_widget.dart';

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
    sl<CoachCubit>().close();
    coachClientsSearchNotifier.dispose();
    super.dispose();
  }

  void checkIfTextHasChanges() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CoachCubit>()
        ..onGetClientsList(ClientsListParam(size: 999, page: 0)),
      child: BlocBuilder<CoachCubit, CoachState>(builder: (context, state) {
        if (state is CoachStateError) {
          SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
            ScaffoldMessenger.of(context)
                .showSnackBar(buildCustomSnackBar(state.error));
          });
        }
        if (state is CoachStateLoaded) {
          coachClientsSearchNotifier.searchClients(
              clientsContentModel: (state.model as CoachClientsModel).content,
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
                  CoachSearchTextFieldWidget(
                      checkIfTextHasChanges: checkIfTextHasChanges,
                      coachTextEditingController: coachTextEditingController,
                      outlineTextFieldBorder: _outlineTextFieldBorder),
                  ValueListenableBuilder<List<CoachClientsContentEntity>?>(
                      valueListenable: coachClientsSearchNotifier.clients,
                      builder: (context, clients, _) {
                        if (clients == null || clients.isEmpty) {
                          return Container(
                            margin: EdgeInsets.only(top: 111.h),
                            child: (state is CoachStateLoading)
                                ? const CircularProgressIndicator()
                                : Center(
                                    child: Text(
                                    'У вас пока нет клиентов',
                                    style: CoachHomeTextStyle.noTraining,
                                  )),
                          );
                        }
                        return Column(
                          children: clients
                              .map((e) => CoachClientsElementWidget(
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
      ValueNotifier([]);

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
