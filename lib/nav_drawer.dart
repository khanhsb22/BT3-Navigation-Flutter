import 'package:flutter/material.dart';
import 'package:fultterapp/layout.dart';
import 'package:fultterapp/list_view.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text('Side menu',
                style: TextStyle(color: Colors.white, fontSize: 25)),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage('images/pic5.jpg'))),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("ListView"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyList()));
            },
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text("Layout"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyLayout()));
            },
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text("Login"),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
