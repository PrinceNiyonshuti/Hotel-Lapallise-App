import 'package:flutter/material.dart';

const Color mainThemeColor = Color(0xFF272D8D);

final List<Attraction> attractionsList = [
  Attraction(
      imgPath:
          'https://cf.bstatic.com/xdata/images/hotel/max1024x768/275162028.jpg?k=38b638c8ec9ec86624f9a598482e95fa634d49aa3f99da1838cf5adde1a14521&o=&hp=1',
      name: 'Grand Bavaro Princess',
      desc: 'All-Inclusive Resort',
      location: 'Punta Cana, DR',
      rating: 3,
      price: 80.0),
  Attraction(
      imgPath:
          'https://cf.bstatic.com/xdata/images/hotel/max1024x768/232161008.jpg?k=27808fe44ab95f6468e5433639bf117032c8271cebf5988bdcaa0a202b9a6d79&o=&hp=1',
      name: 'Hyatt Ziva Cap Cana',
      desc: 'All-Inclusive Resort',
      price: 90.0,
      rating: 4,
      location: 'Punta Cana, DR'),
  Attraction(
      imgPath:
          'https://cf.bstatic.com/xdata/images/hotel/max1024x768/256931299.jpg?k=57b5fb9732cd89f308def5386e221c46e52f48579345325714a310addf819274&o=&hp=1',
      name: 'Impressive Punta Cana',
      desc: 'All-Inclusive Resort',
      price: 100.0,
      rating: 5,
      location: 'Punta Cana, DR'),
  Attraction(
      imgPath:
          'https://cf.bstatic.com/xdata/images/hotel/max1024x768/283750757.jpg?k=4f3437bf1e1b077463c9900e4dd015633db1d96da38f034f4b70a4ba3ef76d82&o=&hp=1',
      name: 'Villas Mar Azul Dreams',
      desc: 'All-Inclusive Resort',
      price: 100.0,
      rating: 4,
      location: 'Tallaboa, PR'),
];

// bottom bar list
final List<BottomBarItem> barItemsList = [
  BottomBarItem(label: 'Home', isSelected: true, icon: Icons.home),
  BottomBarItem(label: 'Account', isSelected: false, icon: Icons.person),
  BottomBarItem(
      label: 'Bookings', isSelected: false, icon: Icons.pending_actions),
  BottomBarItem(label: 'Payments', isSelected: false, icon: Icons.payments),
  BottomBarItem(label: 'More', isSelected: false, icon: Icons.more_horiz),
];

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: SplashPage()));
}

// The landing page
class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.bottomLeft,
            child: Icon(
              Icons.pool,
              color: mainThemeColor,
              size: 80,
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0e/02/8b/39/hotel-swimming-pool-when.jpg?w=1200&h=-1&s=1'),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              color: mainThemeColor.withOpacity(0.7),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.white),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'La Palisse Hotel',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
                SizedBox(
                  height: 60,
                ),
                Icon(
                  Icons.pool,
                  color: Colors.white,
                  size: 80,
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Choose location to".toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                    )),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Find a Hotel",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                LandingSearchBar()
              ],
            )
          ],
        ));
  }
}

// Landing Search Bar
class LandingSearchBar extends StatelessWidget {
  const LandingSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      padding: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Search Room',
            style: TextStyle(color: Colors.grey),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ListPage()));
            },
            child: Container(
              width: 30,
              height: 30,
              child: Icon(
                Icons.search,
                color: Colors.white,
                size: 15,
              ),
              decoration: BoxDecoration(
                  color: mainThemeColor,
                  borderRadius: BorderRadius.circular(25)),
            ),
          )
        ],
      ),
    );
  }
}

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // delay and navigate to List page
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => LandingPage()));
    });
    return Stack(
      children: [
        Container(
          color: mainThemeColor,
        ),
        Align(
          alignment: Alignment.center,
          child: Icon(
            Icons.pool,
            color: Colors.white,
            size: 80,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: LinearProgressIndicator(
            valueColor:
                AlwaysStoppedAnimation<Color>(Colors.white.withOpacity(0.4)),
          ),
        )
      ],
    );
  }
}

// Another landing page after splash
class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        title: Center(
          child: Icon(
            Icons.pool,
            color: Colors.white,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          )
        ],
      ),
      backgroundColor: mainThemeColor,
      body: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: attractionsList.length,
                    itemBuilder: (context, index) {
                      Attraction attr = attractionsList[index];
                      return AttractionCard(
                        attraction: attr,
                      );
                    }),
              ),
              BottomBarWidget()
            ],
          ),
        ),
      ),
    );
  }
}

class AttractionCard extends StatelessWidget {
  Attraction? attraction;
  AttractionCard({this.attraction});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              offset: Offset.zero,
              color: Colors.black.withOpacity(0.1),
            ),
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: Container(
          height: 300,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(attraction!.imgPath!),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    height: 150,
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              attraction!.name!,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.pin_drop,
                                  color: Colors.grey.withOpacity(0.7),
                                  size: 13,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  attraction!.location!,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.withOpacity(0.7)),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            RatingWidget(
                              rating: attraction!.rating!,
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '\$${attraction!.price!.toStringAsFixed(2)}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Per Night',
                              style: TextStyle(
                                color: Colors.grey.withOpacity(0.7),
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 16,
                  ),
                  margin: EdgeInsets.only(right: 10),
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: mainThemeColor,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            color: mainThemeColor.withOpacity(0.5),
                            offset: Offset.zero)
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Bottom Widget bar
class BottomBarWidget extends StatefulWidget {
  @override
  _BottomBarWidgetState createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  List<BottomBarItem> barItems = barItemsList;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
        bottom: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(barItems.length, (index) {
          var barItem = barItems[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                barItems.forEach((element) {
                  element.isSelected = barItem == element;
                });
              });
            },
            child: Column(
              children: [
                Icon(barItem.icon,
                    color: barItem.isSelected! ? mainThemeColor : Colors.grey),
                Text(
                  barItem.label!,
                  style: TextStyle(
                      color:
                          (barItem.isSelected! ? mainThemeColor : Colors.grey),
                      fontSize: 11),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}

class RatingWidget extends StatelessWidget {
  int? rating;
  RatingWidget({this.rating});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: List.generate(5, (index) {
            return Icon(
              index < this.rating! ? Icons.star : Icons.star_border,
              color: Colors.yellow,
            );
          }),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          '${this.rating!}/5 Reviews',
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.withOpacity(0.7),
          ),
        )
      ],
    );
  }
}

// bottom bar model

class BottomBarItem {
  String? label;
  bool? isSelected;
  IconData? icon;
  BottomBarItem({this.label, this.isSelected, this.icon});
}

class Attraction {
  String? imgPath;
  String? name;
  String? desc;
  double? price;
  String? location;
  int? rating;

  Attraction(
      {this.imgPath,
      this.name,
      this.desc,
      this.price,
      this.location,
      this.rating});
}
