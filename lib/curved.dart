import 'package:app1/AboutDialog.dart';
import 'package:app1/Homzs.dart';
import 'package:app1/signin_signup.dart';
import 'package:app1/Login_page.dart';
import 'package:app1/contacts.dart';
import 'package:app1/home.dart';
import 'package:app1/settings.dart';
import 'package:app1/hostels.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:app1/info.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  
   final routes = <String, WidgetBuilder>{   //signin page first to appear
    Boom.tag: (context)=>Boom(),
    Loginpage.tag: (context)=>Loginpage(),
    Dem.tag:(context)=>Dem(),
    Homzs.tag:(context)=>Homzs(),
    Contacts.tag: (context)=>Contacts(),
    AboutDialogPage.tag: (context)=>AboutDialog(),
    Settings.tag: (context)=>Settings(),
    Listvi.tag: (context)=>Listvi(),
    Information.tag: (context)=>Information()
      };
    
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          home: CurvedPage(),
        );
      }
    
      static hostels() {}
}

class CurvedPage extends StatefulWidget {
  @override
  _CurvedPageState createState() => _CurvedPageState();
}

class _CurvedPageState extends State<CurvedPage> {

int _currentIndex = 0;
int currentIndex = 0;
final List<Widget> _children =[ /*pages created that a linked together */
  
  
  Dem(),
  Homzs(),
  Contacts(),
  AboutDialogPage(),
  Settings(),
  Listvi(),
  Information(),
      
      ];
      
      void onTappedBar(int index){  /* a method whenever the icon is touched*/
         
         setState(() {
           _currentIndex = index;
         });
      }
      
        @override
        Widget build(BuildContext context) {
          
      
      
          return Scaffold(
            bottomNavigationBar: CurvedNavigationBar(
      
                     onTap: onTappedBar,
                     index:_currentIndex, 
          
                  color:Colors.orange,
                  backgroundColor:Colors.white,
                  buttonBackgroundColor:Colors.orange[300],
                  height:50,
                  
                  animationDuration: Duration(milliseconds:150),
                  animationCurve: Curves.bounceInOut,
      
                    items:<Widget>[
                    Icon(FontAwesomeIcons.home),
                    Icon(FontAwesomeIcons.sith),
                    Icon(FontAwesomeIcons.linode),
                    Icon(FontAwesomeIcons.camera),
                    Icon(FontAwesomeIcons.empire), 
                    Icon(FontAwesomeIcons.hotel),
                    Icon(FontAwesomeIcons.peopleArrows),   
                   ],),
              
                  body: Container(
                    
                  child: _children[_currentIndex],/*whenever a user clicks on a different page, different content on that page appears */                
                ),  
                  );
            
          
        }
}