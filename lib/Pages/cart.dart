import 'package:flutter/material.dart';
import 'package:flutter_ecom_app/components/cart_product.dart';



class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: Text("Shopping Cart"),

      ),
      body: Cart_Products(),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(child: ListTile(
              title: Text("Total:"),
              subtitle: Text("\$230"),
            )),

            Expanded(
                child: MaterialButton(
                  onPressed: (){},
                  child: Text("Check Out", style: TextStyle(color: Colors.white),),
                  color: Colors.red,
                )
            ),
          ],
        ),
      ),
    );
  }
}
