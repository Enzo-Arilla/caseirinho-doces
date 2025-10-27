import 'package:caseirinhodoces/components/button.dart';
import 'package:caseirinhodoces/components/inputProfile.dart';
import 'package:flutter/material.dart';

class Order {
  int id;
  double totalValue;
  DateTime orderedAt;

  Order({
    required this.id,
    required this.totalValue,
    required this.orderedAt,
  });
}

class HistoryPage extends StatelessWidget {
  final List<Order> orders = [
    Order(id: 1, totalValue: 150.75, orderedAt: DateTime(2025, 9, 20)),
    Order(id: 2, totalValue: 299.99, orderedAt: DateTime(2025, 9, 21)),
    Order(id: 3, totalValue: 89.50, orderedAt: DateTime(2025, 9, 22)),
    Order(id: 4, totalValue: 450.00, orderedAt: DateTime(2025, 9, 23)),
    Order(id: 5, totalValue: 120.00, orderedAt: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            icon: Image.asset(
              "assets/images/Xrosa.png",
              width: 28,
              height: 28,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15.0, top: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Histórico de Pedidos",
                  style: TextStyle(
                    fontFamily: 'Serif',
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.brown,
                  ),
                ),
              ),
            ),
            const PreferredSize(
              preferredSize: Size.fromHeight(2.0),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(
                  thickness: 2,
                  height: 2,
                  color: Colors.blueGrey,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                    shadowColor: Colors.brown.withOpacity(0.3),
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Pedido #${order.id}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.brown[700],
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Total: R\$${order.totalValue.toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Data: ${order.orderedAt.day.toString().padLeft(2, '0')}/'
                                '${order.orderedAt.month.toString().padLeft(2, '0')}/'
                                '${order.orderedAt.year}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
