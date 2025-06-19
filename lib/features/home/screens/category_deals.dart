import 'package:flutter/material.dart';
import 'package:shopnest/constants/global_variables.dart';

class CategoryDeals extends StatefulWidget {
  final String category;
  static const String routeName = '/category-deals';
  const CategoryDeals({super.key, required this.category});

  @override
  State<CategoryDeals> createState() => _CategoryDealsState();
}

class _CategoryDealsState extends State<CategoryDeals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: GlobalVariables.appBarGradient,
              ),
            ),
            title: Text(
              widget.category,
              style: TextStyle(color: Colors.black),
            )),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            alignment: Alignment.topLeft,
            child: Text(
              "Keep shopping for ${widget.category}",
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 170,
            child: GridView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.5,
                    mainAxisSpacing: 10,
                    crossAxisCount: 1),
                itemBuilder: (context, index) {
                  return Text('hello');
                }),
          )
        ],
      ),
    );
  }
}
