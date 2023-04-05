import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/quran.dart' as quran;
import 'package:zikr_uz/screen/quran/bloc/quran_bloc.dart';
import 'package:zikr_uz/screen/quran/bloc/quran_event.dart';
import 'package:zikr_uz/screen/quran/quran_kareem/quran_kareem.dart';
import 'package:zikr_uz/utils/my_utils.dart';

class QuranList extends StatelessWidget {
  const QuranList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:const Color(0xFFAAAAAA),
        appBar: AppBar(
          
          title: const Text(
            'Quran Kareem',
          ),
          backgroundColor: const Color(0xFF3D3D3D),
        ),
        body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: quran.totalSurahCount,
          itemBuilder: (context, index) {
            int quranPage = quran.getPageNumber(index + 1, 1);
            return Column(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => QuranKareem()));
                      BlocProvider.of<QuranBloc>(context).add(GetPage(quranPage: quranPage, index: index+1));
                  },
                  leading: Padding(
                      padding: EdgeInsets.all(width(context) * 0.022),
                      child: Text(
                        (index + 1).toString(),
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                      )),
                  title: Text(
                    'Surah  ${quran.getSurahName(index + 1)}',
                  ),
                  subtitle: Text(
                      '${quran.getPlaceOfRevelation(index + 1)} : ${quran.getVerseCount(index + 1)} oyat'),
                  trailing: Text(
                    '${quran.getPageNumber(index + 1, 1)}',
                  ),
                ),
                SizedBox(
                    height: height(context) * 0.0,
                    child: const Divider(
                      color: Colors.black,
                    ))
              ],
            );
          },
     ));
  }
}
