import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zikr_uz/data/repository/azan_repo.dart';
import 'package:zikr_uz/data/shared/storage_service.dart';
import 'package:zikr_uz/screen/azan/bloc/azan_bloc.dart';
import 'package:zikr_uz/screen/azan/bloc/azan_event.dart';
import 'package:zikr_uz/screen/muslim/bloc/azan_bloc.dart';
import 'package:zikr_uz/screen/muslim/bloc/azan_event.dart';
import 'package:zikr_uz/screen/muslim/muslim_main.dart';
import 'package:zikr_uz/screen/quran/bloc/quran_bloc.dart';
import 'package:zikr_uz/screen/quran/bloc/quran_event.dart';
import 'package:zikr_uz/screen/tasbeh/cubit/counter_cubit.dart';
import 'package:zikr_uz/service/api/api_service.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  StorageService.getInstance();
  runApp(MultiBlocProvider(providers: [
      BlocProvider(create: (context) => QuranBloc()..add(GetPage(index: 0,quranPage: 0))),
      BlocProvider(create: (context) => ListAzanBloc(AzanRepo(apiService: ApiService()))..add(FetchAllAzan())),
      BlocProvider(create: (context) => AzanBloc(AzanRepo(apiService: ApiService()))..add(FetchSingleAzan())),
      BlocProvider(create: (context) => CounterCubit(0)),
  ],    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.white
      ),
      home: const MuslimMain(),
    );
  }
}

