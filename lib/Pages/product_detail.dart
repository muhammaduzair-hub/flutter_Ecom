
import 'package:flutter/material.dart';

import 'cart.dart';


class ProductDetails extends StatefulWidget {
  final prod_name;
  final prod_price;
  final prod_oldPrice;
  final prod_pic;

  const ProductDetails({Key key, this.prod_name, this.prod_price, this.prod_oldPrice, this.prod_pic}) : super(key: key);
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        // leading: GestureDetector(
        //     child: Icon(Icons.arrow_back,),
        //     onTap: ()=>Navigator.of(context).pop(),
        // ),
        backgroundColor: Colors.red,
        title: Text("Shopping App"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white,), onPressed: ()=>{
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()))
          }),
          IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: ()=>{}),

        ],
      ),
      body: new ListView(
        children: <Widget>[
          Container(
            height: 300.0,
            color: Colors.black,
            child: GridTile(
                child: Container(
                  color: Colors.white,
                    child: Image.asset(widget.prod_pic ,)
                ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(widget.prod_name.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
                  title: Row(
                    children: <Widget>[
                      Expanded(child: Text("\$${widget.prod_oldPrice}", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w800, decoration: TextDecoration.lineThrough),)),
                      Expanded(child: Text("\$${widget.prod_price}", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold))),

                    ],
                  ),
                ),
              ),
            ),
          ),

          //======================Selection Row ======================
          Row(
            children: <Widget>[
              //======Size Button ======
              Expanded(
                  child: MaterialButton(
                    elevation: 0.2,
                    onPressed: (){
                      showDialog(
                          context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Size"),
                          content: Text("Choose The Size"),
                          actions: <Widget>[
                            MaterialButton(
                              onPressed: (){
                                Navigator.of(context).pop(context);
                              },
                              child: Text("Close", style: TextStyle(color: Colors.red),),
                            )
                          ],
                        ),
                      );
                    },
                    color: Colors.white,
                    textColor: Colors.grey,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text("Size"),
                        ),
                        Expanded(
                          child: Icon(Icons.arrow_drop_down),
                        ),
                      ],
                    ),
                  ),
              ),
//    ============== Color Button ===============
              Expanded(
                child: MaterialButton(
                  elevation: 0.2,
                  onPressed: (){
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Colours"),
                        content: Text("Choose The Colour"),
                        actions: <Widget>[
                          MaterialButton(
                            onPressed: (){
                              Navigator.of(context).pop(context);
                            },
                            child: Text("Close", style: TextStyle(color: Colors.red),),
                          )
                        ],
                      ),
                    );
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("Color"),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
//    =====================Quantity Button ==============
              Expanded(
                child: MaterialButton(
                  elevation: 0.2,
                  onPressed: (){
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Quantity"),
                        content: Text("Choose The Quantity"),
                        actions: <Widget>[
                          MaterialButton(
                            onPressed: (){
                              Navigator.of(context).pop(context);
                            },
                            child: Text("Close", style: TextStyle(color: Colors.red),),
                          )
                        ],
                      ),
                    );
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("QTY"),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          //==========BUY BUTTOn===================
          Row(
            children: <Widget>[
              Expanded(
                  child: MaterialButton(
                    onPressed: ()=>{},
                    elevation: 0.2,
                    color: Colors.red,
                    textColor: Colors.white,
                    child: Text("Buy Now"),
                  ),
              ),

              IconButton(
                icon:Icon(Icons.add_shopping_cart, color: Colors.red,),
                onPressed: (){},
              ),
              IconButton(
                  icon: Icon(Icons.favorite_border, color: Colors.red,),
                  onPressed: (){}
                  ),
            ],
          ),
          Divider(color: Colors.grey,),
          ListTile(
            title: Text("Product Details"),
            subtitle: Text("Its has very good staff. Colour is very good and not removeable. We give you a 2 weeks guarenty on it. You can return it in case of any complain on that stuff."),
          ),
          Divider(color: Colors.grey,),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text("Product Name:",style: TextStyle(color: Colors.grey),),
              ),
              Padding(padding: EdgeInsets.all(5.0),
              child: Text(widget.prod_name),)
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text("Product Brand:",style: TextStyle(color: Colors.grey),),
              ),
              Padding(padding: EdgeInsets.all(5.0),
                //=====remember to create a product brand==========
                child: Text("Brand X"),)
            ],
          ),

          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text("Product Condition:",style: TextStyle(color: Colors.grey),),
              ),
              Padding(padding: EdgeInsets.all(5.0),
                //=======remember to create a conditon of brand=======
                child: Text("GOOD"),)
            ],
          ),
          Divider(color: Colors.grey,),
          Text("Similar Products"),
          Container(
            height: 300.0,
              child: SimilarProducts()
          ),
        ],
      ),
    );
  }
}


class SimilarProducts extends StatefulWidget {

  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
  var product_list =[
    {
      "name":"Blazer",
      "picture":"Images/products/blazer1.jpeg",
      "old_price":120,
      "price":100
    },
    {
      "name":"Red dress",
      "picture":"Images/products/dress1.jpeg",
      "old_price":100,
      "price":150
    },
    {
      "name":"Black dress",
      "picture":"Images/products/dress2.jpeg",
      "old_price":100,
      "price":150
    },
    {
      "name":"Blazer",
      "picture":"Images/products/blazer2.jpeg",
      "old_price":2000,
      "price":1500
    },


  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: product_list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder:(BuildContext context, int index){
          return Single_prod(
            prod_name: product_list[index]['name'],
            prod_pricture:product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_pricture;
  final prod_old_price;
  final prod_price;

  Single_prod({
    this.prod_name,
    this.prod_pricture,
    this.prod_old_price,
    this.prod_price,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Hero(
          tag: Text("hero 1"),
          child: Material(
            child: InkWell(
              onTap: (){
                Navigator.of(context).pop(context);
                Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>new ProductDetails(
                prod_name:prod_name ,
                prod_price: prod_price,
                prod_oldPrice: prod_old_price,
                prod_pic: prod_pricture,
              )));},
              child: GridTile(
                footer: Container(
                  color: Colors.white60,
                  child: ListTile(
                    leading: Text(prod_name, style: TextStyle(fontWeight: FontWeight.bold),),
                    title: Text("\$$prod_price", style: TextStyle(color: Colors.red, fontWeight: FontWeight.w800),),
                    subtitle: Text("\$$prod_old_price", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w800, decoration: TextDecoration.lineThrough),),
                  ),

                ),
                child: Image.asset(prod_pricture , fit: BoxFit.cover,),

              ),
            ),
          ),
        ),
      ),
    );
  }
}