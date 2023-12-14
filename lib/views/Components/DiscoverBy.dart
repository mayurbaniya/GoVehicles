import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DiscoverBy extends StatelessWidget {
  DiscoverBy({
    required this.mainImage,
    required this.mainText,
    required this.subText,
    required this.backgroundColor,
    required this.onTap,
    super.key,
  });

   String mainImage;
   String mainText;
   String subText;
   int backgroundColor;
   VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      focusColor: Colors.grey,
      child: Container(
        width: Get.width * 0.4, // < -this width
        height: Get.height * 0.2,
        decoration: BoxDecoration(
          color: Color(backgroundColor),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('$mainImage'),
              height:
                  Get.height * 0.13, 
            ),
            SizedBox(
                height: 1),
            Text(
              '$mainText',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text('$subText',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white60,
            ),)
          ],
        ),
      ),
    );
  }
}
