import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zikr_uz/data/shared/storage_service.dart';
import 'package:zikr_uz/screen/tasbeh/cubit/counter_cubit.dart';
import 'package:zikr_uz/utils/my_utils.dart';

class TasbehScreen extends StatefulWidget {
  const TasbehScreen({super.key});

  @override
  State<TasbehScreen> createState() => _TasbehScreenState();
}

class _TasbehScreenState extends State<TasbehScreen> {
  bool isTrue = true;

  void initState() {
    super.initState();
    isTrue = StorageService.getBool("lightTasbeh");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isTrue ? const Color(0xFF343D46) : Colors.white,
      appBar: AppBar(
        title: const Text('Tashbeh Counter'),
        backgroundColor: Colors.green,
      ),
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(height(context) * 0.03),
            child: Column(
              children: [
                SizedBox(
                  height: height(context) * 0.06,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  height: height(context) * 0.3,
                  width: width(context),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.teal,
                            offset: Offset(1, 1),
                            spreadRadius: 10,
                            blurRadius: 50,
                            blurStyle: BlurStyle.solid)
                      ],
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 1)),
                  child: Center(
                      child: AnimatedFlipCounter(
                    curve: Curves.ease,
                    value: state,
                    padding: const EdgeInsets.all(8),
                    textStyle: TextStyle(
                      fontSize: height(context) * 0.13,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -8.0,
                      color: Colors.yellow,
                      shadows: const [
                        BoxShadow(
                          color: Colors.orange,
                          offset: Offset(2, 4),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                  )),
                ),
                SizedBox(
                  height: height(context) * 0.12,
                ),
                Center(
                  child: InkWell(
                      borderRadius: BorderRadius.circular(height(context)),
                      onTap: () {
                        BlocProvider.of<CounterCubit>(context).increment();
                      },
                      child: Container(
                        height: height(context) * 0.2,
                        width: height(context) * 0.2,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.green,
                                  offset: Offset(1, 1),
                                  spreadRadius: 10,
                                  blurRadius: 50,
                                  blurStyle: BlurStyle.solid)
                            ],
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black, width: 1)),
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        borderRadius: BorderRadius.circular(height(context)),
                        onTap: () {
                          BlocProvider.of<CounterCubit>(context).refresh();
                          setState(() {
                            isTrue = !isTrue;
                            StorageService.saveBool("lightTasbeh", isTrue);
                          });
                        },
                        child: Container(
                          height: height(context) * 0.08,
                          width: height(context) * 0.08,
                          decoration: const BoxDecoration(
                              color: Colors.amber,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(1, 1),
                                  spreadRadius: 5,
                                  blurRadius: 10,
                                )
                              ],
                              shape: BoxShape.circle),
                        )),
                    InkWell(
                        borderRadius: BorderRadius.circular(height(context)),
                        onTap: () {
                          BlocProvider.of<CounterCubit>(context).refresh();
                        },
                        child: Container(
                          height: height(context) * 0.08,
                          width: height(context) * 0.08,
                          decoration: const BoxDecoration(
                              color: Colors.red,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(1, 1),
                                  spreadRadius: 5,
                                  blurRadius: 10,
                                )
                              ],
                              shape: BoxShape.circle),
                        )),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
