import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tadawal/core/utils/app_strings.dart';
import 'package:tadawal/features/home/presentation/widgets/product_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const FaIcon(FontAwesomeIcons.barsStaggered),
            onPressed: () {}),
        actions: [
          IconButton(
              icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
              onPressed: () {}),
          IconButton(
              icon: const FaIcon(FontAwesomeIcons.filter), onPressed: () {})
        ],
        title: const Text(AppStrings.appName),
        centerTitle: true,
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: const[
            ProductCard(),
          ]),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.document_scanner_outlined),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
