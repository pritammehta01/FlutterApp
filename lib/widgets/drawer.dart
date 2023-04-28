import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  accountName: Text("User"),
                  accountEmail: Text("Example@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/images/user.png",
                    ),
                  ),
                  otherAccountsPictures: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/images/happy.png",
                      ),
                    )
                  ],
                )),
            ListTile(
                leading: Icon(
                  CupertinoIcons.home,
                ),
                title: "Home".text.xl.make()),
            ListTile(
                leading: Icon(
                  CupertinoIcons.mail,
                ),
                title: "Contact Us".text.xl.make()),
            ListTile(
                leading: Icon(
                  Icons.settings,
                ),
                title: "Settings".text.xl.make()),
            ListTile(
                leading: Icon(
                  Icons.share,
                ),
                title: "Invite Freinds".text.xl.make()),
            ListTile(
                leading: Icon(
                  Icons.bug_report,
                ),
                title: "Report Bug".text.xl.make())
          ],
        ),
      ),
    );
  }
}
