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

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: SplashPage()));
}

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // delay and navigate to List page
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ListPage()));
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
      body: Container(
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
            )
          ],
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
                      children: [
                        Text(
                          attraction!.name!,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
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
                        RatingWidget(
                          rating: attraction!.rating!,
                        )
                      ],
                    ),
                    Column(
                      children: [],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
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
