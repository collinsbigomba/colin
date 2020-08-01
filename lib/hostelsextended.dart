import 'package:flutter/material.dart';

class HostelsExtended extends StatelessWidget {
  var index;

  HostelsExtended(this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: 330,
              child: Stack(
                children: <Widget>[
                  SizedBox(
                    height: 330,
                    child: Image.asset(
                      'assets/images/k.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      top: 12,
                      left: 32,
                      child: Container(
                        child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      )),
                ],
              ),
            ),
          ),
          OutlineButton(child: Text('Book Now'), onPressed: () {})
        ],
      ),
    );
  }
}
