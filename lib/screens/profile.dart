import 'package:adhicine/constants.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.chevron_left,size: 36,color: Colors.black,), onPressed: () { Navigator.pop(context); },
          ),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 12),
          physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 52,
                      backgroundColor: kPrimary,
                      backgroundImage: AssetImage('assets/images/p1.jpg'),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 12,
                        child: Icon(Icons.photo_camera,color: kPrimary,size: 12,),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Take care!',style: TextStyle(fontSize: 16),),
                        Text('Richa Bose',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Divider(
                height: 2,
                color: Colors.black45,
              ),
            ),
            Text('Settings',style: headingstyle,textAlign: TextAlign.left,),
            SettingsItem(label: 'Notification', desc: 'Check your medicine notification', ico: LineIcons.bell),
            SettingsItem(label: 'Sound', desc: 'Ring, Silent, Vibrate', ico: LineIcons.volumeUp),
            SettingsItem(label: 'Manage your account', desc: 'Password, EmailId, Phone number', ico: Icons.person_outline_rounded),
            SettingsItem(label: 'Notification', desc: 'Check your medicine notification', ico: LineIcons.bell),
            SettingsItem(label: 'Notification', desc: 'Check your medicine notification', ico: LineIcons.bell),
            //Add more
            Text('Device',style: headingstyle,textAlign: TextAlign.left,),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: kAccent.withOpacity(0.60),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 6,horizontal: 8),
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const SettingsItem(label: 'Connect',desc: 'Bluetooth,Wifi',ico: LineIcons.volumeUp,),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 6,horizontal: 8),
                    decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white
                    ),
                    child: const SettingsItem(label: 'Sound Option',desc: 'Ring, Silent, Vibrate',ico: LineIcons.volumeUp,),
                  ),
                ],
              ),
            ),
            Text('Caretakers : 03',style: headingstyle,textAlign: TextAlign.left,),
            Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: kAccent.withOpacity(0.60),
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(child: CaretakerItem(name: 'Rod Souzonbolt', photo: 'assets/images/p1.jpg')),
                    Expanded(child: CaretakerItem(name: 'Dupa Lina', photo: 'assets/images/p1.jpg')),
                    Expanded(child: CaretakerItem(name: 'Emilia Rodriguez', photo: 'assets/images/p1.jpg')),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: kGrey,
                              child: Icon(Icons.add,color: Colors.grey.shade700,),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text('Add'),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Text('Doctor',style: headingstyle,textAlign: TextAlign.left,),
            Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: kAccent.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: kPrimary,
                        child: Icon(Icons.add,color: Colors.white,),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Add your doctor',style: TextStyle(fontSize: 20),),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: RichText(text: TextSpan(
                        text: 'Or use',
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: ' invite link',
                            style: TextStyle(color: Colors.orange.shade400)
                          )
                        ]
                      )),
                    )
                  ],
                ),
              ),
            ),
            EndElement(label: 'Privacy Policy'),
            EndElement(label: 'Terms of Use'),
            EndElement(label: 'Rate Us'),
            EndElement(label: 'Share'),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
margin: EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: kAccent,
                  width: 1,
                )
              ),
              child: Center(child: Text('Log out',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
            )
          ],
        ),
      ),
    );
  }
}

TextStyle headingstyle = TextStyle(fontSize: 18,fontWeight: FontWeight.bold);

class EndElement extends StatelessWidget {
  const EndElement({Key? key,required this.label}) : super(key: key);
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 16),
      child: Text(label,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
    );
  }
}


class SettingsItem extends StatelessWidget {
  const SettingsItem({Key? key,required this.label,required this.desc,required this.ico}) : super(key: key);
  final IconData ico;
  final String label;
  final String desc;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16,horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(ico,color: Colors.grey,size: 36,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,style: TextStyle(fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:4),
                  child: Text(desc,style: TextStyle(fontSize: 14,color: Colors.grey),),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CaretakerItem extends StatelessWidget {
  const CaretakerItem({Key? key,required this.name,required this.photo}) : super(key: key);
  final String name;
  final String photo;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5,vertical: 2),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: kPrimary,
            backgroundImage: AssetImage(photo),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(name,overflow: TextOverflow.ellipsis,),
          )
        ],
      ),
    );
  }
}

