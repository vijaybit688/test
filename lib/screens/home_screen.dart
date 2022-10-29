import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:task_flutter/provider/product_provider.dart';

import '../model/loginModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              height: 35,
              child: TextFormField(
                onChanged: (value) {
                  List<ProductModel> list = [];
                  searchedProduct(list, value);
                },
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: Colors.black)),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search the items here'),
              ),
            ),
            TextButton(onPressed: (){
              List<ProductModel> listOfProduct = [
                ProductModel(productName: "aColgate",productPrize: "100"),
                ProductModel(productName: "bColgate",productPrize: "100"),
                ProductModel(productName: "cColgate",productPrize: "100"),
                ProductModel(productName: "dColgate",productPrize: "100"),
                ProductModel(productName: "eColgate",productPrize: "100"),
                ProductModel(productName: "fColgate",productPrize: "100")
              ];
              Provider.of<ProductProvider>(context, listen: false).addProduct(listOfProduct);
            }, child: Text("Reset")),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 1.2,
              child: SingleChildScrollView(
                child: GridView.builder(
                  shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: Provider.of<ProductProvider>(context).listOfProduct.length ?? 0,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return Container(
                        width: 200,
                        height: 200,
                        child: Column(
                          children: [
                            CachedNetworkImage(
                                placeholder: (b, c) => Container(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator()),
                                imageUrl:
                                    "https://i.postimg.cc/d3WfNYX8/signup.png"),
                            Text(Provider.of<ProductProvider>(context).listOfProduct[index].productName),
                            Text(Provider.of<ProductProvider>(context).listOfProduct[index].productPrize),
                          ],
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      );
  }

  List<ProductModel> searchedProduct(List<ProductModel> list, String st) {
    List<ProductModel> addItems = [];
    for (var x in list) {
      if (x.productName.length >= st.length) {
        if (x.productName.substring(0, st.length).toLowerCase() == st) {
          addItems.add(x);
        }
      }
    }
    Provider.of<ProductProvider>(context, listen: false).addProduct(addItems);
    return addItems;
  }
}
