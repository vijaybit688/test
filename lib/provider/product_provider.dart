import 'package:flutter/cupertino.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> listOfProduct = [
    ProductModel(productName: "aColgate",productPrize: "100"),
    ProductModel(productName: "bColgate",productPrize: "100"),
    ProductModel(productName: "cColgate",productPrize: "100"),
    ProductModel(productName: "dColgate",productPrize: "100"),
    ProductModel(productName: "eColgate",productPrize: "100"),
    ProductModel(productName: "fColgate",productPrize: "100")
  ];
  addProduct(List<ProductModel> list) {
    listOfProduct = list;
    notifyListeners();
  }
}

class ProductModel {
  ProductModel({required this.productName,required this.productPrize});
  late String productName;
  late String productPrize;
}
