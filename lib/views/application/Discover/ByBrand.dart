import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gov/views/Components/DiscoverBy.dart';

class ByBrand extends StatefulWidget {
  const ByBrand({super.key});

  @override
  State<ByBrand> createState() => _ByBrandState();
}

class _ByBrandState extends State<ByBrand> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getBrands();
  }

  void getBrands() async {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title:  RichText(
              text: const TextSpan(
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    // fontFamily: 'fontmain',
                  ),
                  children: <TextSpan>[
                TextSpan(text: 'Br'),
                TextSpan(
                    text: 'ands', style: TextStyle(color: Colors.black))
              ])),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: Get.height * 0.04),
                  width: Get.width * 0.98,
                  height: Get.height * 0.06,
                  child: TextField(
                    textAlignVertical: TextAlignVertical.bottom,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.search, color: Colors.redAccent,),
                        hintText: 'Search',
                        hintStyle: TextStyle(fontSize: 18),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 1,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                              width: 1,
                            ))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: RichText(
              text: const TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    // fontFamily: 'fontmain',
                  ),
                  children: <TextSpan>[
                TextSpan(text: 'What'),
                TextSpan(
                    text: ' Brand ', style: TextStyle(color: Colors.redAccent)),
                TextSpan(
                    text: 'do you prefer?', style: TextStyle(color: Colors.black))
              ])),
              ),
              // DiscoverBy(
              //     mainImage: 'assets/images/icons/brands.jpeg',
              //     mainText: 'Brands',
              //     subText: 'with best offers ->',
              //     backgroundColor: 0xFF825BF6),
            ],
          )),
    );
  }
}
