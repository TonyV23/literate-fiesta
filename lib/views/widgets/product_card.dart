import 'package:flutter/material.dart';
import 'package:pablo/utils/app_textstyles.dart';

import '../../models/product.dart';

class ProductCard extends StatelessWidget {
    final Product product;
    const ProductCard({super.key, required this.product});

    @override
    Widget build(BuildContext context) {

        final screenWidth = MediaQuery.of(context).size.width;
        final isDark = Theme.of(context).brightness == Brightness.dark;

        return Container(
            constraints: BoxConstraints(
                maxWidth: screenWidth * 0.9,
            ),
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                    BoxShadow(
                        color: isDark ? Colors.black.withValues(alpha: 0.3) : Colors.grey.withValues(alpha: 0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 2)
                    ),
                ],
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Stack(
                        children: [
                            // image
                            AspectRatio(aspectRatio: 16 / 9, child: ClipRRect(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(12)
                                    ),
                                    child: Image.asset(
                                        product.imageUrl,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                    ),
                                ),),

                            // favorite button
                            Positioned(top: 8, right: 8,
                                child: IconButton(
                                    onPressed: () {

                                    },
                                    icon: Icon(product.isFavorite ? Icons.favorite : Icons.favorite_outline),
                                    color: product.isFavorite ? Theme.of(context).primaryColor : isDark ? Colors.grey[400] : Colors.grey,
                                )),
                            if(product.oldPrice != null)
                            Positioned(
                                left: 8,
                                top: 8,
                                child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.circular(4)
                                    ),
                                    child: Text('${calculateDiscount(product.price, product.oldPrice!)}% OFF', style: AppTextstyles.withColor(AppTextstyles.withWeight(AppTextstyles.bodSmall, FontWeight.bold), Colors.white)),
                                ),
                            ),
                        ],
                    ),

                    // product details
                    Padding(
                        padding: EdgeInsets.all(screenWidth * 0.02), 
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Text(product.name,
                                    style: AppTextstyles.withColor(AppTextstyles.withWeight(AppTextstyles.h3, FontWeight.bold), Theme.of(context).textTheme.bodyLarge!.color!,),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: screenWidth * 0.01,),
                                Text(product.category,
                                    style: AppTextstyles.withColor(AppTextstyles.bodMedium, isDark ? Colors.grey[400]! : Colors.grey[600]!,),
                                ),
                                SizedBox(height: screenWidth * 0.01,),
                                Row(children: [
                                        Text('\BIF ${product.price.toStringAsFixed(2)}',
                                            style: AppTextstyles.withColor(AppTextstyles.withWeight(AppTextstyles.bodMedium, FontWeight.bold), Theme.of(context).textTheme.bodyLarge!.color!,),
                                        ),
                                        if(product.oldPrice != null) ...[
                                            SizedBox(width: screenWidth * 0.01,),
                                            Text('\BIF ${product.oldPrice!.toStringAsFixed(2)}',
                                                style: AppTextstyles.withColor(AppTextstyles.bodSmall, isDark ? Colors.grey[400]! : Colors.grey[600]!,).copyWith(decoration: TextDecoration.lineThrough),
                                            ),
                                        ],
                                    ],),
                            ],),
                    ),
                ],
            ),
        );
    }

    // calculate discount

    int calculateDiscount(double currentPrice, double oldPrice) {
        return (((oldPrice - currentPrice) / oldPrice) * 100).round();
    }
}
