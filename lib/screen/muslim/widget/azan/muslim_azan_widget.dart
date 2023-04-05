import 'package:flutter/material.dart';
import 'package:zikr_uz/data/model/azan/azan_model.dart';
import 'package:zikr_uz/screen/azan/screen/azan_screen.dart';
import 'package:zikr_uz/screen/muslim/widget/azan/today_azan_screen.dart';
import 'package:zikr_uz/utils/my_utils.dart';

class MuslimAzanWidget extends StatelessWidget {
  final TodayAzanModel azanModel;

  const MuslimAzanWidget({super.key, required this.azanModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_)=> const TodayAzanScreen()));
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFD4D5D7),
          border: Border.all(color: Colors.teal),
          borderRadius: BorderRadius.circular(height(context)*0.02),
          boxShadow:const [
            BoxShadow(
              offset: Offset(1.5, 1.5),
              blurRadius: 1,
              spreadRadius: 1
            ),
          ]
        ),
        height: height(context) * 0.11,
        width: width(context),
      
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
            text('Bomdod','Tong',azanModel.data.timings.Fajr,azanModel.data.timings.Sunrise),
            text('Peshin','Asr',azanModel.data.timings.Dhuhr,azanModel.data.timings.Asr),
            text('Shom','Hufton',azanModel.data.timings.Maghrib,azanModel.data.timings.Isha),
            ],
          ),
        ),
      ),
    );
  }

  text(word,word2,namoz,namoz2) {
    return Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$word ${namoz.replaceAll(('(BST)'), '')}',
          style: const TextStyle(fontSize: 18,color: Colors.teal),
        ),
         Text(
          '$word2 ${namoz2.replaceAll(('(BST)'), '')}',
          style: const TextStyle(fontSize: 18,color: Colors.teal),
        ),
      ],
    );
  }
}
