import 'package:flutter/material.dart';
import 'package:grabFood/data/Products.dart';

class ProductViewPage extends StatefulWidget {
  final Product product;

  ProductViewPage({@required this.product});

  @override
  _ProductViewPageState createState() => _ProductViewPageState();
}

class _ProductViewPageState extends State<ProductViewPage> {
  bool isChecked = false;
  double totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    totalPrice = widget.product.price;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      (widget.product.imageUrl != "")
                          ? Hero(
                              tag: widget.product.id,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * .30,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      widget.product.imageUrl,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : SizedBox(height: 75.0),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        margin: EdgeInsets.only(bottom: 12.0),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  widget.product.name,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  widget.product.price.toString(),
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Base price",
                                style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                            (widget.product.description != "")
                                ? Container(
                                    width: MediaQuery.of(context).size.width,
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      widget.product.description,
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  )
                                : SizedBox.shrink(),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20.0),
                        margin: EdgeInsets.only(bottom: 12.0),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  'Add On',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Text(
                                  'Optional, max 1',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15.0),
                            Row(
                              children: <Widget>[
                                Theme(
                                  data: ThemeData(
                                    unselectedWidgetColor: Colors.black45,
                                  ),
                                  child: Checkbox(
                                    value: isChecked,
                                    onChanged: (bool) {
                                      setState(() {
                                        isChecked = !isChecked;
                                        totalPrice = totalPrice + 69;
                                      });
                                      print(widget.product.price);
                                    },
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Expanded(
                                  child: Text(
                                    'Quinoa Add-on',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                                Text(
                                  '+69.00',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14.0,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 12.0),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(
                                top: 20.0,
                                left: 20.0,
                                right: 20.0,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    'Special Instructions',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 10.0),
                                  Text(
                                    'Optional',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15.0),
                            Divider(
                              color: Colors.black26,
                              thickness: 0.5,
                              height: 5.0,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'E.g: No onions, please',
                                    hintStyle: TextStyle(
                                      color: Colors.black45,
                                    )),
                              ),
                            ),
                            Divider(
                              color: Colors.black26,
                              thickness: 0.5,
                              height: 5.0,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black26,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8.0),
                                      ),
                                    ),
                                    child: IconButton(
                                      icon: Icon(Icons.remove),
                                      color: Color.fromRGBO(0, 177, 79, 1),
                                      onPressed: () {},
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 24.0,
                                    ),
                                    child: Text(
                                      '1',
                                      style: TextStyle(
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black26,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8.0),
                                      ),
                                    ),
                                    child: IconButton(
                                      icon: Icon(Icons.add),
                                      color: Color.fromRGBO(0, 177, 79, 1),
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 6.0,
                ),
                width: double.maxFinite,
                child: RaisedButton(
                  onPressed: () {},
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                  color: Color.fromRGBO(0, 177, 79, 1),
                  padding: EdgeInsets.symmetric(vertical: 14.0),
                  child: Text(
                    'Add to Basket - $totalPrice',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 32.0,
              horizontal: 12.0,
            ),
            alignment: Alignment.topLeft,
            child: CircleAvatar(
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
          ),
        ],
      ),
    );
  }
}
