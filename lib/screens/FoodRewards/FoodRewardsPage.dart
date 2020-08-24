import 'package:flutter/material.dart';
import 'package:grabFood/data/FoodRewards.dart';

class FoodRewardsPage extends StatefulWidget {
  @override
  _FoodRewardsPageState createState() => _FoodRewardsPageState();
}

class _FoodRewardsPageState extends State<FoodRewardsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 239, 239, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        title: Text(
          'My Food Rewards',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.only(
              left: 0,
              right: 0,
              top: 0,
            ),
            elevation: 2,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Container(
                padding: EdgeInsets.all(12.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(247, 247, 247, 1),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Text(
                  'Enter promo code here',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: foodRewards.length,
              padding: EdgeInsets.all(8.0),
              itemBuilder: (BuildContext ctxt, int index) {
                return Card(
                  margin: EdgeInsets.all(8.0),
                  elevation: 1,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.5),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 16.0,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              image: AssetImage(
                                'lib/resources/icons/grabFoodLogo.png',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 4.0,
                                  horizontal: 8.0,
                                ),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(255, 238, 240, 1),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text(
                                  'Limited Offer',
                                  style: TextStyle(
                                    color: Color.fromRGBO(210, 123, 116, 1),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                foodRewards[index]
                                    .description
                                    .replaceAll("", "\u{200B}"),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 12.0),
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    color: Color.fromRGBO(210, 123, 116, 1),
                                    size: 14.0,
                                  ),
                                  SizedBox(width: 4.0),
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        'Expiring in ${foodRewards[index].daysLeft.toString()} days',
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(210, 123, 116, 1),
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      'Use Now',
                                      style: TextStyle(
                                        color: Color.fromRGBO(91, 166, 180, 1),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            color: Color.fromRGBO(0, 177, 79, 1),
            padding: EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 16.0,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.account_balance_wallet,
                  color: Colors.white,
                  size: 16.0,
                ),
                SizedBox(width: 12.0),
                Text(
                  'Get More Rewards',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Icon(
                  Icons.stars,
                  color: Colors.white,
                  size: 16.0,
                ),
                SizedBox(width: 6.0),
                Text(
                  '1,234 Points',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w300,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
