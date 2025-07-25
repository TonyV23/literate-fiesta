import 'package:flutter/material.dart';

class PopularProducts extends StatelessWidget {
    const PopularProducts({super.key});

    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Text("Popular Products", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                    GestureDetector(onTap: () {}, 
                        child: Text("See All", style: TextStyle(color: Theme.of(context).primaryColor),),)
                ],
            ),
        );
    }
}
