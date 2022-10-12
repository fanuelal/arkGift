import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../providers/orders.dart';

class OrderItems extends StatefulWidget {
  final OrderItem order;

  OrderItems({this.order});

  @override
  State<OrderItems> createState() => _OrderItemsState();
}

class _OrderItemsState extends State<OrderItems> {
  var _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${widget.order.totalPrice}'),
            subtitle: Text(
                DateFormat('dd/MM/yyyy hh:mm').format(widget.order.orderTime)),
            trailing: IconButton(
              icon: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
            ),
          ),
          if (_isExpanded) Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
              height: min(widget.order.orderedItems.length * 20.0 + 30, 100),
              child: ListView(
                  children: widget.order.orderedItems
                      .map((prod) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                prod.title,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor),
                              ),
                              Text(
                                '${prod.amount} X ${prod.price}',
                                style:
                                    TextStyle(fontSize: 18, color: Theme.of(context).primaryColor),
                              )
                            ],
                          ))
                      .toList(),
                      ),
            )
        ],
      ),
    );
  }
}