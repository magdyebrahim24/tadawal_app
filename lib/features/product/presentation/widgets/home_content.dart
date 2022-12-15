import 'package:flutter/material.dart';
import 'package:tadawal/config/app_routes/app_routes.dart';
import 'package:tadawal/features/product/domain/entity/product.dart';

class HomeContent extends StatelessWidget {
  final List<Product> productsList;
  const HomeContent({super.key, required this.productsList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () => Navigator.pushNamed(context, Routes.productRoute,
              arguments: productsList[index].id.toInt()),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 7,),
            padding: const EdgeInsets.symmetric(vertical: 12 , horizontal: 17),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).primaryColor,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    image: DecorationImage(
                      image: NetworkImage(productsList[index].image.toString()),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              const  SizedBox(width: 15,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(productsList[index].tittle.toString(),
                          style: Theme.of(context).textTheme.bodyText1),
                      Text('${productsList[index].price.toString()} \$',
                          style: Theme.of(context).textTheme.subtitle1),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: productsList.length > 20 ? 20 : productsList.length,
    );
  }

}
