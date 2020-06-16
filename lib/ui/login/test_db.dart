import 'dart:math';

import 'package:ecomm/ui/login/database.dart';
import 'package:ecomm/ui/login/login_model.dart';
import 'package:flutter/material.dart';

class TestDB extends StatefulWidget {
  @override
  _TestDBState createState() => _TestDBState();
}

class _TestDBState extends State<TestDB> {
  
  // data for testing
  List<Customer> testClients = [
    Customer(userId: 11,userName: "Raouf",  isActive: true,  blockStatus: false),
    Customer(userId: 12,userName: "Zaki",  isActive: true,  blockStatus: true),
    Customer(userId: 13,userName: "oussama", isActive: true, blockStatus: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter SQLite")),
      body: FutureBuilder<List<Customer>>(
        future: DBProvider.db.getAllCustomer(),
        builder: (BuildContext context, AsyncSnapshot<List<Customer>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                Customer item = snapshot.data[index];
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {
                    DBProvider.db.deleteCustomer(item.id);
                  },
                  child: ListTile(
                    title: Text(item.userName),
                    leading: Text(item.id.toString()),
                    trailing: Checkbox(
                      onChanged: (bool value) {
                        DBProvider.db.blockOrUnblock(item);
                        setState(() {});
                      },
                      value: item.blockStatus,
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          var rng = new Random();
          Customer rnd = testClients[rng.nextInt(testClients.length)];
          await DBProvider.db.newCustomer(rnd);
          setState(() {});
        },
      ),
    );
  }
}