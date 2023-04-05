import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zikr_uz/data/model/azan/azan_model.dart';
import 'package:zikr_uz/screen/azan/bloc/azan_bloc.dart';
import 'package:zikr_uz/screen/azan/bloc/azan_state.dart';
import 'package:zikr_uz/screen/azan/screen/widget/list_azan_widget.dart';
import 'package:zikr_uz/screen/muslim/widget/azan/azan_widget.dart';
import 'package:zikr_uz/screen/muslim/bloc/azan_bloc.dart';
import 'package:zikr_uz/screen/muslim/bloc/azan_state.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


class AzanScreeen extends StatelessWidget {
  const AzanScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFFEFF8FF),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Azan time'),
      ),
      body: BlocBuilder<ListAzanBloc, ListAzanState>(
          builder: (context, state) {
            if (state is InitialListAzanState) {
              return const Center(
                child: Text('hali data yoq'),
              );
            } else if (state is LoadAzanInProgress) {
              return Center(child: LoadingAnimationWidget.beat(color: Colors.green, size: 100));
            } else if (state is LoadAzanInSuccess) {
              AzanModel azanModel = state.azanModel;
              return ListAzanWidget(azanModel: azanModel,);
            } else if (state is LoadAzanInFairlure) {
              return Text(state.errorText);
            }
            return const SizedBox();
          }, 
        
      ),
    );
  }
}
