import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zikr_uz/data/model/azan/azan_model.dart';
import 'package:zikr_uz/utils/my_utils.dart';
import 'package:hijri/hijri_calendar.dart';

class AzanWidget extends StatefulWidget {
  final TodayAzanModel azanModel;
  const AzanWidget({super.key, required this.azanModel});

  @override
  State<AzanWidget> createState() => _AzanWidgetState();
}

class _AzanWidgetState extends State<AzanWidget> {
  var selectedDate =  HijriCalendar.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFFEFF8FF),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Azan time'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width(context)*0.03),
        child: Column(children: [
          SizedBox(height: height(context)*0.03,),

           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Container(
              height: height(context)*0.16,
              width: width(context)*0.45,
              decoration: BoxDecoration(
              color:const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(height(context)*0.03)
              ), 
              child: Column(
                children: [
                  SizedBox(height: height(context)*0.02,),
                  const Text('Namoz vaqti'),
                  SizedBox(height: height(context)*0.003,),
                  Text(widget.azanModel.data.timings.Isha,style: TextStyle(fontSize: width(context)*0.12,fontWeight: FontWeight.w700),),
                  SizedBox(height: height(context)*0.01,),
                  const Text('Hufton')
                ],
              ),
            ),
             Container(
              height: height(context)*0.16,
              width: width(context)*0.45,
              decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(height(context)*0.03)
              ), 
              child: Column(
                children: [
                  SizedBox(height: height(context)*0.02,),
                  Text(selectedDate.toString(),style: TextStyle(fontSize: width(context)*0.06,fontWeight: FontWeight.w400),),
                  const Text('hijry',style: TextStyle(color: Colors.black54),),
                  SizedBox(height: height(context)*0.01,),
                  Text("${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",style: TextStyle(fontSize: width(context)*0.06,fontWeight: FontWeight.w400),),
                  const Text('Gregory'),
                ],
              ),
            )
           ],),
              containerTitle(context,'Bomdod',widget.azanModel.data.timings.Fajr,Colors.black26),
              containerTitle(context,'Tong',widget.azanModel.data.timings.Sunrise,Colors.black26),
              containerTitle(context,'Peshin',widget.azanModel.data.timings.Dhuhr,Colors.black12),
              containerTitle(context,'Asr',widget.azanModel.data.timings.Asr,Colors.black26),
              containerTitle(context,'shom',widget.azanModel.data.timings.Maghrib,Colors.black54),
              containerTitle(context,'Hufton',widget.azanModel.data.timings.Isha,Colors.black)
        ],),
      ),
    );
  }

  containerTitle(context,title,time,color){
    return Column(
      children: [
        SizedBox(height: height(context)*0.01,),
        Container(
              padding: EdgeInsets.symmetric(horizontal: width(context)*0.024),
              height: height(context)*0.08,
              width: width(context),
              decoration: BoxDecoration(
              color:const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(height(context)*0.02)
              ), 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: height(context)*0.09,
                    width:height(context)*0.09,
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(height(context)),
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(color, BlendMode.color),
                        image: const AssetImage('assets/images/tabiat.png')) 
                    ) ),
                  Padding(
                    padding:  EdgeInsets.only(right: width(context)*0.26),
                    child: Text(title,style: const TextStyle(fontSize: 18)),
                  ),
                  SizedBox(height: height(context)*0.01,),
                  Text(time,style: TextStyle(fontSize: width(context)*0.06,fontWeight: FontWeight.w400),),
                ],
              ),
            ),
      ],
    );
  }
}