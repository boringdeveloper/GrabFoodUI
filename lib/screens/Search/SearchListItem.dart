import 'package:flutter/material.dart';
import 'package:grabFood/data/Restaurants.dart';
import 'package:grabFood/screens/RestaurantViewPage.dart';

class SearchListItem extends StatelessWidget {
  final Restaurant restaurant;

  SearchListItem({this.restaurant});

  @override
  Widget build(BuildContext context) {
    String promo;
    int deliveryTime;

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

    return GestureDetector(
      onTap: () {
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
          vertical: 12.0,
          horizontal: 16.0,
        ),
        color: Colors.white,
        margin: EdgeInsets.only(bottom: 12.0),
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

                  SizedBox(height: 10.0),
                  // outlests
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
    );
  }
}
