import 'package:flutter/material.dart';
import 'package:adhicine/constants.dart';
import 'package:line_icons/line_icons.dart';

import '../components/medcard.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget heading(String label)
    {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(label,style: headingstyle,),
          ],
        ),
      );
    }
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Report',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28),),
            ],
          ),
          ReportCard(),
          DashCard(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Check History',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
              Icon(Icons.chevron_right,color: kPrimary,)
            ],
          ),
          DateSel(),
          heading('Morning 08:00 AM'),
          const MedCard(iconcolor: kPeach, label: 'Calpol 500mg Tablet', stat: kIconGreen, daycnt: 'Day 01', freq: 'Before Breakfast', statval: 'Taken', icon: LineIcons.circle),
          MedCard(iconcolor: Colors.blue.shade200, label: 'Calpol 500mg Tablet', stat: kErrorRed, daycnt: 'Day 27', freq: 'Before Breakfast', statval: 'Missed', icon: LineIcons.pills),
          heading('Afternoon 02:00 PM'),
          const MedCard(iconcolor: kLavender, label: 'Calpol 500mg Tablet', stat: Colors.orange, daycnt: 'Day 01', freq: 'After food', statval: 'Snoozed', icon: LineIcons.water),
          heading('Night 9:00 PM'),
          const MedCard(iconcolor: kPeach, label: 'Calpol 500mg Tablet', stat: Colors.grey, daycnt: 'Day 01', freq: 'After food', statval: 'Left', icon: LineIcons.syringe),
        ],
      ),
    );
  }
}

class ReportCard extends StatelessWidget {
  const ReportCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: Offset(0, 1),
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6
        ),
        BoxShadow(
            offset: Offset(0, -1), color: Colors.black.withOpacity(0.1),
            blurRadius: 6
        )
      ], borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 16),
            child: Text('Today\'s Report',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            margin: EdgeInsets.symmetric(vertical: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ReportItem(cnt: 5, label: 'Total'),
                ReportItem(cnt: 3, label: 'Taken'),
                ReportItem(cnt: 2, label: 'Missed'),
                ReportItem(cnt: 1, label: 'Snoozed')
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DashCard extends StatelessWidget {
  const DashCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height*0.1
      ),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: Offset(0, 1),
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6
        ),
        BoxShadow(
            offset: Offset(0, -1), color: Colors.black.withOpacity(0.1),
            blurRadius: 6
        )
      ], borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex:2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Check Dashboard',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                Text(
                  'Here you will find everything related to your past active medicines',style: TextStyle(fontSize: 14),)
              ],
            ),
          ),
          Expanded(child: Image.asset('assets/images/7.png'),
          )
        ],
      ),
    );
  }
}


class ReportItem extends StatelessWidget {
  const ReportItem({Key? key, required this.cnt, required this.label})
      : super(key: key);
  final int cnt;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(cnt.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: kPrimary,fontSize: 28),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(label,style: TextStyle(color: Colors.grey.shade500),),
          ),
        ],
      ),
    );
  }
}

class DateSel extends StatefulWidget {
  const DateSel({Key? key}) : super(key: key);

  @override
  State<DateSel> createState() => _DateSelState();
}

class _DateSelState extends State<DateSel> {
  List<String>days=['SUN','MON','TUE','WED','THU','FRI','SAT'];
  int curr=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: MediaQuery.of(context).size.height*0.06,
      child: Center(child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (ctx,i){
          return GestureDetector(
            onTap: (){
              setState(() {
                curr=i;
              });
            },
            child: DateSelItem(date: (i+1).toString(),day: days[i%(days.length)],sel: curr==i,),);
        },
      ),),);
  }
}

class DateSelItem extends StatelessWidget {
  const DateSelItem({Key? key,required this.date,required this.day,required this.sel}) : super(key: key);
  final String day;
  final bool sel;
  final String date;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Text(day),
          CircleAvatar(
            backgroundColor: sel?kPrimary:kGrey,
            child: Text(date,style: TextStyle(color:sel?Colors.white:kPrimary ),),
          )
        ],
      ),
    );
  }
}

TextStyle headingstyle = TextStyle(fontSize: 20,fontWeight: FontWeight.w500);