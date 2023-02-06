import 'package:flutter/material.dart';
import 'package:adhicine/constants.dart';
import 'package:line_icons/line_icon.dart';

class MedCard extends StatelessWidget {
  const MedCard(
      {Key? key,
        required this.iconcolor,
        required this.label,
        required this.stat,
        required this.daycnt,
        required this.freq,
        required this.statval,
        required this.icon})
      : super(key: key);
  final Color iconcolor;
  final String label;
  final String freq;
  final String daycnt;
  final Color stat;
  final String statval;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      margin: EdgeInsets.symmetric(vertical: 8),
      width: MediaQuery.of(context).size.width*0.9,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height*0.25
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kGrey,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(color: iconcolor,borderRadius: BorderRadius.circular(6)),
              child: Icon(icon)),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          freq,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          daycnt,
                          textAlign: TextAlign.start,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.notifications_none,
                  color: stat,
                ),
                Text(statval)
              ],
            ),
          )
        ],
      ),
    );
  }
}