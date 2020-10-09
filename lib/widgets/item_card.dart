import 'package:flutter/material.dart';
import 'package:virtualmarriageME/model/ProductData.dart';
import 'package:virtualmarriageME/utils/Constants.dart';


class ItemCard extends StatelessWidget {
  final ProductData product;
  final Function press;
  const ItemCard({
    Key key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
             // padding: EdgeInsets.all(kDefaultPaddin),
              // For  demo we use fixed height  and width
              // Now we dont need them
              // height: 180,
              // width: 160,
              decoration: BoxDecoration(
                //color: product.color,
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Hero(
                tag: "${product.ID}",
                //child: Image.asset(product.image),
                //child: Image.network(product.imagename, fit: BoxFit.fill,),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  //child: Image.network(product.imagename, fit: BoxFit.fill,),
                  child: Image.asset("assets/girl_image.png", fit: BoxFit.fill,),
                )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              'Anjali Sharma',
              style: TextStyle(color: kTextColor),
            ),
          ),
          Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 5,),
              Text(
                "Online",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}