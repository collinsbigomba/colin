import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

var bannerItems = ['Courses', 'Staff', 'Sports', 'Meals', 'Entertainment'];
var bannerImage = [
  'assets/images/imges.jpeg',
  'assets/images/c.jpeg',
  'assets/images/f.jpg',
  'assets/images/j.jpeg',
  'assets/images/f.jpeg',
];

class ImageCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AboutDialogPage(),
    );
  }
}

class AboutDialogPage extends StatefulWidget {
  static var tag;

  @override
  _AboutDialogPageState createState() => _AboutDialogPageState();
}

class _AboutDialogPageState extends State<AboutDialogPage> {
  Icon cusIcon = Icon(Icons.search); //variables
  Widget cusSearchbar = Text('Aboutus Page');

  Future<Null> refreshList() async {
    await Future.delayed(Duration(
        seconds: 3)); // inorder for the refresh indicator to take 3 seconds
    setState(() {});
    return null;
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.white,
        ),
        backgroundColorStart: Color(0xFFF47015), //
        backgroundColorEnd: Color(0xFFEF7727C), //appbar color

        title: cusSearchbar,

        actions: <Widget>[
          IconButton(
              icon: cusIcon,
              onPressed: () {
                setState(() {
                  if (this.cusIcon.icon == Icons.search) {
                    this.cusIcon = Icon(Icons.cancel);
                    this.cusSearchbar = TextField(
                      textInputAction:
                          TextInputAction.go, //remove black underline
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search Item',
                      ),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    );
                  } else {
                    this.cusIcon =
                        Icon(Icons.search); //change back to original format
                    this.cusSearchbar = Text('Aboutus Page');
                  }
                });
              })
        ],
      ),
      body: LiquidPullToRefresh(
        height: 100,
        color: Colors.orange[200],
        onRefresh: refreshList,
        child: Scrollbar(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.symmetric(vertical: 2.0),
                  height: screenheight / 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      gradient: LinearGradient(
                        //black  shadow on page
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black87],
                      ),
                    ),
                    child: Center(
                      child: new ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Carousel(
                          dotHorizontalPadding: 12,
                          boxFit: BoxFit.cover,
                          images: [
                            Image.asset('assets/images/index1.jpeg'),
                            Image.asset('assets/images/df.jpeg'),
                            Image.asset('assets/images/d.png'),
                            Image.asset('assets/images/index2.jpeg'),
                            Image.asset('assets/images/f.jpg'),
                            Image.asset('assets/images/g.jpg'),
                            Image.asset('assets/images/index.png'),
                            Image.asset('assets/images/e.jpeg'),
                          ],
                          animationCurve: Curves.fastOutSlowIn,
                          animationDuration: Duration(milliseconds: 2000),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              BannerWidgetArea(),
              SizedBox(height: 10),
              TinderCard(),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class TinderCard extends StatefulWidget {
  @override
  _TinderCardState createState() => _TinderCardState();
}

class _TinderCardState extends State<TinderCard> with TickerProviderStateMixin {
  List<String> tinderImages = [
    'assets/images/h.webp',
    'assets/images/g.webp',
    'assets/images/images2.jpeg',
    'assets/images/images3.png',
    'assets/images/imags.jpeg',
    'assets/images/index4.jpeg',
    'assets/images/f.jpg',
    'assets/images/h.webp',
    'assets/images/index3.jpeg',
    'assets/images/index5.jpeg',
    'assets/images/ind.jpeg',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: TinderSwapCard(
        orientation: AmassOrientation.BOTTOM,
        totalNum: 11,
        stackNum: 4,
        swipeEdge: 4,
        maxWidth: MediaQuery.of(context).size.width * 0.9,
        maxHeight: MediaQuery.of(context).size.height * 0.9,
        minWidth: MediaQuery.of(context).size.width * 0.8,
        minHeight: MediaQuery.of(context).size.height * 0.8,
        cardBuilder: (context, index) => Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              '${tinderImages[index]}',
              fit: BoxFit.cover,
            ),
          ),
          elevation: 5,
        ),
      ),
    );
  }
}

class BannerWidgetArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;

    PageController controller =
        PageController(viewportFraction: 0.8, initialPage: 1);

    List<Widget> banners = List<Widget>();

    for (int x = 0; x < bannerItems.length; x++) {
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
                      BoxShadow(
                          //shadow behind pageview
                          color: Colors.black54,
                          offset: Offset(4, 4),
                          blurRadius: 5,
                          spreadRadius: 3)
                    ]),
              ),
              ClipRRect(
                child: Image.asset(
                  bannerImage[x],
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    gradient: LinearGradient(
                        //black  shadow on page
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black87])),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      bannerItems[x],
                      style: TextStyle(fontSize: 25, color: Colors.white),
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
      height: screenwidth * 9 / 16,
      child: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: banners,
      ),
    );
  }
}
