import 'package:flutter/material.dart';
import 'package:pablo/utils/app_textstyles.dart';

class SaleBanner extends StatelessWidget {
    const SaleBanner({super.key});

    @override
    Widget build(BuildContext context) {
        return Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
                children: [
                    Expanded(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Text("Get your", style: AppTextstyles.withColor(AppTextstyles.h3, Colors.white),),
                                Text("Special Sale", style: AppTextstyles.withColor(AppTextstyles.withWeight(AppTextstyles.h2, FontWeight.bold), Colors.white),),
                                Text("Up to 40%", style: AppTextstyles.withColor(AppTextstyles.h3, Colors.white),),
                            ],
                        )),
                    ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        ), child: Text("Shop now", style: AppTextstyles.buttonMedium,))
                ],
            ),
        );
    }
}
