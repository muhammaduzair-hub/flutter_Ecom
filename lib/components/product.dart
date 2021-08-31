import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecom_app/Pages/product_detail.dart';


class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
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
    {
      "name":"Black Hills",
      "picture":"Images/products/hills1.jpeg",
      "old_price":100,
      "price":150
    },
    {
      "name":"Red Hills",
      "picture":"Images/products/hills2.jpeg",
      "old_price":100,
      "price":150
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
              onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>new ProductDetails(
                prod_name:prod_name ,
                prod_price: prod_price,
                prod_oldPrice: prod_old_price,
                prod_pic: prod_pricture,
              ))),
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
