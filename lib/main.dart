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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final List<Map<String, dynamic>> tabBarNav = [
    {'title': 'photo', 'icon': Icon(Icons.home)},
    {'title': 'chats', 'icon': Icon(Icons.chat)},
    {'title': 'albums', 'icon': Icon(Icons.album)},
  ];

  TabController _tabController;
  int _currentTabIndex = 0;
  bool _isPaid = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: tabBarNav.length,
      vsync: this,
      initialIndex: 0,
    );
    _tabController.addListener(_tabListener);
  }

  _tabListener() {
    setState(() {
      _currentTabIndex = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(widget.title),
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.home),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            actions: [
              Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(Icons.person),
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );
                },
              ),
            ]),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Center(
                child: _isPaid ? Text('order was succesfully paid') : null,
              ),
            ),
            Container(
              color: Colors.purple,
            ),
            Container(
              color: Colors.grey,
            )
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [
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
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {
                  print('TAP');
                },
                onLongPress: () {
                  print('LONG PRESSED');
                },
              ),
              ListTile(
                title: Text('profile'),
                leading: Icon(Icons.account_circle),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {
                  print('TAP');
                },
                onLongPress: () {
                  print('LONG PRESSED');
                },
              ),
              ListTile(
                title: Text('images'),
                leading: Icon(Icons.image),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {
                  print('TAP');
                },
                onLongPress: () {
                  print('LONG PRESSED');
                },
              ),
              ListTile(
                title: Text('files'),
                leading: Icon(Icons.file_copy_sharp),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {
                  print('TAP');
                },
                onLongPress: () {
                  print('LONG PRESSED');
                },
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      child: Text('exit'),
                      onPressed: () {},
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("registration"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        endDrawer: Drawer(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage('https://picsum.photos/200/300'),
            ),
            Text(
              'Username',
              style: TextStyle(color: Colors.black, fontSize: 17),
            )
          ],
        )),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (int index) {
              setState(() {
                _tabController.index = index;
                _currentTabIndex = index;
              });
            },
            currentIndex: _currentTabIndex,
            items: tabBarNav
                .map(
                  (item) => BottomNavigationBarItem(
                      icon: item['icon'], label: item['title']),
                )
                .toList()),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 200,
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.payment),
                          title: Text('summary'),
                          trailing: Text('200 usd'),
                        ),
                        ElevatedButton(
                          child: Text('pay'),
                          onPressed: () {
                            setState(() {
                              _isPaid = true;
                            });
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    ),
                  );
                });
          },
          backgroundColor: Colors.blue,
          child: Icon(Icons.account_balance_wallet),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat);
  }
}
