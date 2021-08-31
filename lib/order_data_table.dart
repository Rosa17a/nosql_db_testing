// import 'package:db_sync_obj/objectbox.g.dart';
// import 'package:flutter/material.dart';

// import 'entities.dart';

// class OrderDataTable extends StatefulWidget {
//   final List<ShopOrder> orders;
//   final Store store;
//   final void Function(int columnIndex, bool ascending) onSort;

//   const OrderDataTable({
//     Key? key,
//     required this.onSort,
//     required this.store,
//     required this.orders,
//   }) : super(key: key);

//   @override
//   _OrderDataTableState createState() => _OrderDataTableState();
// }

// class _OrderDataTableState extends State<OrderDataTable> {
//   bool _sortAscending = true;
//   int _sortColumnIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: SingleChildScrollView(
//         child: DataTable(
//           sortColumnIndex: _sortColumnIndex,
//           sortAscending: _sortAscending,
//           columns: [
//             DataColumn(
//               label: Text('Number'),
//               onSort: _onDataColumnSort,
//             ),
//             DataColumn(
//               label: Text('Customer'),
//             ),
//             DataColumn(
//               label: Text('Price'),
//               numeric: true,
//               onSort: _onDataColumnSort,
//             ),
//             DataColumn(
//               label: Container(),
//             ),
//           ],
//           rows: widget.orders.map(
//             (order) {
//               return DataRow(
//                 cells: [
//                   DataCell(
//                     Text(order.id.toString()),
//                   ),
//                   DataCell(
//                     Text(order.custumer.target?.name ?? 'NONE'),
//                     onTap: () {
//                       showModalBottomSheet(
//                         context: context,
//                         builder: (context) {
//                           return Material(
//                             child: ListView(
//                               children: order.custumer.target!.orders.map(
//                                 (order) {
//                                   return ListTile(
//                                       title: Text(
//                                           "${order.id}    ${order.custumer.target?.name}    \$${order.price}"));
//                                 },
//                               ).toList(),
//                             ),
//                           );
//                         },
//                       );
//                     },
//                   ),
//                   DataCell(
//                     Text(
//                       '\$${order.price}',
//                     ),
//                   ),
//                   DataCell(
//                     Icon(Icons.delete),
//                     onTap: () {
//                       widget.store.box<ShopOrder>().remove(order.id);
//                     },
//                   ),
//                 ],
//               );
//             },
//           ).toList(),
//         ),
//       ),
//     );
//   }

//   void _onDataColumnSort(int columnIndex, bool ascending) {
//     setState(() {
//       _sortColumnIndex = columnIndex;
//       _sortAscending = ascending;
//     });
//     widget.onSort(columnIndex, ascending);
//   }
// }
