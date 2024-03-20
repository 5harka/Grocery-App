import 'package:bloc_one/features/home/model/ProductDataModel.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  const ProductTileWidget({super.key, required this.productDataModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                    image: NetworkImage(productDataModel.imageUrl))),
          ),
          Text(productDataModel.name),
          Text(productDataModel.description)
        ],
      ),
    );
  }
}
