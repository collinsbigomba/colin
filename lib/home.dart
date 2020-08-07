import 'package:app1/signin_signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ThemeData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dem(),
    );
  }
}

class Dem extends StatefulWidget {
  static var tag;
  @override
  _DemState createState() => _DemState();
}

class _DemState extends State<Dem> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text(
            'Home',
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    Navigator.of(context).pushReplacementNamed('/Boom');
                  }).catchError((e) {
                    print(e);
                  });
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Boom()));
                })
          ],
          bottom: TabBar(unselectedLabelColor: Colors.grey, tabs: <Widget>[
            Text(
              "Info",
              style: TextStyle(fontSize: 15),
            ),
            Text(
              "Campus News",
              style: TextStyle(fontSize: 15),
            ),
          ]),
        ),
        body: TabBarView(children: <Widget>[
          First(),
          Second(),
        ]),
      ),

      /* body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(actions: <Widget>[
            IconButton(icon: Icon(Icons.close), onPressed: (){
              FirebaseAuth.instance.signOut().then((value){
                Navigator.of(context).pushReplacementNamed('/Boom');
              }).catchError((e){
                print(e);
              });
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Boom()) );
            })
          ],
            floating: true,
           // leading: Icon(Icons.arrow_back),
            //centerTitle: true,
            title: Text('Which Campus would you' '\n' 'wanna join'),
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/collins.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFixedExtentList(delegate: SliverChildBuilderDelegate((context, index) {
            return Container(
              //height: MediaQuery.of(context).size.height,
              //width: MediaQuery.of(context).size.width,
              width: 300,
              height: 300,
              child: Column(children: <Widget>[
                
                SizedBox(height: 10,),
                Stack(
                  children: <Widget>[
                     Image.asset('assets/images/j.jpeg',fit: BoxFit.cover,),
                    Positioned(
                      bottom: 16,
                      left: 16,
                      child: Text('Welcome to nkozi, a place of Excellency',style: TextStyle(color: Colors.black,),),
                    ),
                    
                    
                  ],
                ),

              ],),
            );
          }
          ), itemExtent: 200,
          ),
        ],*/
    );
  }
}

class First extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10)),
          child: TextField(
            decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                fillColor: Colors.grey.withOpacity(0.6),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                )),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Text('Recommended'),
        ),
        SizedBox(
          height: 10,
        ),
        
      ],
    );
  }
}

class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(children: [
        Text('ta'),
      ]),
    );
  }
}
