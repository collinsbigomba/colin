import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
 
var bannerItems = ['Courses','Staff','Sports','Meals','Entertainment']; 
var bannerImage = [
  'assets/images/b.jpeg',
  'assets/images/c.jpeg',
  'assets/images/f.jpg',
  'assets/images/j.jpeg',
  'assets/images/f.jpeg',
  'assets/images/index.jpeg',
  'assets/images/index.png',
  'assets/images/h.jpg',
];


class Homzs extends StatefulWidget {
  static var tag;

  @override
  _HomzsState createState() => _HomzsState();
}

class _HomzsState extends State<Homzs> {
  

  CalendarController _controller;  //controller required for the calender to work

  Map<DateTime,List<dynamic>> _events;
  List<dynamic> _selectedEvents;   //show the events below
  TextEditingController _eventController;
  SharedPreferences prefs;

  @override
  void initState() {
    
    super.initState();
    _controller = CalendarController();
    _eventController = TextEditingController();
    _events = {};   
    _selectedEvents = [];
    initPrefs();
  }

    initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
       _events = Map<DateTime,List<dynamic>>.from(decodeMap(json.decode(prefs.getString('events') ??'{}')));
    });
   
  }

  Map<String,dynamic> encodeMap(Map<DateTime,dynamic> map){  //function to  encode the events
    Map<String,dynamic> newMap = {};
    map.forEach((key,value){
      newMap[key.toString()]=map[key];
    });
    return newMap;
  }

  Map<DateTime,dynamic> decodeMap(Map<String,dynamic>map){
    Map<DateTime,dynamic> newMap = {};
    map.forEach((key,value){
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }
  @override
  Widget build(BuildContext context) {

  
    return Scaffold(

       appBar: GradientAppBar(
            leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
           Navigator.of(context).pop();
         },
         ),
         backgroundColorStart: Color(0xFFF47015),//appbar color
         backgroundColorEnd: Color(0xFFEF7727C),
         elevation: 0,

            title: Text(
           'Infoo',style:TextStyle(
             fontFamily: 'Montserrat',fontSize: 19,color: Colors.white,
            
           )
           
         ),
         centerTitle: true,

          ),

      body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

            TableCalendar(
              events: _events,

              headerStyle: HeaderStyle(
              centerHeaderTitle: true,
              formatButtonDecoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(20),
              ),
              formatButtonTextStyle: TextStyle(
                color: Colors.white,
              )
            ),
              onDaySelected: (date, events){
                setState(() {
                  _selectedEvents = events;   //to put the events separately
                });
              },
              initialCalendarFormat: CalendarFormat.twoWeeks,
              calendarStyle: CalendarStyle(
                todayColor: Colors.orange,
                selectedColor: Theme.of(context).primaryColor,
                todayStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                )
              ),

              calendarController: _controller,

              builders: CalendarBuilders(
                selectedDayBuilder: (context,date,events) =>Container(
                  alignment: Alignment.center,                  
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(
                      color:Colors.white,
                    ),
                    )),

                    todayDayBuilder: (context,date,events)=>
                    Container(
                  alignment: Alignment.center,                  
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(
                      color:Colors.white,
                    ),
                    )),

              ),
              
              
              ),

              SizedBox(height:10),
              BannerWidgetArea(),
             ..._selectedEvents.map((event) =>ListTile(
               title:Text(event)
             )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(FontAwesomeIcons.plus),
        onPressed: _showAddDialog,
        ),
    );
  }
  _showAddDialog(){
    showDialog(
      context: context,
      builder: (context)=>AlertDialog(
        content: TextField(
          controller: _eventController,
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Save'),
            onPressed:(){
              if(_eventController.text.isEmpty)return;
              setState(() {
                 if(_events[_controller.selectedDay] != null){
                _events[_controller.selectedDay].add(_eventController.text);
              }
              else{
                _events[_controller.selectedDay] = [_eventController.text];
              }
              prefs.setString('events',json.encode(encodeMap(_events)));
              _eventController.clear();
              Navigator.pop(context);
              });
             
            } )
        ],
      )
      
      );
  }
}

class BannerWidgetArea extends StatelessWidget {

  @override  
  Widget build(BuildContext context) {
    
    var screenwidth = MediaQuery.of(context).size.width;

    PageController controller = PageController(viewportFraction:0.8,initialPage:1 );

     List<Widget> banners = List<Widget>();

    for(int x=0;x<bannerItems.length;x++){

      var bannerView = Padding(
        padding: EdgeInsets.all(10),
        child: Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[

             Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.all(Radius.circular(20)),
                 boxShadow: [
                   BoxShadow(        //shadow behind pageview
                     color:Colors.black54,
                     offset: Offset(4, 4),
                     blurRadius: 5,
                     spreadRadius: 3
                   )
                   
                 ]
               ),
             ),  

              ClipRRect(
                child: Image.asset(bannerImage[x],fit: BoxFit.cover,),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                
                ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(  //black  shadow on page
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent,Colors.black87])
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      bannerItems[x],style: TextStyle(fontSize:25,color:Colors.white),
                    )
                  ],
                ),
              )
              
          ], 
        ),
      ),
    );
      banners.add(bannerView);
    }
    return Container(
      width: screenwidth,
      height: screenwidth*9/16,
      child: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: banners,
      ),
    );
  }
}
