import 'package:app1/campuses.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class Information extends StatefulWidget {
  static var tag;

  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  GoogleMapController _controller;

  List<Marker> allMarkers = [];

  PageController _pageController;

  int prevPage;

  @override
  void initState() {
    super.initState();
    campus.forEach((element) {
      allMarkers.add(Marker(markerId: MarkerId(element.campusName),
      draggable: false,
      infoWindow: InfoWindow(title:element.campusName,snippet: element.address),
      position: element.locationCords
      ));
    });
    _pageController = PageController(initialPage: 1,viewportFraction: 0.8)..addListener((_onScroll));// scroll to location
  } 

  void _onScroll(){  //function to scroll to other page
    if(_pageController.page.toInt() != prevPage){
      prevPage = _pageController.page.toInt();
      moveCamera();
    }
  }

  _campusList(index){
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget){
        double value = 1;
        if(_pageController.position.haveDimensions){
          value = _pageController.page - index;
          value = (1-(value.abs() * 0.3) + 0.06).clamp(0.0,1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) *125,
            width: Curves.easeInOut.transform(value) *350,
            child: widget,
          ),


        );

      },
      child: InkWell(
        onTap: (){
         // moveCamera();
        },
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                height: 125,
                width: 274,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 10,
                    )
                  ]
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 90,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            topLeft: Radius.circular(10)
                          ),
                          image: DecorationImage(image: AssetImage('assets/images/f.jpg'),fit: BoxFit.cover)
                        ),
                      ),
                      SizedBox(width: 5,),
                      Column(  
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            campus[index].campusName,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                           Text(
                            campus[index].address,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                          Container(
                            width: 175,
                            child: Text(
                              campus[index].description,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w300
                              ),
                            ),
                          )

                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )

       ,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColorStart: Color(0xFFF47015), //appbar color
        backgroundColorEnd: Color(0xFFEF7727C), //
        elevation: 0,
        title: Text('Details',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 19,
            )),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          /*   Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Color(0xFFF3FAFC),
              ),
              child: Container(
                  child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search all activities',
                    hintStyle: TextStyle(
                        color: Color(0xFF89969C),
                        fontFamily: 'Inconsolata',
                        fontSize: 16),
                    suffixIcon: Icon(
                      Icons.search,
                      color: Color(0xFF89969C),
                    )),
              )),
            ),
          ),
        
          SizedBox(height: 10),*/
          Container(
            height: MediaQuery.of(context).size.height - 50,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                  target:LatLng(40.7128, -74.0060),
                   //LatLng(0.003611, -32.014444),                     
                  zoom: 12),
                  markers: Set.from(allMarkers),
              onMapCreated: mapCreated,
            ),
          ),
          Positioned(
            bottom: 20,
           right: 0,
           left: 0,
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width ,
              
              child: PageView.builder(
                controller: _pageController,
                itemCount: campus.length,
                itemBuilder:(BuildContext context, int index) {
                  return _campusList(index);
                }),
            ))
        ],
      ),
    );
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }
  moveCamera(){
    _controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: campus[_pageController.page.toInt()].locationCords,
        zoom: 14,
        bearing: 45,
        tilt: 45

    )));
  }
   
}

