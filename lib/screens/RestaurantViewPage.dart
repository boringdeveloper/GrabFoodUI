import 'package:flutter/material.dart';
import 'package:grabFood/data/Products.dart';
import 'package:grabFood/data/Restaurants.dart';
import 'package:grabFood/screens/ProductViewPage.dart';
import 'package:grabFood/screens/RestaurantDetailsPage.dart';

class RestaurantViewPage extends StatefulWidget {
  final Restaurant restaurant;

  RestaurantViewPage({@required this.restaurant});

  @override
  _RestaurantViewPageState createState() => _RestaurantViewPageState();
}

class _RestaurantViewPageState extends State<RestaurantViewPage> {
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
                  height: MediaQuery.of(context).size.height * .27,
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
                            Icons.arrow_back_ios,
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
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black54,
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
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                size: 14.0,
                                color: Colors.yellow,
                              ),
                              SizedBox(width: 5.0),
                              Container(
                                padding: EdgeInsets.only(right: 10.0),
                                margin: EdgeInsets.only(right: 10.0),
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      color: Colors.black54,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  widget.restaurant.rating.toString(),
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    decorationColor: Colors.black45,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          RestaurantDetailsPage(
                                        restaurant: widget.restaurant,
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  'See details',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.black45,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.0),
                          Divider(
                            color: Colors.black26,
                            thickness: 0.5,
                            height: 5.0,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 18.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'lib/resources/icons/recommendedCategs/free-delivery.png',
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    RichText(
                                      text: TextSpan(
                                        text:
                                            "${widget.restaurant.distance} km",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0,
                                          color: Colors.black,
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: " (25 mins)",
                                            style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5.0),
                                    Text(
                                      "Delivery",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.black26,
                            thickness: 0.5,
                            height: 5.0,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 18.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Icon(
                                  Icons.local_offer,
                                  color: Color.fromRGBO(199, 169, 130, 1),
                                  size: 18.0,
                                ),
                                SizedBox(width: 24.0),
                                Expanded(
                                  child: Container(
                                    child: Text(
                                      promo.replaceAll("", "\u{200B}"),
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14.0,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.black26,
                            thickness: .5,
                            height: 5.0,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 18.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Icon(
                                    Icons.account_balance_wallet,
                                    color: Color.fromRGBO(199, 169, 130, 1),
                                    size: 18.0,
                                  ),
                                  SizedBox(width: 24.0),
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        "Check for available offers",
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14.0,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.black45,
                                    size: 18.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  color: Color.fromRGBO(247, 247, 247, 1),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: restoProducts.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      var category = restoProducts[index];
                      return Container(
                        padding: EdgeInsets.all(20.0),
                        margin: EdgeInsets.only(bottom: 12.0),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Text(
                                category.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                            // products
                            ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: category.products.length,
                              itemBuilder: (BuildContext ctxt, int index) {
                                var product = category.products[index];

                                return GestureDetector(
                                  onTap: () {
                                    if (product.isAvailable) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ProductViewPage(
                                            product: product,
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 12.0),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.black26,
                                          width: 0.25,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                product.name,
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                              SizedBox(height: 10.0),
                                              Text(
                                                product.price.toString(),
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 10.0),
                                              (product.description != "")
                                                  ? Text(
                                                      (product.isAvailable)
                                                          ? product.description
                                                          : 'Unavailable',
                                                      style: TextStyle(
                                                        fontSize: 14.0,
                                                        color: Colors.black54,
                                                      ),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    )
                                                  : SizedBox.shrink(),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 15.0),
                                        (product.imageUrl != '')
                                            ? Hero(
                                                tag: product.id,
                                                child: Container(
                                                  height: 100.0,
                                                  width: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: Colors.green[300],
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(8.0),
                                                    ),
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                        product.imageUrl,
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : SizedBox(width: 100.0),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
