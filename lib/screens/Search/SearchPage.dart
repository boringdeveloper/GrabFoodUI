import 'package:flutter/material.dart';
import 'package:grabFood/data/Restaurants.dart';
import 'package:grabFood/screens/Search/SearchListItem.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var popularCuisines = [
    'American',
    'Casual Dining',
    'Filipino',
    'Fast Food',
    'Asian',
    'Chicken',
    'Quick Bites',
    'Burgers',
    'Milk Tea',
    'Beverages',
    'Pizza',
    'Cafe'
  ];
  FocusNode searchFocusNode;
  TextEditingController searchTextCtrl = TextEditingController();
  String search = '';

  @override
  void dispose() {
    searchTextCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 247, 247, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
          ),
        ),
        title: Container(
          padding: EdgeInsets.all(12.0),
          width: MediaQuery.of(context).size.width,
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
              Expanded(
                child: Container(
                  child: TextField(
                    controller: searchTextCtrl,
                    onChanged: (value) {
                      setState(() {
                        search = value;
                      });
                    },
                    focusNode: searchFocusNode,
                    autofocus: true,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                    ),
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                      hintText: 'What are you craving?',
                      hintStyle: TextStyle(
                        color: Colors.black87,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: search == '' ? searchCategories() : searchResult(),
      ),
    );
  }

  Widget searchCategories() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 12.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular Cuisines',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
            child: Wrap(
              children: [...popularCuisines]
                  .map(
                    (cuisine) => GestureDetector(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        margin: EdgeInsets.symmetric(
                          horizontal: 2.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(239, 239, 239, 1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(16.0),
                          ),
                        ),
                        child: Text(
                          cuisine,
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          search = cuisine;
                          searchTextCtrl.value = TextEditingValue(
                            text: cuisine,
                            selection: TextSelection.fromPosition(
                              TextPosition(offset: cuisine.length),
                            ),
                          );
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
          Text(
            'All Cuisines',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              itemCount: popularCuisines.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      search = popularCuisines[index];
                      searchTextCtrl.value = TextEditingValue(
                        text: popularCuisines[index],
                        selection: TextSelection.fromPosition(
                          TextPosition(offset: popularCuisines[index].length),
                        ),
                      );
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 4.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black26,
                          width: 0.25,
                        ),
                      ),
                    ),
                    child: Text(
                      popularCuisines[index],
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget searchResult() {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      itemCount: restaurants.length,
      itemBuilder: (BuildContext ctxt, int index) {
        return GestureDetector(
          child: SearchListItem(
            restaurant: restaurants[index],
          ),
        );
      },
    );
  }
}
