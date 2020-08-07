import 'package:app1/hostelsextended.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: Column(
          children: <Widget>[Listvi()],
        ),
      ),
    );
  }
}

class Listvi extends StatefulWidget {
  static var tag;

  @override
  _ListviState createState() => _ListviState();
}

class _ListviState extends State<Listvi> {
  String mainProfilePicture = 'assets/images/e.jpeg';
  String otherProfilePicture = 'assets/images/collins.jpg';
  String othersProfilePicture = 'assets/images/3.png';

  void switchUser() {
    String backupString = mainProfilePicture;
    this.setState(() {
      mainProfilePicture = otherProfilePicture;
      otherProfilePicture = othersProfilePicture; //switch profile pics
      othersProfilePicture = backupString;
    });
  }

  Future<Null> refreshList() async {
    await Future.delayed(Duration(
        seconds: 3)); // inorder for the refresh indicator to take 3 seconds
    setState(() {});
    return null;
  }

  var index;

  List<String> images = [
    'assets/images/e.jpeg',
    'assets/images/df.jpeg',
    'assets/images/d.png',
    'assets/images/collins.jpg',
    'assets/images/f.jpg',
    'assets/images/g.jpg',
    'assets/images/index.png',
    'assets/images/k.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Hostels Manager'),
              accountEmail: Text('collinsbigomba8@gmail.com'),
              decoration: BoxDecoration(color: Colors.deepOrange),
              currentAccountPicture: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  radius: 90,
                  backgroundImage: AssetImage(mainProfilePicture),
                ),
              ),
              otherAccountsPictures: <Widget>[
                GestureDetector(
                  onTap: () => switchUser(),
                  child: CircleAvatar(
                    radius: 90,
                    backgroundImage: AssetImage(otherProfilePicture),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 90,
                    backgroundImage: AssetImage(otherProfilePicture),
                  ),
                ),
              ],
            ),
            ListTile(
              title: Text('Prices'),
              trailing: Icon(Icons.monetization_on),
              onTap: () {},
            ),
            ListTile(
              title: Text('Account'),
              trailing: Icon(Icons.account_balance),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              title: Text('Close'),
              trailing: Icon(Icons.cancel),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      appBar: GradientAppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColorStart: Color(0xFFF47015), //appbar color
        backgroundColorEnd: Color(0xFFEF7727C),
        elevation: 0,
        title: Text('Available Hostels'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            child: TextField(
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green)),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  suffixIcon: Icon(
                    Icons.filter_list,
                    color: Colors.lightGreen,
                  ),
                  hintText: "search",
                  focusColor: Colors.green),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              color: Colors.grey[200],
              child: LiquidPullToRefresh(
                color: Colors.orange[200],
                height: 100,
                onRefresh: refreshList,
                child: Scrollbar(
                  child: ListView(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(Icons.favorite_border),
                                  onPressed: (){
                                    
                                  }),
                              Container(
                                  child: Container(
                                width: 90,
                                height: 90,
                                child: GestureDetector(
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/images/d.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HostelsExtended(index)));
                                  },
                                ),
                              )),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Bbossar',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      '450000',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.orange),
                                    ),
                                    SizedBox(height: 5),
                                    Icon(
                                      Icons.people,
                                      size: 12,
                                      color: Colors.orange,
                                    ),
                                    Text(
                                      "1 bathroom, 1 kithcen, 1 bedroom",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.orange),
                                    )
                                  ],
                                ),
                              ),
                              IconButton(
                                  icon: Icon(Icons.navigation),
                                  onPressed: null),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(Icons.favorite_border),
                                  onPressed: null),
                              Container(
                                  child: Container(
                                width: 90,
                                height: 90,
                                child: GestureDetector(
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/images/index2.jpeg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HostelsExtended(index)));
                                  },
                                ),
                              )),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Katonga',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      '350000',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.orange),
                                    ),
                                    SizedBox(height: 5),
                                    Icon(
                                      Icons.explore,
                                      size: 12,
                                      color: Colors.orange,
                                    ),
                                    Text(
                                      "2 bathrooms, 1 kithcen, 1 bedroom",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.orange),
                                    )
                                  ],
                                ),
                              ),
                              IconButton(
                                  icon: Icon(Icons.navigation),
                                  onPressed: null),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(Icons.favorite_border),
                                  onPressed: null),
                              Container(
                                  child: Container(
                                width: 90,
                                height: 90,
                                child: GestureDetector(
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/images/3.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HostelsExtended(index)));
                                  },
                                ),
                              )),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Onyango',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      '454000',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.orange),
                                    ),
                                    SizedBox(height: 5),
                                    Icon(
                                      Icons.people,
                                      size: 12,
                                      color: Colors.orange,
                                    ),
                                    Text(
                                      "1 bathrooms, 2 kithcens",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.orange),
                                    )
                                  ],
                                ),
                              ),
                              IconButton(
                                  icon: Icon(Icons.navigation),
                                  onPressed: null),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(Icons.favorite_border),
                                  onPressed: null),
                              Container(
                                  child: Container(
                                width: 90,
                                height: 90,
                                child: GestureDetector(
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/images/h.jpeg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HostelsExtended(index)));
                                  },
                                ),
                              )),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Kavuma',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      '450000',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.orange),
                                    ),
                                    SizedBox(height: 5),
                                    Icon(
                                      Icons.explore,
                                      size: 12,
                                      color: Colors.orange,
                                    ),
                                    Text(
                                      "1 bathroom, 1 kithcen",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.orange),
                                    )
                                  ],
                                ),
                              ),
                              IconButton(
                                  icon: Icon(Icons.navigation),
                                  onPressed: null),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(Icons.favorite_border),
                                  onPressed: null),
                              Container(
                                  child: Container(
                                width: 90,
                                height: 90,
                                child: GestureDetector(
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/images/d.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HostelsExtended(index)));
                                  },
                                ),
                              )),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Half London',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      '450000',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.orange),
                                    ),
                                    SizedBox(height: 5),
                                    Icon(
                                      Icons.explore,
                                      size: 12,
                                      color: Colors.orange,
                                    ),
                                    Text(
                                      "2 bathrooms, 2 kithcens",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.orange),
                                    )
                                  ],
                                ),
                              ),
                              IconButton(
                                  icon: Icon(Icons.navigation),
                                  onPressed: null),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(Icons.favorite_border),
                                  onPressed: null),
                              Container(
                                  child: Container(
                                width: 90,
                                height: 90,
                                child: GestureDetector(
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/images/e.jpeg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HostelsExtended(index)));
                                  },
                                ),
                              )),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Haflet',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      '450000',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.orange),
                                    ),
                                    SizedBox(height: 5),
                                    Icon(
                                      Icons.explore,
                                      size: 12,
                                      color: Colors.orange,
                                    ),
                                    Text(
                                      "2 bathrooms, 1 kithcen",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.orange),
                                    )
                                  ],
                                ),
                              ),
                              IconButton(
                                  icon: Icon(Icons.navigation),
                                  onPressed: null),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(Icons.favorite_border),
                                  onPressed: null),
                              Container(
                                  child: Container(
                                width: 90,
                                height: 90,
                                child: GestureDetector(
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/images/df.jpeg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HostelsExtended(index)));
                                  },
                                ),
                              )),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Muggaga',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      '450000',
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.orange),
                                    ),
                                    SizedBox(height: 5),
                                    Icon(
                                      Icons.explore,
                                      size: 12,
                                      color: Colors.orange,
                                    ),
                                    Text(
                                      "2 bathrooms, 1 kithcen",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.orange),
                                    )
                                  ],
                                ),
                              ),
                              IconButton(
                                  icon: Icon(Icons.navigation),
                                  onPressed: null),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
