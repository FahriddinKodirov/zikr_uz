import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:zikr_uz/screen/muslim/bloc/azan_bloc.dart';
import 'package:zikr_uz/screen/muslim/bloc/azan_event.dart';
import 'package:zikr_uz/screen/muslim/widget/muslim_widget.dart';
import 'package:zikr_uz/utils/my_utils.dart';



class MuslimMain extends StatefulWidget {
  const MuslimMain({super.key});

  @override
  State<MuslimMain> createState() => _MuslimMainState();
}

class _MuslimMainState extends State<MuslimMain> {
  var selectedDate =  HijriCalendar.now();

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD4D5D7),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: height(context)*0.025),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height(context)*0.05,),
            Center(child: Icon(FlutterIslamicIcons.islam,size: height(context)*0.13,)),
            SizedBox(height: height(context)*0.014,),
            const Text('Tashkent',style: TextStyle(fontSize: 28,fontWeight: FontWeight.w600),),
            Text(selectedDate.fullDate(),style: const TextStyle(fontSize: 20),),
            SizedBox(height: height(context)*0.014,),
            const MuslimWidget(),
            SizedBox(
              height: height(context)*0.55,
              width: width(context),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: listCategoryImage.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: height(context)*0.0270,
                  crossAxisSpacing: height(context)*0.027,
                  mainAxisExtent: height(context)*0.24
                  ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>  listCategory[index]));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color:const Color(0xFF65737E).withOpacity(0.2),
                           boxShadow: const [
                            BoxShadow(
                              color: Color(0xFF4F5B66),
                              offset: Offset(1, 1),
                              blurRadius: 10,
                              spreadRadius: 1,
                              blurStyle: BlurStyle.solid
                            )
                           ],
                           border: Border.all(color: Colors.grey.withOpacity(0.9)),
                         borderRadius: BorderRadius.circular(height(context)*0.028),
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: height(context)*0.19,
                            width: width(context)*0.6,
                            decoration: BoxDecoration(
                              color: const Color(0xFF65737E),
                              image: DecorationImage(
                                colorFilter: ColorFilter.mode(const Color(0xFFD4D5D7).withOpacity(0.8), BlendMode.darken),
                                image: AssetImage(listCategoryImage[index])),
                              borderRadius: BorderRadius.only(topRight: Radius.circular(height(context)*0.028),
                              topLeft: Radius.circular(height(context)*0.028))
                            ),
                            ),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                             children: [
                               Text(listTitle[index],style: TextStyle(fontSize: 25,color: Colors.white70),),
                               Icon(listIcon[index],color: Colors.white70)
                             ],
                           )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}







