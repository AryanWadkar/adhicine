import 'package:flutter/material.dart';
import 'package:adhicine/constants.dart';
import 'package:line_icons/line_icons.dart';

class AddMedicine extends StatelessWidget {
  const AddMedicine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget heading(String label) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            )
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          leadingWidth: 26,
          leading: IconButton(
            icon: const Icon(
              Icons.chevron_left,
              size: 36,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Add Medicines',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 22),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        suffixIcon: Icon(
                          Icons.mic,
                          color: Colors.grey,
                        ),
                        hintText: 'Search your medicine',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey, width: 2))),
                  ),
                ),
                heading('Compartment'),
                CompartmentSel(),
                heading('Colour'),
                ColourSel(),
                heading('Type'),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      TypeItem(ico: LineIcons.circle, val: 'Tablet'),
                      TypeItem(ico: LineIcons.syringe, val: 'Syringe'),
                      TypeItem(ico: LineIcons.pills, val: 'Pills'),
                      TypeItem(ico: LineIcons.water, val: 'Liquid')
                    ],
                  ),
                ),
                heading('Quantity'),
                QTY(),
                TotalCnt(),
                heading('Set Date'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Expanded(child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 6),
                        padding: EdgeInsets.symmetric(vertical: 6,horizontal: 4),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(6)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Today'),
                            Icon(Icons.chevron_right)
                          ],
                        ),
                      )),
                      Expanded(child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 6),
                        padding: EdgeInsets.symmetric(vertical: 6,horizontal: 4),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(6)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('End Date'),
                            Icon(Icons.chevron_right)
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
                heading('Frequency of days'),
                Container(
                  height: MediaQuery.of(context).size.height*0.05,
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(6)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Everyday'),
                      Icon(Icons.chevron_right)
                    ],
                  ),
                ),
                heading('How many times a day'),
                Container(
                  height: MediaQuery.of(context).size.height*0.05,
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(6)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Three Times'),
                      Icon(Icons.chevron_right)
                    ],
                  ),
                ),
                DoseItem(val: 'Dose 1'),
                DoseItem(val: 'Dose 2'),
                DoseItem(val: 'Dose 3'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(26),
                          color: kAccent
                        ),
                        child: Text('Everyday'),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(26),
                            color: Colors.grey
                        ),
                        child: Text('After food'),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(26),
                            color: Colors.grey
                        ),
                        child: Text('Before sleep'),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: 12,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 12),
                  decoration: BoxDecoration(
                      color: kPrimary, borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                    'ADD',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DoseItem extends StatelessWidget {
  const DoseItem({Key? key,required this.val}) : super(key: key);
  final String val;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          margin: EdgeInsets.symmetric(vertical:10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [Icon(Icons.schedule,color: Colors.grey,),
                SizedBox(
                  width: 10,
                ),
                Text(val,style: TextStyle(color: Colors.grey),)],),
              Icon(Icons.chevron_right,color: Colors.grey,)

            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Divider(thickness: 1,color: Colors.grey,),
        )
      ],
    );
  }
}


class QTY extends StatefulWidget {
  const QTY({Key? key}) : super(key: key);

  @override
  State<QTY> createState() => _QTYState();
}

class _QTYState extends State<QTY> {
  int cnt = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.grey)),
            child: Center(
              child: Text('Take $cnt pill'),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              if (cnt > 1) {
                cnt--;
              }
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: kPrimary,
                )),
            child: Icon(
              Icons.exposure_minus_1,
              color: kPrimary,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              cnt++;
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: kPrimary,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: kPrimary,
                )),
            child: Icon(
              Icons.exposure_plus_1,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class CompartmentSel extends StatefulWidget {
  const CompartmentSel({Key? key}) : super(key: key);

  @override
  State<CompartmentSel> createState() => _CompartmentSelState();
}

class _CompartmentSelState extends State<CompartmentSel> {
  int curr = 1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (ctx, i) {
          return GestureDetector(
              onTap: () {
                setState(() {
                  curr = i + 1;
                });
              },
              child:
                  CompartmentItem(val: (i + 1).toString(), sel: curr == i + 1));
        },
      ),
    );
  }
}

class CompartmentItem extends StatelessWidget {
  const CompartmentItem({Key? key, required this.sel, required this.val})
      : super(key: key);
  final bool sel;
  final String val;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 50,
      margin: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: sel
              ? Border.all(color: kPrimary, width: 2)
              : Border.all(color: Colors.transparent, width: 2),
          color: sel ? kAccent.withOpacity(0.5) : Colors.white),
      child: Center(
        child: Text(
          val,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class ColourSel extends StatefulWidget {
  const ColourSel({Key? key}) : super(key: key);

  @override
  State<ColourSel> createState() => _ColourSelState();
}

class _ColourSelState extends State<ColourSel> {
  List<Color> c = [kSand, kPeach, kLavender, kLime, kLeaf, kGrass];
  int curr = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.10,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (ctx, i) {
          return GestureDetector(
              onTap: () {
                setState(() {
                  curr = i;
                });
              },
              child: ColourItem(val: c[i % 6], sel: curr == i));
        },
      ),
    );
  }
}

class ColourItem extends StatelessWidget {
  const ColourItem({Key? key, required this.val, required this.sel})
      : super(key: key);
  final Color val;
  final bool sel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          border: sel
              ? Border.all(color: kPrimary, width: 3)
              : Border.all(color: Colors.transparent, width: 3),
          shape: BoxShape.circle,
          color: val),
    );
  }
}

class TypeItem extends StatelessWidget {
  const TypeItem({Key? key, required this.ico, required this.val})
      : super(key: key);
  final IconData ico;
  final String val;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Icon(
            ico,
            size: 56,
            color: Colors.pinkAccent.withOpacity(0.25),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              val,
              style: TextStyle(color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}

class TotalCnt extends StatefulWidget {
  const TotalCnt({Key? key}) : super(key: key);

  @override
  State<TotalCnt> createState() => _TotalCntState();
}

class _TotalCntState extends State<TotalCnt> {
  double val = 1;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Count',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(val.toInt().toString())
          ],
        ),
      ),
      Slider(
        max: 100,
        min: 1,
        activeColor: kPrimary,
        inactiveColor: kPrimary.withOpacity(0.4),
        value: val,
        onChanged: (double value) {
          setState(() {
            val = value;
          });
        },
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('01',style: TextStyle(fontSize: 18),), Text('100',style: TextStyle(fontSize: 18),)],
        ),
      )
    ]);
  }
}
