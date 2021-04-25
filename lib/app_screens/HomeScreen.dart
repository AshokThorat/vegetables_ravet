import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fragment_navigate/navigate-bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegetables_ravet/fragments/ContactUsFrag.dart';
import 'package:vegetables_ravet/fragments/HomeFrag.dart';
import 'package:vegetables_ravet/fragments/OrderFrag.dart';


class HomeScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vegetables',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Main(),
    );
  }
}
SharedPreferences preferences;
String name;
String mobile;
final String a = 'Home';
final String b = 'Order';
final String c = 'Contact';
final String d = 'Logout';

class Main extends StatelessWidget {

  Main()
  {
    mySharePreference();
  }
  static BuildContext context;

  static final FragNavigate _fragNav = FragNavigate(
      firstKey: a,
      drawerContext: null,
      screens: <Posit>[
        Posit(
            key: a,
            title: 'Home',
            icon: Icons.home,
            fragment: HomeFrag(),
        ),
        Posit(
            key: b,
            title: 'My Order',
            drawerTitle: 'My Order',
            icon: Icons.shopping_basket,
            fragment: OrderFrag()
        ),
        Posit(
            key: c,
            title: 'Contact Us',
            icon: Icons.phone,
            fragment:ContactUsFrag(),
        ),
        Posit(
            key: d,
            title: 'Logout',
            icon: Icons.power_settings_new,
            fragment: Text('qqqq')
        ),
      ],


  );
 static Future mySharePreference() async {
    preferences = await SharedPreferences.getInstance();
      name = preferences.getString('name');
      mobile = preferences.getString('mobile');

  }

  @override
  Widget build(BuildContext context) {
    _fragNav.setDrawerContext = context;


    return StreamBuilder<FullPosit>(
        stream: _fragNav.outStreamFragment,
        builder: (con, s){
          if(s.data != null){
            return DefaultTabController(
                length: s.data.bottom.length,
                child: Scaffold(
                  key: _fragNav.drawerKey,
                  appBar: AppBar(
                    title: Text(s.data.title),
                    actions: s.data.actions,
                    bottom: s.data.bottom.child,
                  ),
                  drawer: CustomDrawer(fragNav: _fragNav),
                  body: ScreenNavigate(
                      child: s.data.fragment,
                      bloc: _fragNav
                  ),
                )
            );
          }

          return Container();
        }
    );
  }

}



class CustomDrawer extends StatelessWidget {



  final FragNavigate fragNav;
  const CustomDrawer({@required this.fragNav});

  Widget _getItem({@required String currentSelect, @required text, @required key, @required icon}){
    Color _getColor() => currentSelect == key ? Colors.white : Colors.black87;

    return Material(
        color: currentSelect == key ? Colors.blueAccent : Colors.transparent,
        child: ListTile(
          leading: Icon(icon, color: currentSelect == key ? Colors.white : null),
          selected: currentSelect == key,
          title: Text(text, style: TextStyle(color: _getColor())),
          onTap: () {
            fragNav.putPosit(key: key);
            if(currentSelect==key)
              {
                fragNav.jumpBack();
              }

          },
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(
        children: <Widget>[
          DrawerHeader(

            child: Row(
              children: [
                Column(
                  children: [
                    ClipOval(child: Image(image: AssetImage('images/logo.jpeg'),width: 100,height: 100,)),
                    Padding(
                      padding: const EdgeInsets.only(top:2.0),
                      child: Text(name??'',style: TextStyle(color: Colors.white)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:2.0),
                      child: Text(mobile??'',style: TextStyle(color: Colors.white),),
                    ),
                  ],
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
            ),
          ),
          for(Posit item in fragNav.screenList.values) _getItem(
              currentSelect: fragNav.currentKey,
              text: item.drawerTitle ?? item.title,
              key: item.key,
              icon: item.icon
          )
        ],
      ),
    );
  }
}
/*

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vegetables_ravet/app_screens/LoginScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomeScreen> {
  SharedPreferences preferences;
  String name;
  String mobile;

  @override
  void initState() {
    mySharePreference().whenComplete(() => null);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('abc'),),
      body: Column(children: [Text("abc")],),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF3366FF),
                      const Color(0xFF00CCFF),
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          ClipOval(
                            child: Image(
                              image: AssetImage('images/logo.jpeg'),
                              width: 100,
                              height: 100,
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 8, right: 8, top: 2),
                            child: Text(
                              name ?? '',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 8, right: 8, top: 2),
                            child: Text(
                              mobile ?? '',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.shopping_basket),
                title: Text(
                  'My Order',
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text(
                  'Contact Us',
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.power_settings_new),
                title: Text(
                  'Logout',
                ),
                onTap: () {
                  preferences.clear();

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                          (route) => false);
                },
              ),
            ],
          ),
        )


    );

  }

  Future mySharePreference() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      name = preferences.getString('name');
      mobile = preferences.getString('mobile');
    });
  }
}
*/
