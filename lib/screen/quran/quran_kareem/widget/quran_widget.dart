import 'package:flutter/material.dart';
import 'package:zikr_uz/utils/my_utils.dart';
import 'package:quran/quran.dart' as quran;

class QuranWidget extends StatelessWidget {
  final int index;
  final int quranPage;
  bool isTrue;

  QuranWidget({super.key, required this.index, required this.quranPage, required this.isTrue});
  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height(context) * 0.05,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width(context) * 0.04),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                quran.getSurahName(index).toString(),
                style: TextStyle(fontSize: 18, color: isTrue ? Colors.black54 : Colors.white),
              ),
              Text(
                "Juz ${quran.getJuzNumber(index, 1)}",
                style: TextStyle(fontSize: 18, color:isTrue ? Colors.black54 : Colors.white),
              ),
            ],
          ),
        ),
        SizedBox(
          height: height(context) * 0.05,
        ),
        SizedBox(
          height: height(context) * 0.8,
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 603,
            reverse: true,
            itemBuilder: (context, index) {
              index += quranPage;
              return Image.asset(
                  color: isTrue ? null : Colors.white,
                  'assets/images/quran/page$index.png');
            },
          ),
        ),
      ],
    );
  }
}
