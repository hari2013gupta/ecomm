import 'dart:async';
import 'dart:io';

import 'package:ecomm/ui/login/login_model.dart';
import 'package:ecomm/ui/product/presenter/product_data.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "SwadesiShopDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE City ("
          "database_id INTEGER PRIMARY KEY,"
          "city_id INTEGER,"
          "city_name TEXT,"
          "city_active BIT"
          ")");

      await db.execute("CREATE TABLE Customer ("
          "id INTEGER PRIMARY KEY,"
          "user_id INTEGER,"
          "user_name TEXT,"
          "user_photo TEXT,"
          "user_password TEXT,"
          "user_rating INTEGER,"
          "is_active BIT,"
          "block_status BIT"
          ")");

      await db.execute("CREATE TABLE Cart ("
          "database_id INTEGER PRIMARY KEY,"
          "product_id INTEGER,"
          "product_name TEXT,"
          "product_title TEXT,"
          "product_image TEXT,"
          "product_weight TEXT,"
          "product_unit TEXT,"
          "product_max INTEGER,"
          "product_mrp INTEGER,"
          "product_price INTEGER,"
          "product_active BIT"
          ")");
    });
  }

  newCustomer(Customer user) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM Customer");
    int id = table.first["id"];
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into Customer (id,user_id,user_name,user_photo,user_password,user_rating,is_active,block_status)"
        " VALUES (?,?,?,?,?,?,?,?)",
        [id, user.userId, user.userName, user.isActive, user.blockStatus]);
    return raw;
  }

  newCart(Product user) async {
    final db = await database;
    //get the biggest id in the table
    var table =
        await db.rawQuery("SELECT MAX(database_id)+1 as database_id FROM Cart");
    int databaseId = table.first["database_id"];
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into Cart (database_id,product_id,product_name,product_title,product_image,product_weight,product_unit,product_max,product_mrp,product_price,product_active)"
        " VALUES (?,?,?,?,?,?,?,?,?,?,?)",
        [
          databaseId,
          user.productId,
          user.productName,
          user.productTitle,
          user.productImage,
          user.productWeight,
          user.productUnit,
          user.productMax,
          user.productMrp,
          user.productPrice,
          user.productActive
        ]);
    return raw;
  }

  blockOrUnblock(Customer user) async {
    final db = await database;
    Customer blocked = Customer(
        id: user.id,
        userId: user.userId,
        userName: user.userName,
        blockStatus: !user.blockStatus);
    var res = await db.update("Customer", blocked.toMap(),
        where: "user_id = ?", whereArgs: [user.userId]);
    return res;
  }

  updateCustomer(Customer user) async {
    final db = await database;
    var res = await db.update("Customer", user.toMap(),
        where: "user_id = ?", whereArgs: [user.userId]);
    return res;
  }

  updateCart(Product user) async {
    final db = await database;
    var res = await db.update("Cart", user.toMap(),
        where: "product_id = ?", whereArgs: [user.productId]);
    return res;
  }

  getCustomer(int userId) async {
    final db = await database;
    var res = await db.query("Customer", where: "user_id = ?", whereArgs: [userId]);
    return res.isNotEmpty ? Customer.fromMap(res.first) : null;
  }

  Future<List<Customer>> getBlockedCustomer() async {
    final db = await database;

    print("works");
    // var res = await db.rawQuery("SELECT * FROM Customer WHERE blocked=1");
    var res =
        await db.query("Customer", where: "block_status = ? ", whereArgs: [1]);

    List<Customer> list =
        res.isNotEmpty ? res.map((c) => Customer.fromMap(c)).toList() : [];
    return list;
  }

//--------------------------------imp-quer--------------
  Future<List<Customer>> getAllCustomer() async {
    final db = await database;
    var res = await db.query("Customer");
    List<Customer> list =
        res.isNotEmpty ? res.map((c) => Customer.fromMap(c)).toList() : [];
    return list;
  }

  Future<List<Product>> getAllCart() async {
    final db = await database;
    var res = await db.query("Cart");
    List<Product> list =
        res.isNotEmpty ? res.map((c) => Product.fromMap(c)).toList() : [];
    return list;
  }

  deleteCustomer(int id) async {
    final db = await database;
    return db.delete("Customer", where: "id = ?", whereArgs: [id]);
  }

  deleteCart(int id) async {
    final db = await database;
    return db.delete("Cart", where: "id = ?", whereArgs: [id]);
  }

  deleteAllCustomer() async {
    final db = await database;
    db.rawDelete("Delete * from Customer");
  }

  deleteAllCart() async {
    final db = await database;
    db.rawDelete("Delete * from Cart");
  }

  deleteAllCity() async {
    final db = await database;
    db.rawDelete("Delete * from City");
  }
}
