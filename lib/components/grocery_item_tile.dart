import 'package:flutter/material.dart';

class GroceryItemTile extends StatelessWidget {
  final String itemname;
  final String itemprice;
  final String imgpath;
  final color;

  void Function()? onPressed;

  GroceryItemTile({
    super.key,
    required this.itemname,
    required this.itemprice,
    required this.imgpath,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(color: color[100]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              imgpath,
              height: 100,
            ),
            Text(itemname),
            MaterialButton(
              onPressed: onPressed,
              color: color[800],
              child: Text(
                '\₹' + itemprice,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
