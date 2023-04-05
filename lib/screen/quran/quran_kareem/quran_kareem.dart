import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zikr_uz/screen/quran/bloc/quran_bloc.dart';
import 'package:zikr_uz/screen/quran/bloc/quran_state.dart';
import 'package:zikr_uz/screen/quran/quran_kareem/widget/quran_widget.dart';
import 'package:zikr_uz/data/shared/storage_service.dart';
import 'package:zikr_uz/utils/my_utils.dart';

class QuranKareem extends StatefulWidget {

  @override
  State<QuranKareem> createState() => _QuranKareemState();
}
class _QuranKareemState extends State<QuranKareem> {
   bool isTrue = true;

   void initState() {
    super.initState();
    isTrue = StorageService.getBool("lightSave");
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isTrue?Colors.green[50]:Colors.black,
      body:  BlocBuilder<QuranBloc, QuranState>(builder: (context, state) {
          if (state is QuransLoadInSuccess) {
            return InkWell(
          onTap: () {
            showModalBottomSheet(
              constraints: BoxConstraints(maxHeight: height(context) * 0.1),
              enableDrag: false,
              context: context,
              builder: (context) {
                return Container(
                  height: height(context)*0.08,
                  width: width(context),
                  color: Colors.black.withOpacity(0.1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              Navigator.pop(context);
                              Navigator.pop(context);

                            });
                          },
                          icon: Icon(Icons.arrow_back,size: height(context)*0.04,)),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              isTrue = !isTrue;

                              StorageService.saveBool("lightSave",isTrue);
                            });
                          },
                          icon: Icon(Icons.light_mode,size: height(context)*0.04,)),
                      
                    ],
                  ),
                );
              },
            );
          },
          child: QuranWidget(index: state.index,quranPage: state.quranPage,isTrue: isTrue,)
        );
          }
          return const SizedBox();
        }
    
      ),
    );
  }
}
