import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, dynamic>> tabBarNav = [
    {'title': Text('photo'), 'icon': Icon(Icons.home)},
    {'title': Text('chats'), 'icon': Icon(Icons.chat)},
    {'title': Text('albums'), 'icon': Icon(Icons.album)},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Text('telo'),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              DrawerHeader(
                  child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 65,
                    backgroundColor: Colors.orange,
                    backgroundImage:
                        NetworkImage('https://picsum.photos/200/300'),
                  )
                ],
              )),
              ListTile(
                title: Text('home'),
                leading: Icon(Icons.home),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  print('TAP');
                },
                onLongPress: () {
                  print('LONG PRESSED');
                },
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: tabBarNav
                .map(
                  (item) => BottomNavigationBarItem(
                      icon: item['icon'], label: item['title']),
                )
                .toList()),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.orange,
          child: Icon(Icons.plus_one),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked);
  }
}
