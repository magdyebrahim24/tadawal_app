import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tadawal/app.dart';
import 'package:tadawal/bloc_observer.dart';
import 'injection_container.dart' as di;
// void main (){
//   runApp(const TadawalApp());
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  Bloc.observer = AppBlocObserver();
  runApp(const TadawalApp());
}


// build structure folders
// create utils -> config
// create app Colors && app string  && Hex Color --> core/utils
// handle font && images in pub spec and create their folder in project
// add font  -- variable in app strings
// add images -- create core / utils / assets manger  to deal with images

/* create routes  -- config/app routes
1- anonymous routing  (small projects)
2- named routes   ( small and medium projects )
3 - generate route (big projects)  --> will use it
 */

// add media query extension

// --->> domain layer
// create product entity
// create use case and error   < /core > using call and zDart
// create repositories

// ----------- data layer ----------------
// create product model
// work in repositories
// error / network info     --> to check network state if connected get data from remote else get data from cached
// dataSources   --> create product local && product remote (data sources construct)
// create core/error / exceptions
// complete repositories
// use internet_connection_checker package to check internet  --> create NetworkInfoImpl in NetworkInfo
// finish product remote data

