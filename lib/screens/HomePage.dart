import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:grabFood/data/Restaurants.dart';
import 'package:grabFood/data/RecommendedCategs.dart';
import 'package:grabFood/screens/FoodRewards/FoodRewardsPage.dart';
import 'package:grabFood/screens/RestaurantViewPage.dart';
import 'package:grabFood/screens/Search/SearchPage.dart';
import 'package:grabFood/widgets/RestaurantListItem.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _current = 0;

  static List<String> _imgList = [
    'https://i.pinimg.com/564x/3e/74/19/3e74198b958ff4006a3ba0f75c560afa.jpg',
    'https://i.pinimg.com/564x/c2/9c/7d/c29c7dc046595825cb20ad50ccae9369.jpg',
    'https://i.pinimg.com/564x/2f/cf/55/2fcf55e319b329f154475695d593df88.jpg',
    'https://i.pinimg.com/564x/07/61/77/0761775503411d908cc6b409a27a0786.jpg',
    'https://i.pinimg.com/564x/70/16/a4/7016a4c9819504fef8a81046c258f077.jpg',
    'https://i.pinimg.com/564x/4b/ec/32/4bec32688389d70d167136e6411d6e87.jpg',
  ];

  List<Widget> imageSliders = _imgList
      .map(
        (item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              child: Image.network(item, fit: BoxFit.cover, width: 1000.0),
            ),
          ),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3;
    final double itemWidth = size.width / 2;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Deliver to",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    size: 20.0,
                    color: Color.fromRGBO(238, 100, 83, 1),
                  ),
                  SizedBox(width: 2.5),
                  Text(
                    "124 Conch Street",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.favorite_border,
              size: 26.0,
              color: Colors.black45,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.receipt,
              size: 26.0,
              color: Colors.black45,
            ),
            onPressed: () {},
          ),
          SizedBox(width: 8.0),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(
              vertical: 14.0,
              horizontal: 12,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchPage(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(247, 247, 247, 1),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.search,
                      color: Colors.black45,
                      size: 18.0,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'What are you craving?',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CarouselSlider(
                    items: imageSliders,
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 2.75,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: _imgList.map((url) {
                        int index = _imgList.indexOf(url);
                        return Container(
                          width: _current == index ? 12.0 : 4.0,
                          height: 4.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 1.0),
                          decoration: BoxDecoration(
                            color: _current == index
                                ? Color.fromRGBO(223, 104, 86, 1)
                                : Color.fromRGBO(0, 0, 0, 0.4),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(12.0),
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 4.0,
                    ),
                    color: Color.fromRGBO(253, 231, 210, 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.55,
                            minWidth: MediaQuery.of(context).size.width * 0.50,
                          ),
                          child: AutoSizeText(
                            'There are 3 food rewards waiting.',
                            style: TextStyle(
                              color: Color.fromRGBO(155, 91, 74, 1),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                            minFontSize: 12.0,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          color: Color.fromRGBO(245, 133, 35, 1),
                          child: Text(
                            'View',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FoodRewardsPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 20.0,
                    ),
                    decoration: BoxDecoration(
                      border: new Border(
                        bottom: new BorderSide(
                          color: Colors.black12,
                          width: 0.5,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                    child: GridView.count(
                      crossAxisCount: 4,
                      controller: new ScrollController(keepScrollOffset: false),
                      childAspectRatio: (itemWidth / itemHeight),
                      shrinkWrap: true,
                      mainAxisSpacing: 4.0,
                      crossAxisSpacing: 8.0,
                      children: recommendedCategs
                          .map((RecommendedCategs recommendedCateg) {
                        return Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 50.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      recommendedCateg.imageUrl,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 6.0),
                              Text(
                                recommendedCateg.description,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12.0),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 12.0,
                      right: 12.0,
                      top: 16.0,
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: highlights.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        var highlight = highlights[index];

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Text(
                                              highlight.title,
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            SizedBox(width: 8.0),
                                            (highlight.isNew)
                                                ? Badge(
                                                    badgeColor: Color.fromRGBO(
                                                        1, 178, 76, 1),
                                                    shape: BadgeShape.square,
                                                    borderRadius: 5,
                                                    toAnimate: false,
                                                    badgeContent: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        horizontal: 2.0,
                                                      ),
                                                      child: Text(
                                                        'NEW',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12.0,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : SizedBox.shrink(),
                                          ],
                                        ),
                                        SizedBox(height: 2.0),
                                        (highlight.description != "")
                                            ? Text(
                                                highlight.description,
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 12.0,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              )
                                            : SizedBox.shrink(),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        'See All',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    onTap: () {},
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.0),
                              // Highlight Items
                              Container(
                                height: 210.0,
                                width: MediaQuery.of(context).size.width * 1,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: highlight.highlightItem.length,
                                  itemBuilder:
                                      (BuildContext ctxt, int hiIndex) {
                                    var highlightItem =
                                        highlight.highlightItem[hiIndex];
                                    String promo;

                                    if (highlightItem.discType == 'AMOUNT') {
                                      promo =
                                          "P${highlightItem.discVal.toString()} OFF: ${highlightItem.discDesc}";
                                    } else if (highlightItem.discType ==
                                        'PERCENTAGE') {
                                      promo =
                                          "${highlightItem.discVal.toString()}% OFF: ${highlightItem.discDesc}";
                                    } else {
                                      promo =
                                          "FREE DELIVERY: ${highlightItem.discDesc}";
                                    }

                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                RestaurantViewPage(
                                              restaurant: highlightItem,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .425,
                                        margin: EdgeInsets.only(right: 4.0),
                                        child: Card(
                                          elevation: 1.5,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                height: 120.0,
                                                decoration: BoxDecoration(
                                                  color: Colors.green[300],
                                                  borderRadius:
                                                      BorderRadius.vertical(
                                                    top: Radius.circular(
                                                      4.0,
                                                    ),
                                                  ),
                                                ),
                                                child: Stack(
                                                  children: <Widget>[
                                                    Container(
                                                      height: 120.0,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .vertical(
                                                          top: Radius.circular(
                                                            4.0,
                                                          ),
                                                        ),
                                                        image: DecorationImage(
                                                          image: NetworkImage(
                                                            highlightItem
                                                                .imageUrl,
                                                          ),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      bottom: 4.0,
                                                      right: 4.0,
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.all(6.0),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(
                                                                2.0),
                                                          ),
                                                        ),
                                                        child: Text(
                                                          "${highlightItem.distance} km",
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 10.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  highlightItem.name,
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  bottom: 8.0,
                                                  left: 8.0,
                                                  right: 8.0,
                                                ),
                                                child: Row(
                                                  children: <Widget>[
                                                    Icon(
                                                      Icons.local_offer,
                                                      size: 14.0,
                                                      color: Color.fromRGBO(
                                                          199, 169, 130, 1),
                                                    ),
                                                    SizedBox(width: 2.0),
                                                    Expanded(
                                                      child: Text(
                                                        promo,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black54,
                                                            fontSize: 14.0),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.0),
                    child: Text(
                      'More restaurants',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: restaurants.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return GestureDetector(
                          onTap: () {
                            showBranchSelectionActionBar(restaurants[index]);
                          },
                          child: RestaunrantListItem(
                            restaurant: restaurants[index],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  showBranchSelectionActionBar(Restaurant restaurant) {
    String promo;
    int deliveryTime;
    var outlets = [
      'Uptown Mall',
      'Market! Market!',
      'Venice Grand Canal',
      'Merkato, BGC',
      'SM Aura'
    ];

    if (restaurant.discType == 'AMOUNT') {
      promo = "P${restaurant.discVal.toString()} OFF: ${restaurant.discDesc}";
    } else if (restaurant.discType == 'PERCENTAGE') {
      promo = "${restaurant.discVal.toString()}% OFF: ${restaurant.discDesc}";
    } else if (restaurant.discType == 'FREEDELIVERY') {
      promo = "FREE DELIVERY: ${restaurant.discDesc}";
    } else {
      promo = '';
    }

    deliveryTime = (restaurant.distance * 20).round();
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.6,
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(6.0),
              topRight: Radius.circular(6.0),
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black26,
                      width: 0.25,
                    ),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    (restaurant.imageUrl != '')
                        ? Container(
                            height: 100.0,
                            width: 100.0,
                            decoration: BoxDecoration(
                              color: Colors.green[300],
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(
                                  restaurant.imageUrl,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : SizedBox(width: 100.0),
                    SizedBox(width: 15.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            restaurant.name.replaceAll("", "\u{200B}"),
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 2.5),
                          Text(
                            restaurant.tags.replaceAll("", "\u{200B}"),
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w300,
                              color: Colors.black54,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 12.0),
                          // outlets
                          Text(
                            "${restaurant.outletCount} outlets near you",
                            style: TextStyle(
                              fontSize: 12.0,
                              decorationColor: Colors.black38,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(bottom: 10.0),
                  itemCount: outlets.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RestaurantViewPage(
                              restaurant: restaurant,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 12.0,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.black26,
                              width: 0.25,
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              outlets[index].replaceAll("", "\u{200B}"),
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 10.0),
                            // Ratings, delivery time and distance
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.star,
                                  size: 14.0,
                                  color: Colors.yellow,
                                ),
                                SizedBox(width: 2.0),
                                Text(
                                  restaurant.rating.toString(),
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    decorationColor: Colors.black45,
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Icon(
                                  Icons.timer,
                                  size: 14.0,
                                ),
                                SizedBox(width: 2.0),
                                Text(
                                  "$deliveryTime mins • ${restaurant.distance} km",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    decorationColor: Colors.black45,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5.0),
                            // Promo
                            (promo != "")
                                ? Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.local_offer,
                                        size: 14.0,
                                        color: Color.fromRGBO(199, 169, 130, 1),
                                      ),
                                      SizedBox(width: 2.0),
                                      Expanded(
                                        child: Text(
                                          promo.replaceAll("", "\u{200B}"),
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            color: Colors.black87,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  )
                                : SizedBox.shrink(),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
