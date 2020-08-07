import 'package:flutter/material.dart';
import 'package:grabFood/data/Products.dart';
import 'package:grabFood/data/Restaurants.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class RestaurantDetailsPage extends StatefulWidget {
  final Restaurant restaurant;

  RestaurantDetailsPage({@required this.restaurant});

  @override
  _RestaurantDetailsPageState createState() => _RestaurantDetailsPageState();
}

class _RestaurantDetailsPageState extends State<RestaurantDetailsPage> {
  @override
  Widget build(BuildContext context) {
    String promo;

    if (widget.restaurant.discType == 'AMOUNT') {
      promo =
          "P${widget.restaurant.discVal.toString()} OFF: ${widget.restaurant.discDesc}";
    } else if (widget.restaurant.discType == 'PERCENTAGE') {
      promo =
          "${widget.restaurant.discVal.toString()}% OFF: ${widget.restaurant.discDesc}";
    } else {
      promo = "FREE DELIVERY: ${widget.restaurant.discDesc}";
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(19, 25, 37, 1),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  widget.restaurant.imageUrl,
                ),
              ),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * .30,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(19, 25, 37, 1),
                    Color.fromRGBO(19, 25, 37, 0.8),
                    Color.fromRGBO(19, 25, 37, 0.5),
                    Color.fromRGBO(19, 25, 37, 0.45),
                    Color.fromRGBO(19, 25, 37, 0.35),
                    Color.fromARGB(0, 0, 0, 0)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * .325,
                  padding: EdgeInsets.symmetric(
                    vertical: 32.0,
                    horizontal: 12.0,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Color.fromRGBO(0, 0, 0, 0.30),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.close,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Color.fromRGBO(0, 0, 0, 0.30),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.lightBlue[200],
                        width: 0.25,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.restaurant.name,
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Text(
                            widget.restaurant.tags,
                            style: TextStyle(
                              fontSize: 14.0,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.black45,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Row(
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          '5',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.0,
                                          ),
                                        ),
                                        SizedBox(width: 10.0),
                                        Expanded(
                                          child: LinearPercentIndicator(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            lineHeight: 7.0,
                                            percent: 0.62,
                                            backgroundColor:
                                                Color.fromRGBO(47, 58, 80, 1),
                                            progressColor: Colors.yellow,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5.0),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          '4',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.0,
                                          ),
                                        ),
                                        SizedBox(width: 10.0),
                                        Expanded(
                                          child: LinearPercentIndicator(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            lineHeight: 7.0,
                                            percent: 0.3,
                                            backgroundColor:
                                                Color.fromRGBO(47, 58, 80, 1),
                                            progressColor: Colors.yellow,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5.0),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          '3',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.0,
                                          ),
                                        ),
                                        SizedBox(width: 10.0),
                                        Expanded(
                                          child: LinearPercentIndicator(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            lineHeight: 7.0,
                                            percent: 0.2,
                                            backgroundColor:
                                                Color.fromRGBO(47, 58, 80, 1),
                                            progressColor: Colors.yellow,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5.0),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          '2',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.0,
                                          ),
                                        ),
                                        SizedBox(width: 10.0),
                                        Expanded(
                                          child: LinearPercentIndicator(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            lineHeight: 7.0,
                                            percent: 0.019,
                                            backgroundColor:
                                                Color.fromRGBO(47, 58, 80, 1),
                                            progressColor: Colors.yellow,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5.0),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          '1',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.0,
                                          ),
                                        ),
                                        SizedBox(width: 10.0),
                                        Expanded(
                                          child: LinearPercentIndicator(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.5,
                                            lineHeight: 7.0,
                                            percent: 0.12,
                                            backgroundColor:
                                                Color.fromRGBO(47, 58, 80, 1),
                                            progressColor: Colors.yellow,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      widget.restaurant.rating.toString(),
                                      style: TextStyle(
                                        fontSize: 28.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 16.0,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 16.0,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 16.0,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 16.0,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Color.fromRGBO(47, 58, 80, 1),
                                          size: 16.0,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "${widget.restaurant.ratingCount} ratings",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.lightBlue[200],
                        width: 0.25,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'About',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Text(
                            widget.restaurant.about,
                            style: TextStyle(
                              fontSize: 14.0,
                              decorationColor: Colors.black45,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.lightBlue[200],
                        width: 0.25,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Opening Hours',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "${widget.restaurant.businessStartDay} - ${widget.restaurant.businessEndDay}",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    decorationColor: Colors.black45,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "${widget.restaurant.businessStartTime} - ${widget.restaurant.businessEndTime}",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    decorationColor: Colors.black45,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
