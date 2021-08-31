// import 'package:db_sync_obj/objectbox.g.dart';
// import 'package:faker/faker.dart';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';

// import 'entities.dart';
// import 'order_data_table.dart';
// import 'package:path/path.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final faker = Faker();
//   late Store _store;
//   bool hasBeenInitialized = false;

//   late Customer customer;
//   late Stream<List<ShopOrder>> _stream;

//   @override
//   void initState() {
//     super.initState();
//     setNewCustomer();

//     getApplicationDocumentsDirectory().then((dir) {
//       _store = Store(
//         getObjectBoxModel(),
//         directory: join(dir.path, 'objectbox'),
//       );
//       setState(() {
//         _stream = _store
//             .box<ShopOrder>()
//             .query()
//             .watch(triggerImmediately: true)
//             .map((query) => query.find());
//         hasBeenInitialized = true;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _store.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Orders App'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.person_add_alt),
//             onPressed: setNewCustomer,
//           ),
//           IconButton(
//             icon: Icon(Icons.attach_money),
//             onPressed: addFakeOrderForCurrentCustomer,
//           ),
//         ],
//       ),
//       body: !hasBeenInitialized
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : StreamBuilder<List<ShopOrder>>(
//               stream: _stream,
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//                 return OrderDataTable(
//                   orders: snapshot.data!,
//                   store: _store,
//                   onSort: (columnIndex, ascending) {
//                     final newQueryBuilder = _store.box<ShopOrder>().query();
//                     final sortField =
//                         columnIndex == 0 ? ShopOrder_.id : ShopOrder_.price;
//                     newQueryBuilder.order(sortField,
//                         flags: ascending ? 0 : Order.descending);
//                     setState(() {
//                       _stream = newQueryBuilder
//                           .watch(triggerImmediately: true)
//                           .map((query) => query.find());
//                     });
//                   },
//                 );
//               },
//             ),
//     );
//   }

//   void setNewCustomer() {
//     customer = Customer(name: faker.person.name());
//   }

//   void addFakeOrderForCurrentCustomer() {
//     final order = ShopOrder(
//       price: faker.randomGenerator.integer(500, min: 10),
//     );
//     order.custumer.target = customer;
//     _store.box<ShopOrder>().put(order);
//   }
// }
