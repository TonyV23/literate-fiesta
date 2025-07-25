import 'package:flutter/material.dart';
import 'package:pablo/models/product.dart';
import 'package:pablo/views/widgets/product_card.dart';

class GridProducts extends StatelessWidget {
    const GridProducts({super.key});

    @override
    Widget build(BuildContext context) {
        return GridView.builder(
            padding: EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.75, crossAxisSpacing: 16, mainAxisSpacing: 16),
            itemCount: products.length, 
            itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                    onTap: () {},
                    child: ProductCard(product: product),
                );
            },

        );
    }
}
