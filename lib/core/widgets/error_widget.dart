
import 'package:flutter/material.dart';

Widget errorWidget(BuildContext context,{required VoidCallback onPressFun , String msg = ''}){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: [
      Text('Opps ... \n Retry Again' , style: Theme.of(context).textTheme.headline6,),
      const SizedBox(height: 12,),
      Text(msg , style: Theme.of(context).textTheme.bodyText1),
      const SizedBox(height: 20,),
      ElevatedButton(onPressed: onPressFun, child: const Text('Retry'),)
    ],
  );
}