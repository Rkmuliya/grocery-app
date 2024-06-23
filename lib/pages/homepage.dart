import 'package:flutter/material.dart';
import 'package:groceryapp/model/cart_model.dart';
import 'package:provider/provider.dart';

import '../components/grocery_item_tile.dart';
import 'cartpage.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        },
        backgroundColor: Colors.indigo,
        child: Icon(Icons.shopping_bag),
      ),
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 210),
              child: Text(
                "Welcome",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                thickness: 2,
                color: Colors.white60,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 10, left: 20),
              child: Text(
                "Let's order fresh items for you",
                style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                thickness: 2,
                color: Colors.white60,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Fresh items",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(child: Consumer<CartModel>(
              builder: (context, value, child) {
                return GridView.builder(
                  shrinkWrap: true,
                  itemCount: value.shopitem.length,
                  padding: EdgeInsets.all(12.0),
                  itemBuilder: (context, index) {
                    return GroceryItemTile(
                      itemname: value.shopitem[index][0],
                      itemprice: value.shopitem[index][1],
                      imgpath: value.shopitem[index][2],
                      color: value.shopitem[index][3],
                      onPressed: () {
                        Provider.of<CartModel>(context, listen: false)
                            .additemtocart(index);
                      },
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.3,
                  ),
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
