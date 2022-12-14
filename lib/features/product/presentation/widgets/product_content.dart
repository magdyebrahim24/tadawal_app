import 'package:flutter/material.dart';
import 'package:tadawal/features/product/domain/entity/product.dart';

Widget productContent(BuildContext context, {required Product product}) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(product.tittle, style: Theme.of(context).textTheme.headline6),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(product.description,
              style: Theme.of(context).textTheme.bodyText1),
        ),
        Text('${product.price.toString()}  \$',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.blue, fontWeight: FontWeight.bold)),
      ],
    ),
  );
}
