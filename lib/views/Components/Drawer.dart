import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gov/views/application/CheckUpdate.dart';
import 'package:gov/views/authpage/Login.dart';
import 'package:gov/views/authpage/LoginNew.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  var name;
  var email;
  var number;
  var gender;

  @override
  void initState() {
    // TODO: implement initState
    _setUserInfo();
    super.initState();
  }

  void _setUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name');
    email = prefs.getString('email');
    number = prefs.getString('number');
    gender = prefs.getString('gender');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('$name'),
            accountEmail: Text('$email'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                  child: gender == 'Male'
                      ? Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQEZrATmgHOi5ls0YCCQBTkocia_atSw0X-Q&usqp=CAU',
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          'https://media.licdn.com/dms/image/D5603AQHwbobAM41kFQ/profile-displayphoto-shrink_200_200/0/1695148149962?e=2147483647&v=beta&t=BAjBBRU07_3kNpc3CpVOSivFDFoeWAgjhBDafG9jsZk',
                          fit: BoxFit.cover,
                        )),
            ),
            decoration: BoxDecoration(
              color: Colors.redAccent,
            ),
          ),

          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favourite'),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('share'),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.policy),
            title: Text('Policies'),
            onTap: (){

            },
          ),
           ListTile(
            leading: Icon(Icons.update),
            title: Text('update'),
            onTap: (){
              Get.to(CheckUpdate());
            },
            trailing: Icon(Icons.one_k),
          ),
          ListTile(
            leading: Icon(Icons.logout_sharp),
            title: Text('Logout'),
            onTap: () async{
            final  SharedPreferences prefs =await SharedPreferences.getInstance();
              prefs.setBool('loggedIn', false);
              Get.offAll(LoginNew());
            },
          ),
        ],
      ),
    );
  }
}
