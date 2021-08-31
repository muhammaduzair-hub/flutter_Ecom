import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            image_location: 'Images/cats/tshirt.png',
            image_caption: 'Shirts',
          ),
          Category(
            image_location: 'Images/cats/dress.png',
            image_caption: 'Dresses',
          ),
          Category(
            image_location: 'Images/cats/jeans.png',
            image_caption: 'Jeans',
          ),
          Category(
            image_location: 'Images/cats/shoe.png',
            image_caption: 'Shoes',
          ),
          Category(
            image_location: 'Images/cats/formal.png',
            image_caption: 'Formal',
          ),
          Category(
            image_location: 'Images/cats/informal.png',
            image_caption: 'Informal',
          ),
          Category(
            image_location: 'Images/cats/accessories.png',
            image_caption: 'Accessories',
          ),
        ],
      ),
    );
  }
}


class Category extends StatelessWidget {
  final String image_location ;
  final String image_caption;

  const Category({Key key, this.image_location, this.image_caption}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: InkWell(
        onTap: ()=>{},
        child: Container(
          width: 100.0,
          child: ListTile(
            subtitle: Container(
              child: Text(image_caption,
              style: TextStyle(fontSize: 12.0),),
              alignment: Alignment.topCenter,
            ),
            title: Image.asset(image_location,width: 100.0,height: 80.0,),

          ),
        ),
      ),
    );
  }
}
