import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gov/views/Components/DiscoverBy.dart';
import 'package:gov/views/Components/Drawer.dart';
import 'package:gov/views/application/Discover/ByBrand.dart';
import 'package:gov/views/application/Search.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: RichText(
              text: const TextSpan(
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'fontmain',
                  ),
                  children: <TextSpan>[
                TextSpan(text: 'Go'),
                TextSpan(
                    text: 'Vehicles', style: TextStyle(color: Colors.black))
              ])),
          actions: const <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.location_on_outlined),
                  Text(
                    'Nagpur',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 16,
                      color: Colors.blueGrey,
                      decoration: TextDecoration.underline,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        drawer: MyDrawer(),
        body: ListView(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: Get.height * 0.03),
                width: Get.width * 0.95,
                height: Get.height * 0.07,
                decoration: BoxDecoration(),
                child: TextField(
                  onTap: () {
                    Get.to(new SearchPage(),
                        transition: Transition.cupertino,
                        duration: Duration(milliseconds: 1200));
                  },
                  readOnly: true,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search, color: Colors.redAccent,),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    hintText: 'Search your ride....',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        )),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: RichText(
              text: const TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    // fontFamily: 'fontmain',
                  ),
                  children: <TextSpan>[
                TextSpan(text: 'Pinpoint available '),
                TextSpan(
                    text: 'Vehicles', style: TextStyle(color: Colors.redAccent))
              ])),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DiscoverBy(
                    onTap: () {
                      Get.to(ByBrand(),
                          transition: Transition.cupertino,
                          duration: Duration(milliseconds: 1200));
                    },
                    mainImage: 'assets/images/icons/brands.jpeg',
                    mainText: 'Brands',
                    subText: 'with offers',
                    backgroundColor: 0xFF825BF6),
                DiscoverBy(
                    onTap: () {
                      print('budget');
                      
                    },
                    mainImage: 'assets/images/icons/budget.jpeg',
                    mainText: 'Budget',
                    subText: 'get idea',
                    backgroundColor: 0xFFFFC8AB),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DiscoverBy(
                      onTap: () {
                        print('displacement');
                      },
                      mainImage: 'assets/images/icons/displacement.jpeg',
                      mainText: 'Displacement',
                      subText: 'speed....',
                      backgroundColor: 0xFF93EAF4),
                  DiscoverBy(
                      onTap: () {
                        print('body style');
                      },
                      mainImage: 'assets/images/icons/body-style.jpeg',
                      mainText: 'Body style',
                      subText: 'sports bike....',
                      backgroundColor: 0xFFFD785F),
                ],
              ),
            ),

           ListTile(title: Text('index'),),
          ],


        ));
  }
}
