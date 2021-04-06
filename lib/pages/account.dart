import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:unotest/pages/login.dart';
import 'package:unotest/pages/manage_address.dart';

class Account extends StatefulWidget {

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  @override
  _AccountState createState() => _AccountState();
}

class NamedIcon extends StatelessWidget {
  final IconData iconData;
  final String text;
  final VoidCallback onTap;
  final int notificationCount;
  const NamedIcon({
    Key key,
    this.onTap,
    @required this.text,
    @required this.iconData,
    this.notificationCount,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 72,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(iconData),
                Text(text, overflow: TextOverflow.ellipsis),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.transparent),
                alignment: Alignment.center,
                child: Text('$notificationCount'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _AccountState extends State<Account> {
  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    //final Size size = MediaQuery.of(context).size;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar:
      AppBar(
          backgroundColor: Color(0xff8e3c00),
          elevation: 0,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Guest Details',
              textAlign: TextAlign.end,
              style: TextStyle(fontWeight: FontWeight.bold)),
          actions: <Widget>[
            NamedIcon(
              text: '',
              iconData: Icons.shopping_bag_outlined,
              notificationCount: 0,
              onTap: () {},
            ),
          ]),

      body:
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      SafeArea(
        child: Center(
          child: Column(

            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Container(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Elijah Michealson',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text('EDIT',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff8e3c00),
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(padding: EdgeInsets.only(left: 10.0),
                            child:
                            Text('7020026532',style:
                            TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            )),
                          ),
                          Container(padding: EdgeInsets.only(right: 10.0),
                            child:
                            Text('h.mishra2feb01@gmail.com',style:
                            TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            )),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.025),
              Divider(
                height: 20.0,
                color: Colors.grey,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.025),
              Flexible(
                child: ListView(
                  children: [
                    Card(
                        color: Colors.transparent,
                        elevation: 0,
                        child: ListTile(
                          leading:Icon(MdiIcons.mapMarkerRadiusOutline,color: Colors.white),
                          onTap:(){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => manageAddress()));
                          },
                          title: Text('Manage Address',style: TextStyle(color: Colors.white),),
                          trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.white),
                        )
                    ),
                    Card(
                        elevation: 0,
                        color: Colors.transparent,
                        child: ListTile(
                          leading:Icon(MdiIcons.walletPlusOutline,color: Colors.white),
                          onTap:(){

                          },
                          title: Text('My Wallet',style: TextStyle(color: Colors.white),),
                          trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.white),
                        )
                    ),
                    Card(
                        elevation: 0,
                        color: Colors.transparent,
                        child: ListTile(
                          leading:Icon(MdiIcons.phoneInTalkOutline,color: Colors.white),
                          onTap:(){},
                          title: Text('Contact Us',style: TextStyle(color: Colors.white),),
                          trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.white),
                        )
                    ),
                    Card(
                        elevation: 0,
                        color: Colors.transparent,
                        child: ListTile(
                          leading:Icon(MdiIcons.shareVariantOutline,color: Colors.white),
                          onTap:(){},
                          title: Text('Share App',style: TextStyle(color: Colors.white),),
                          trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.white),
                        )
                    ),
                    Card(
                        elevation: 0,
                        color: Colors.transparent,
                        child: ListTile(
                          leading:Icon(MdiIcons.thumbUpOutline,color: Colors.white),
                          onTap:(){},
                          title: Text('Feedback',style: TextStyle(color: Colors.white),),
                          trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.white),
                        )
                    ),
                    Card(
                        elevation: 0,
                        color: Colors.transparent,
                        child: ListTile(
                          leading:Icon(MdiIcons.logout,color: Colors.white),
                          onTap:(){
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginWidget()),
                                  (Route<dynamic> route) => false,
                            );
                          },
                          title: Text('Logout',style: TextStyle(color: Colors.white),),
                          trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.white),
                        )
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}