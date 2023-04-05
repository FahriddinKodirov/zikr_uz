import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:zikr_uz/screen/azan/screen/azan_screen.dart';
import 'package:zikr_uz/screen/dua/duolar.dart';
import 'package:zikr_uz/screen/quran/quran_kareem/quran_kareem.dart';
import 'package:zikr_uz/screen/quran/quran_list.dart';
import 'package:zikr_uz/screen/tasbeh/tasbeh_screen.dart';

height(context) => MediaQuery.of(context).size.height;
width(context) => MediaQuery.of(context).size.width;


List listCategoryImage = [
  'assets/images/quran1.png',
  'assets/images/duo.png',
  'assets/images/tasbeh.png',
  'assets/images/azan11.png',
];

List listTitle = [
  'Quran',
  'Duo',
  'Tasbeh',
  'Azan',
];

List listIcon = [
  FlutterIslamicIcons.solidQuran2,
  FlutterIslamicIcons.muslim2,
  FlutterIslamicIcons.tasbih2,
  FlutterIslamicIcons.takbir,
];

List listCategory = [
  const QuranList(),
  const DuaScreen(),
  const TasbehScreen(),
  const AzanScreeen(),
];

InputDecoration getInputDecorationTwo({required String label}) {
  return InputDecoration(
    suffixIcon: const Icon(Icons.search),
    labelText: label,
    labelStyle: const TextStyle(color: Colors.black, fontSize: 16),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
      borderSide: BorderSide(
        width: 1,
      ),
    ),
    enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.black)),
    focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.black)),
    errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.black)),
  );
}