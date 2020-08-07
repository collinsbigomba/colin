import 'package:flutter/material.dart';

class HostelsExtended extends StatelessWidget {
  var index;

  HostelsExtended(this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: ListView(
          children: <Widget>[
            SafeArea(
              child: Container(
                height: 330,
                child: Stack(
                  children: <Widget>[
                    SizedBox(
                      height: 330,
                      child: Image.asset(
                        'assets/images/index2.jpeg',
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Builder(
                  builder: (context) => OutlineButton(
                      child: Text('Book Now'),
                      onPressed: () {
                        Scaffold.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.orange,
                            content:
                                Text('Submitting Request, Please Wait.....')));
                      })),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/woman.jpeg'),
                      ),
                      SizedBox(width: 5),
                      Column(
                        children: [
                          Text(
                            'Collins Bigomba',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'member',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            AssetImage('assets/images/woman2.jpeg'),
                      ),
                      SizedBox(width: 5),
                      Column(
                        children: [
                          Text(
                            'Paul Epillo',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'member',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/man.jpeg'),
                      ),
                      SizedBox(width: 5),
                      Column(
                        children: [
                          Text(
                            'Jessy Rubahimbya',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'member',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/man1.jpeg'),
                      ),
                      SizedBox(width: 5),
                      Column(
                        children: [
                          Text(
                            'Lebron James',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'member',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/man2.jpeg'),
                      ),
                      SizedBox(width: 5),
                      Column(
                        children: [
                          Text(
                            'Greek Freak',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'member',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
