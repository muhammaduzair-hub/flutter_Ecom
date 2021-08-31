import 'package:flutter/material.dart';

class Cart_Products extends StatefulWidget {
  @override
  _Cart_ProductsState createState() => _Cart_ProductsState();
}

class _Cart_ProductsState extends State<Cart_Products> {

  var Products_on_cart = [
    {
      "name":"Blazer",
      "picture":"Images/products/blazer1.jpeg",
      "size":"M",
      "color":"Red",
      "quantity":1,
      "price":100
    },
    {
      "name":"Red dress",
      "picture":"Images/products/dress1.jpeg",
      "size":"M",
      "color":"Red",
      "quantity":1,
      "price":150
    },
    {
      "name":"Black dress",
      "picture":"Images/products/dress2.jpeg",
      "size":"M",
      "color":"Red",
      "quantity":1,
      "price":150
    },
    {
      "name":"Blazer",
      "picture":"Images/products/blazer2.jpeg",
      "price":1500,
      "size":"M",
      "color":"Red",
      "quantity":1,
    },
    {
      "name":"Red Hills",
      "picture":"Images/products/hills2.jpeg",
      "price":150,
      "size":"M",
      "color":"Red",
      "quantity":1,
    },

  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index){
          return Single_cart_production(
            cart_prod_name:  Products_on_cart[index]["name"],
            cart_prod_picture:  Products_on_cart[index]["picture"],
            cart_prod_price:  Products_on_cart[index]["price"],
            cart_prod_qty:  Products_on_cart[index]["quantity"],
            cart_prod_color:  Products_on_cart[index]["color"],
            cart_prod_size:  Products_on_cart[index]["size"],
          );
        },
      itemCount:  Products_on_cart.length,
    );
  }
}


class Single_cart_production extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qty;

  const Single_cart_production({Key key, this.cart_prod_name, this.cart_prod_picture, this.cart_prod_price, this.cart_prod_size, this.cart_prod_color, this.cart_prod_qty}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Card(
      child: ListTile(
        leading: Image.asset(cart_prod_picture, height: 80, width: 80.0,),
        title: Text(cart_prod_name),
        subtitle: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[

                //====this section is for the sizze of product
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("Size:"),
                ),

                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(cart_prod_size, style: TextStyle(color: Colors.red,),),
                ),

                //====this section is for the Color of product
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8, 8, 8),
                  child: new Text("Color:"),
                ),

                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new Text(cart_prod_color , style: TextStyle(color: Colors.red,)),
                ),


              ],
            ),

            new Container(
              alignment: Alignment.topLeft,
              child: Text("\$${cart_prod_price}", style: TextStyle(color: Colors.red, fontSize: 17),),
            ),
          ],
        ),
        trailing: Column(
          children: <Widget>[

            Text(cart_prod_qty.toString(), style:TextStyle(fontSize: 20, color: Colors.red) ,)

          ],
        ),


      ),
    );
  }
}
