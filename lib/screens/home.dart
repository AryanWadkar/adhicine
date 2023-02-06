import 'package:adhicine/components/medcard.dart';
import 'package:adhicine/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:adhicine/constants.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key,required this.stat}) : super(key: key);
  final bool stat;
  @override
  Widget build(BuildContext context) {
    TextStyle headingstyle =
        TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
    Widget heading(String label) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              label,
              style: headingstyle,
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi Harry!',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        '5 Medicines Left',
                        style: TextStyle(letterSpacing: 1.8, fontSize: 14),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Icon(
                        LineIcons.firstAid,
                        color: kPrimary,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (ctx) => ProfilePage()));
                      },
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: kPrimary,
                        backgroundImage: AssetImage('assets/images/p1.jpg'),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Text('Internet connection : $stat'
          ),
          HDatePicker(),
          heading('Morning 08:00 AM'),
          const MedCard(
              iconcolor: kPeach,
              label: 'Calpol 500mg Tablet',
              stat: kIconGreen,
              daycnt: 'Day 01',
              freq: 'Before Breakfast',
              statval: 'Taken',
              icon: LineIcons.circle),
          MedCard(
              iconcolor: Colors.blue.shade200,
              label: 'Calpol 500mg Tablet',
              stat: kErrorRed,
              daycnt: 'Day 27',
              freq: 'Before Breakfast',
              statval: 'Missed',
              icon: LineIcons.pills),
          heading('Afternoon 02:00 PM'),
          const MedCard(
              iconcolor: kLavender,
              label: 'Calpol 500mg Tablet',
              stat: Colors.orange,
              daycnt: 'Day 01',
              freq: 'After food',
              statval: 'Snoozed',
              icon: LineIcons.water),
          heading('Night 9:00 PM'),
          const MedCard(
              iconcolor: kPeach,
              label: 'Calpol 500mg Tablet',
              stat: Colors.grey,
              daycnt: 'Day 01',
              freq: 'After food',
              statval: 'Left',
              icon: LineIcons.syringe),
        ],
      ),
    );
  }
}

class HDatePicker extends StatefulWidget {
  const HDatePicker({Key? key}) : super(key: key);

  @override
  State<HDatePicker> createState() => _HDatePickerState();
}

class _HDatePickerState extends State<HDatePicker> {
  List<String> days = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
  int currday = 6;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                days[(currday < 2 ? -1*currday - 2 : currday - 2) % 7],overflow: TextOverflow.fade,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                days[(currday < 1 ? -1*currday : currday - 1) % 7],overflow: TextOverflow.fade,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          ),
          Expanded(
            child: IconButton(
              icon: Icon(
                Icons.chevron_left,
                color: kIconGreen,
              ),
              onPressed: () {
                setState(() {
                  if (currday > 1) {
                    currday--;
                  }
                });
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: kDarkGreen,
              ),
              child: Text(
                '${days[currday % 7]}, FEB $currday',textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: IconButton(
              icon: Icon(
                Icons.chevron_right,
                color: kIconGreen,
              ),
              onPressed: () {
                setState(() {
                  if (currday <28) {
                    currday++;
                  }
                });
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                days[(currday + 1) % 7],overflow: TextOverflow.fade,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                days[(currday + 2) % 7],overflow: TextOverflow.fade,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          )
        ],
      ),
    );
  }
}
