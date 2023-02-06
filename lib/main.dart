import 'dart:async';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

import 'package:adhicine/screens/add.dart';
import 'package:adhicine/screens/home.dart';
import 'package:adhicine/screens/login.dart';
import 'package:adhicine/screens/reports.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: const LoginScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currindex = 0;
  Map _source = {ConnectivityResult.none: false};
  final MyConnectivity _connectivity = MyConnectivity.instance;
  bool flag=false;

  @override
  void initState() {
    super.initState();
    _connectivity.initialise();
    _connectivity.myStream.listen((source) {
       _source = source;
       if(_source.keys.toList()[0]==ConnectivityResult.none)
         {
           setState(() {
             flag=true;
           });
         }else{
         setState(() {
           flag=false;
         });
       }
    });
  }

  @override
  void dispose() {
    _connectivity.disposeStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: kOffBlack,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (ctx)=>const AddMedicine()));
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ), //icon inside button
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: BottomNavigationBar(
            selectedLabelStyle: TextStyle(color: kPrimary),
            selectedFontSize: 12,

            currentIndex: currindex,
            onTap: (val) {
              setState(() {
                currindex = val;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 32,
                    color: currindex == 0 ? kPrimary : kAccent,
                  ),
                  label: 'Home',

              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.signal_cellular_alt,
                    size: 32,
                    color: currindex == 1 ? kPrimary : kAccent,
                  ),
                  label: 'Report')
            ],
          ),
        ),
        body: Center(
          child: currindex==0?HomePage(stat: flag,):ReportsPage(),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

class MyConnectivity {
  MyConnectivity._();

  static final _instance = MyConnectivity._();
  static MyConnectivity get instance => _instance;
  final _connectivity = Connectivity();
  final _controller = StreamController.broadcast();
  Stream get myStream => _controller.stream;

  void initialise() async {
    ConnectivityResult result = await _connectivity.checkConnectivity();
    _checkStatus(result);
    _connectivity.onConnectivityChanged.listen((result) {
      _checkStatus(result);
    });
  }

  void _checkStatus(ConnectivityResult result) async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('example.com');
      isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isOnline = false;
    }
    _controller.sink.add({result: isOnline});
  }

  void disposeStream() => _controller.close();
}