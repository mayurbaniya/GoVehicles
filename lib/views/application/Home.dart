import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gov/views/Components/Drawer.dart';
import 'package:gov/views/Components/Preferance_Button.dart';
import 'package:gov/views/application/Discover/ByBodyStyle.dart';
import 'package:gov/views/application/Discover/ByBrand.dart';
import 'package:gov/views/application/Discover/ByBudget.dart';
import 'package:gov/views/application/Discover/ByDisplacement.dart';
import 'package:gov/views/application/Search.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            
            backgroundColor: Colors.redAccent,
            elevation: 0,
            stretch: true,
            pinned: true,
            centerTitle: false,
            expandedHeight: MediaQuery.of(context).size.height * 0.33,
            flexibleSpace: const FlexibleSpaceBar(
              background: Image(
                image: AssetImage('assets/images/banner/banner_main.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: Get.height * 0.02,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                height: Get.height * 0.07,
                child: TextField(
                  readOnly: true,
                  onTap: () {
                    Get.to(SearchPage(),
                        transition: Transition.circularReveal,
                        duration: Duration(milliseconds: 500));
                  },
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      hintText: 'Search your ride',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            width: 0.5,
                          )),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        enableFeedback: false,
                        splashRadius: 15,
                        onPressed: () {
                          Fluttertoast.showToast(msg: 'oops.. is that a easter egg? ');
                        },
                      )),
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: SizedBox(
                child: Text(
                  'Discover Vehicles',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Preferance_Button(
              onTap: () => Get.to(const ByBrand(),
                  transition: Transition.cupertino,
                  duration: Duration(milliseconds: 1200)),
              btnIcon: Icons.star_outline,
              header: "Brand",
              iconColor: Colors.redAccent,
              desc: "View vehicles of your favourite brand"),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(),
            ),
          ),
          Preferance_Button(
              onTap: () => Get.to(const ByBudget(),
                  transition: Transition.cupertino,
                  duration: Duration(milliseconds: 1200)),
              btnIcon: Icons.attach_money_sharp,
              header: "Budget",
              iconColor: Colors.redAccent,
              desc: "View vehicles in your price range"),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(),
            ),
          ),
          Preferance_Button(
              onTap: () => Get.to(const ByDisplacement(),
                  transition: Transition.cupertino,
                  duration: Duration(milliseconds: 1200)),
              btnIcon: Icons.speed,
              header: "Displacement",
              iconColor: Colors.redAccent,
              desc: "View vehicles with your desired displacement"),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(),
            ),
          ),
          Preferance_Button(
              onTap: () => Get.to(const ByBodyStyle(),
                  transition: Transition.cupertino,
                  duration: Duration(milliseconds: 1200)),
              btnIcon: Icons.pedal_bike_rounded,
              header: "Body Style",
              iconColor: Colors.redAccent,
              desc: "View vehicles that suit your riding style"),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Center(child: Text('Item $index')),
                );
              },
              childCount: 20,
            ),
          )
        ],
      ),
    );
  }
}
