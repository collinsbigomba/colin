import 'package:flutter/material.dart';

 
class  CustomShapeClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {

    final Path path = Path();
    path.lineTo(0.0, size.height);//can also use 370 coz its the height of the screen
    
    var firstEndPoint = Offset(size.width* .5, size.height -30);
    var firstControlPoint = Offset(size.width*.25, size.height -50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 80);
    var secondControlPoint = Offset(size.width* .75, size.height -10);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path; 
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

/*TextStyle dropDownLabelStyle = TextStyle(color:Colors.white,fontSize:16);  //preffered textstyle
TextStyle dropDownMenuItemStyle = TextStyle(color:Colors.black,fontSize:18);

class HomeTopPart extends StatefulWidget {
  @override
  _HomeTopPartState createState() => _HomeTopPartState();
}

class _HomeTopPartState extends State<HomeTopPart> {

  var selectedLocationIndex =0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper:CustomShapeClipper(),
          child: Container(
            height:360,
            decoration: BoxDecoration(
            gradient:LinearGradient(colors: [
                firstcolor,
                secondcolor
              ])
            ),
            child: Column(
              children: <Widget>[
                SizedBox(height:30),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.location_on,color: Colors.white,),
                      SizedBox(width:16),
                      PopupMenuButton(
                        onSelected:(index){
                          setState(() {
                             selectedLocationIndex = index;
                          });
                         
                        },
                        child:Row(
                          children: <Widget>[
                            Text(locations[selectedLocationIndex], style: dropDownLabelStyle, ),
                            Icon(Icons.arrow_downward,color: Colors.white,)
                          ],
                        ),
                        
                        itemBuilder:(BuildContext context) => <PopupMenuItem<int>>[   //item builder must be added
                          PopupMenuItem(
                            child:Text(locations[0], style:dropDownMenuItemStyle,),
                            value: 0,
                          ),
                          PopupMenuItem(
                            child:Text(locations[1], style:dropDownMenuItemStyle,),
                            value: 1,
                          ),
                          PopupMenuItem(
                            child:Text(locations[2], style:dropDownMenuItemStyle,),
                            value: 2,
                          ),
                          PopupMenuItem(
                            child:Text(locations[3], style:dropDownMenuItemStyle,),
                            value: 3,
                          ),
                          PopupMenuItem(
                            child:Text(locations[4], style:dropDownMenuItemStyle,),
                            value: 4,
                          ),
                          PopupMenuItem(
                            child:Text(locations[5], style:dropDownMenuItemStyle,),
                            value: 5,
                          ),
                        ],
                      )

                    ],
                  ),
                ),
              SizedBox(height:30,),
              Text('Which Cumpus would you want to study from ?', style: TextStyle(
                fontSize: 24,
                color: Colors.white,),
                textAlign: TextAlign.center,),
                SizedBox(height:30,),
                Padding(padding:EdgeInsets.symmetric(horizontal:32),
                child:Material(
                  elevation:5,
                  borderRadius:BorderRadius.all(Radius.circular(30)),
                  child: TextField(
                    controller:TextEditingController(),
                    style: dropDownMenuItemStyle,
                    cursorColor: appTheme.primaryColor,
                    decoration: InputDecoration(
                     contentPadding: EdgeInsets.symmetric(horizontal:16,vertical:15),
                     border: InputBorder.none
                    ),
                  ),
                ),),
                
              ],
            ),
          ),
        ),
        
      ],
      
    );
  }
}*/
