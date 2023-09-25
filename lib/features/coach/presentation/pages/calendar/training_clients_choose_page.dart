import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:move_mates_android/config/theme/colors/pink_color.dart';
import 'package:move_mates_android/config/theme/text_styles/app_text_style.dart';
import 'package:move_mates_android/features/coach/coach_injection_container.dart';
import 'package:move_mates_android/features/coach/domain/entities/coach_clients_content_entity.dart';
import 'package:move_mates_android/features/coach/domain/usecase/get_clients_list_case.dart';
import 'package:move_mates_android/features/coach/presentation/cubit/coach_get_client_list_cubit.dart';
import 'package:move_mates_android/features/user_auth/presentation/widgets/auth_page/auth_page_custom_snackbar_builder.dart';

import '../../../../../config/theme/colors/grey_color.dart';
import '../../../data/models/coach_clients_model.dart';
import '../../widgets/chief_page/chief_page_deeplink_widget.dart';
import '../../widgets/qualification_page/qualification_page_app_bar_back_button.dart';
import 'training_creation_page.dart';

class TrainingClientsChoosePage extends StatefulWidget {
  final TrainingType trainingType;
  final String? Function() clientsValue;
  final void Function(String? value) updateClients;

  const TrainingClientsChoosePage({
    super.key,
    required this.trainingType,
    required this.clientsValue,
    required this.updateClients,
  });

  @override
  State<TrainingClientsChoosePage> createState() =>
      _TrainingClientsChoosePageState();
}

class _TrainingClientsChoosePageState extends State<TrainingClientsChoosePage> {
  CoachClientsContentEntity? _selectedClient;
  late TrainingClientsNotifier _clientsListNotifier;
  late List<CoachClientsContentEntity> _selectedClients;

  @override
  void initState() {
    _selectedClients = [];
    _clientsListNotifier = TrainingClientsNotifier();
    super.initState();
  }

  bool get _isIndividualTraining =>
      widget.trainingType == TrainingType.individual;

  bool _checkNameContaining(
      CoachClientsContentEntity client, List<String> names) {
    return names.contains(client.userName ?? client.id.toString());
  }
  void _addRestoredEntityToSelectedClients(CoachClientsContentEntity client) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        _selectedClients.add(client);
      });
    });
  }
  void _stringOfNamesToList(List<CoachClientsContentEntity> coachClients) {
    if (widget.clientsValue() == null) return;
    List<String> names = widget.clientsValue()!.split(', ');
    for (var client in coachClients) {
      if (_checkNameContaining(client, names) && !_selectedClients.contains(client)) {
        _addRestoredEntityToSelectedClients(client);
      }
    }
  }

  String _listOfEntitiesToString(
      List<CoachClientsContentEntity> selectedClients) {
    String joinedNames = '';
    for (var entity in selectedClients) {
      joinedNames += entity.userName ?? entity.id.toString();
      if (selectedClients.last != entity) {
        joinedNames += ', ';
      }
    }
    return joinedNames;
  }

  void _chooseOrAddClient(CoachClientsContentEntity entity) {
    if (_isIndividualTraining) {
      setState(() {
        _selectedClient = entity;
        widget.updateClients(entity.userName ?? entity.id.toString());
      });
      return;
    }
    //in case of group training particularly when element is removed
    if (_selectedClients.any((element) => entity == element)) {
      setState(() {
        _selectedClients.remove(entity);
        widget.updateClients(_listOfEntitiesToString(_selectedClients));
      });
      return;
    }

    //when element is added
    setState(() {
      _selectedClients.add(entity);
      widget.updateClients(_listOfEntitiesToString(_selectedClients));
    });
  }

  bool _isClientSelected(CoachClientsContentEntity entity) {
    if (_isIndividualTraining) {
      return _selectedClient != null && _selectedClient == entity;
    } else {
      return _selectedClients.any((element) => element == entity);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CoachGetClientListCubit>(
      create: (_) => sl<CoachGetClientListCubit>()
        ..onGetClientsList(ClientsListParam(size: 999, page: 0)),
      child: Scaffold(
        backgroundColor: GreyColor.g8,
        appBar: AppBar(
          centerTitle: true,
          leadingWidth: 115.w,
          title: const Text('Ваши клиенты'),
          backgroundColor: GreyColor.g8.withOpacity(0),
          leading: const QualificationPageAppBarBackButton(),
        ),
        body: BlocBuilder<CoachGetClientListCubit, CoachGetClientListState>(
            builder: (context, state) {
          if (state is CoachGetClientListLoaded) {
            _clientsListNotifier
                .addClients((state.model as CoachClientsModel).content);
            _stringOfNamesToList(_clientsListNotifier.clientsList.value ?? []);
          }

          if (state is CoachGetClientListLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CoachGetClientListError) {
            SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(buildAuthPageCustomSnackBar(state.error));
            });
          }
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ValueListenableBuilder<List<CoachClientsContentEntity>?>(
                  valueListenable: _clientsListNotifier.clientsList,
                  builder: (context, value, _) {
                    if ((value ?? []).isEmpty) {
                      return Column(
                        children: [
                          SizedBox(height: 26.h),
                          const ChiefPageDeepLinkWidget(),
                          SizedBox(height: 163.h),
                          Text(
                            'У вас пока нет клиентов',
                            style: AppTextStyle.medium(
                                fontSize: 15.sp, color: GreyColor.g1),
                          )
                        ],
                      );
                    }
                    return Column(
                        children: (value ?? [])
                            .map((entity) => ClientListElementWidget(
                                  entity: entity,
                                  isSelected: _isClientSelected(entity),
                                  chooseOrAddClient: _chooseOrAddClient,
                                ))
                            .toList());
                  }),
            ),
          );
        }),
      ),
    );
  }
}

class TrainingClientsNotifier {
  final ValueNotifier<List<CoachClientsContentEntity>?> clientsList =
      ValueNotifier(null);

  void addClients(List<CoachClientsContentEntity> clients) {
    clientsList.value = clients;
  }
}

class ClientListElementWidget extends StatelessWidget {
  final bool isSelected;
  final CoachClientsContentEntity entity;
  final void Function(CoachClientsContentEntity entity) chooseOrAddClient;

  const ClientListElementWidget({
    super.key,
    required this.entity,
    required this.isSelected,
    required this.chooseOrAddClient,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.r),
      onTap: () {
        chooseOrAddClient(entity);
      },
      child: Container(
        height: 72.h,
        width: double.infinity,
        padding: EdgeInsets.only(left: 12.w),
        margin: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: const Color.fromRGBO(217, 217, 217, 0.4),
                blurRadius: 2.h,
                offset: Offset(0, 3.h)),
          ],
          border: Border.all(color: isSelected ? PinkColor.p9 : Colors.white),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          children: [
            Container(
              width: 56.r,
              height: 56.r,
              decoration: BoxDecoration(
                  color: PinkColor.p2,
                  borderRadius: BorderRadius.circular(
                    100.r,
                  )),
            ),
            SizedBox(width: 12.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entity.userName ?? entity.id.toString(),
                  style: AppTextStyle.semiBold(
                    fontSize: 14.sp,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Клиент',
                  style: AppTextStyle.normal(
                    fontSize: 12.sp,
                    color: GreyColor.g36,
                  ),
                ),
              ],
            ),
            SizedBox(width: 152.w),
            isSelected
                ? Icon(
                    Icons.check_circle,
                    size: 22.r,
                    color: PinkColor.p19,
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
