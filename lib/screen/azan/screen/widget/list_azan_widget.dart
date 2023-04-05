import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zikr_uz/data/model/azan/azan_model.dart';
import 'package:zikr_uz/utils/my_utils.dart';



class ListAzanWidget extends StatefulWidget {
  final AzanModel azanModel;
  const ListAzanWidget({super.key, required this.azanModel});

  @override
  State<ListAzanWidget> createState() => _ListAzanWidgetState();
}

class _ListAzanWidgetState extends State<ListAzanWidget> {

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: EdgeInsets.symmetric(horizontal: width(context)*0.03),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
         itemCount: widget.azanModel.data.length,
         itemBuilder:(context, index) {
         return containerTitle(context,
         widget.azanModel.data[index].date.readable,
         widget.azanModel.data[index].timings.Fajr,
         widget.azanModel.data[index].timings.Sunrise,
         widget.azanModel.data[index].timings.Dhuhr,
         widget.azanModel.data[index].timings.Asr,
         widget.azanModel.data[index].timings.Maghrib,
         widget.azanModel.data[index].timings.Isha,
          );
        },),
      
    );
  }

  containerTitle(context,date,fajr,sunrise,dhuhr,asr,maghrib,isha){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
            padding: EdgeInsets.symmetric(horizontal: width(context)*0.024),
            height: height(context)*0.12,
            width: width(context),
            decoration: BoxDecoration(
              boxShadow:const [
          BoxShadow(
            offset: Offset(1, 1),
            blurRadius: 1,
            spreadRadius: 1
          ),
        ],
            color:const Color(0xFFEFF8FF),
              borderRadius: BorderRadius.circular(height(context)*0.02)
            ), 
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: height(context)*0.01,),
            Text(date),
            text('Bomdod','Tong',fajr,sunrise),
            text('Peshin','Asr',dhuhr,asr),
            text('Shom','Hufton',maghrib,isha),
            ],)
          ),
    );
  }

   text(word,word2,namoz,namoz2) {
    return Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$word ${namoz.replaceAll(('(+05)'), '')}',
          style: const TextStyle(fontSize: 18,color: Colors.teal),
        ),
         Text(
          '$word2 ${namoz2.replaceAll(('(+05)'), '')}',
          style: const TextStyle(fontSize: 18,color: Colors.teal),
        ),
      ],
    );
  }
}