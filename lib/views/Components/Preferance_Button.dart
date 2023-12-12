import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Preferance_Button extends StatelessWidget {
    Preferance_Button({
    this.onTap,
    required this.iconColor,
    required this.header,
    required this.desc,
    required this.btnIcon,

      super.key,
    });


    VoidCallback? onTap;
    Color iconColor;
    String header;
    String desc;
    IconData btnIcon;

    @override
    Widget build(BuildContext context) {
      return SliverToBoxAdapter(
        child: Padding(
          padding:const  EdgeInsets.symmetric(horizontal: 15.0),
          child: InkWell(
            onTap: onTap,
            highlightColor: Colors.white30,
            child: Container(
              // margin: EdgeInsets.only(top: Get.height * 0.01),
              decoration: BoxDecoration(
                  border: Border.all(width: 1),
              ),
                width: Get.width * 9,
                height: Get.height * 0.09,
              child: Row(
                children: [
                  SizedBox(
                    width: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
            
                        Icon(btnIcon, size: 32, color: iconColor,)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      // color: Colors.amber,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [ 
                          Text('$header', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                          Text('$desc', style: TextStyle(color: Colors.grey),)
                        ],
                      ),
                    ),
                  )
                ],
              )
            ),
          ),
        ),
      );
    }
  }