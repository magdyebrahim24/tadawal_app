import 'package:flutter/material.dart';
import 'package:tadawal/core/utils/media_query_values.dart';
import 'package:tadawal/features/product/domain/entity/product.dart';
import 'package:tadawal/core/widgets/float_button.dart';

Widget productContent(BuildContext context, {required Product product}) {
  return Container(
    width: context.width,
    height: context.height,
    decoration: BoxDecoration(
      color: Theme.of(context).primaryColor,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 3,
          blurRadius: 5,
          offset: const Offset(0, 2), // changes position of shadow
        ),
      ],
    ),
    padding: const EdgeInsets.all(17.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          floatButton(
              onPressFun: () => Navigator.pop(context),
              icon: Icons.arrow_back_rounded),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 24,
              ),
              Text(product.tittle,
                  style: Theme.of(context).textTheme.headline4,),
              const SizedBox(
                height: 7,
              ),
              Text(product.description,
                  style: Theme.of(context).textTheme.bodyText1,),
              const SizedBox(
                height: 10,
              ),
              Text(product.category,
                  style: Theme.of(context).textTheme.bodyText1,),
              SizedBox(
                height: context.height * .1,
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 4,
                    color: Colors.white38,
                  )),
                  Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      image: DecorationImage(
                        image: NetworkImage(product.image.toString()),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white38, width: 3),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: context.height * .2,
              ),
              Text('${product.price.toString()}  \$',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 22)),
            ],
          ),
        ],
      ),
    ),
  );
}
