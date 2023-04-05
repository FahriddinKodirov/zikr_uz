import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:zikr_uz/data/model/azan/azan_model.dart';
import 'package:zikr_uz/screen/azan/bloc/azan_bloc.dart';
import 'package:zikr_uz/screen/azan/bloc/azan_state.dart';
import 'package:zikr_uz/screen/azan/screen/widget/list_azan_widget.dart';
import 'package:zikr_uz/screen/muslim/widget/azan/azan_widget.dart';
import 'package:zikr_uz/screen/muslim/bloc/azan_bloc.dart';
import 'package:zikr_uz/screen/muslim/bloc/azan_state.dart';

class TodayAzanScreen extends StatelessWidget {
  const TodayAzanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AzanBloc, AzanState>(
        builder: (context, state) {
          if (state is InitialTodayAzanState) {
            return const Center(
              child: Text('hali data yoq'),
            );
          } else if (state is LoadTodayAzanInProgress) {
        return LoadingAnimationWidget.beat(color: Colors.green, size: 100);

          } else if (state is LoadTodayAzanInSuccess) {
            TodayAzanModel azanModel = state.todayAzanModel;
            return AzanWidget(azanModel: azanModel,);
          } else if (state is LoadTodayAzanInFairlure) {
            return Text(state.errorText);
          }
          return const SizedBox();
        }, 
      
    );
  }
}
