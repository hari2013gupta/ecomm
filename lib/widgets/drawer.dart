import 'package:ecomm/model/user.dart';
import 'package:ecomm/ui/product/product_view.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key, this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(context, user),
          _createDrawerItem(
              icon: Icons.home,
              color: Colors.blueGrey,
              text: 'Home',
              onTap: () {
                // Navigator.pop(context);
                // Navigator.of(context).push(MaterialPageRoute(
                //   // builder: (BuildContext context) => MVVMHome(),
                //   // builder: (BuildContext context) => MVVMBuilderHome(),
                //   builder: (BuildContext context) => MVVMBuilderHome2(),
                //   // builder: (BuildContext context) => CounterHomeMVP(CounterPresenterImpl(), title: "Counter Screen"),
                // ));
              }),
          _createDrawerItem(
              icon: Icons.account_box,
              color: Colors.orange,
              text: 'My Account',
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => ProductPage(),
                ));
              }),
          _createDrawerItem(
              icon: Icons.shopping_basket,
              color: Colors.purple,
              text: 'My Booking',
              onTap: () {
                // Navigator.pop(context);
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (BuildContext context) => TravelScreen(),
                // ));
              }),
          _createDrawerItem(
              icon: Icons.dashboard,
              color: Colors.cyan,
              text: 'Categories',
              onTap: () {
                // Navigator.pop(context);
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (BuildContext context) => OnboardingScreen(),
                // ));
              }),
          _createDrawerItem(
              icon: Icons.favorite,
              color: Colors.red,
              text: 'Favourite',
              onTap: () {
                // Navigator.pop(context);
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (BuildContext context) => EventScreen(),
                // ));
              }),
          Divider(),
          _createDrawerItem(
              icon: Icons.settings,
              color: Colors.blue,
              text: 'Settings',
              onTap: () {
                // Navigator.pop(context);
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (BuildContext context) => SlideShow(),
                // ));
              }),
          _createDrawerItem(
              icon: Icons.help,
              color: Colors.green,
              text: 'About',
              onTap: () {
                Navigator.pop(context);
                // Navigator.of(context).pushNamed('/page2');
                Navigator.of(context).push(MaterialPageRoute(
                  // builder: (BuildContext context) => new HomePageBMI(new BasicBMIPresenter()),
                ));
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (context) => Page2(title: "Page 2",)));
              }),
          Divider(),
          ListTile(
            title: Text('v0.0.1'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

Widget _createDrawerItem(
    {IconData icon, Color color, String text, GestureTapCallback onTap}) {
  return InkWell(
    child: ListTile(
      // trailing: Icon(icon),
      // leading: Icon(icon, color: color),
      title: Row(
        children: <Widget>[
          Icon(icon, color: color),
          Padding(
            padding: EdgeInsets.only(left: 30.0),
            child: Text(text),
          )
        ],
      ),
    ),
    onTap: onTap,
  );
}

Widget _createHeader(BuildContext context, User user) {
  return UserAccountsDrawerHeader(

    accountName: Text('Hariom Gupta'),
    accountEmail: Text('hk.mca08@gmail.com'),
    currentAccountPicture: GestureDetector(
      child: CircleAvatar(
        backgroundColor: Colors.grey,
        child: Icon(
          Icons.person,
          color: Colors.white,
        ),
      ),
    ),
    // otherAccountsPictures: <Widget>[
    //   CircleAvatar(
    //     backgroundColor: Colors.white,
    //     child: Text('G'),
    //   ),
    // ],
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: <Color>[
        Colors.deepPurple, Colors.purpleAccent
      ]),
      // color: Theme.of(context).accentColor,
    ),
  );
  //     DrawerHeader(
  //   margin: EdgeInsets.zero,
  //   padding: EdgeInsets.zero,
  //   decoration: BoxDecoration(
  //     image: DecorationImage(
  //         fit: BoxFit.fill, image: AssetImage('assets/images/disp.jpg')),
  //   ),
  //   child: Stack(children: <Widget>[
  //     Positioned(
  //         bottom: 12.0,
  //         left: 16.0,
  //         child: Text("SOI4U",
  //             style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 20.0,
  //                 fontWeight: FontWeight.w500))),
  //   ]),
  // );
}
