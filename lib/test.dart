import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banking App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Good afternoon,\nEnjelin Morgeana',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // Balance container
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total Balance',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '\$2,548.00',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      BalanceInfo(label: 'Income', amount: '\$1,840.00'),
                      BalanceInfo(label: 'Expenses', amount: '\$284.00'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Transactions history
            const Text(
              'Transactions History',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: const [
                  TransactionTile(
                    icon: Icons.arrow_upward,
                    label: 'Upwork',
                    date: 'Today',
                    amount: '\$850.00',
                    isIncome: true,
                  ),
                  TransactionTile(
                    icon: Icons.transfer_within_a_station,
                    label: 'Transfer',
                    date: 'Yesterday',
                    amount: '- \$85.00',
                    isIncome: false,
                  ),
                  TransactionTile(
                    icon: Icons.paypal,
                    label: 'Paypal',
                    date: 'Jan 30, 2022',
                    amount: '\$1,406.00',
                    isIncome: true,
                  ),
                  TransactionTile(
                    icon: Icons.youtube_searched_for,
                    label: 'Youtube',
                    date: 'Jan 16, 2022',
                    amount: '- \$11.99',
                    isIncome: false,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Send Again Section
            const Text(
              'Send Again',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(5, (index) {
                return CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/user$index.png'),
                );
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Stats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        backgroundColor: Colors.teal,
      ),
    );
  }
}

class BalanceInfo extends StatelessWidget {
  final String label;
  final String amount;

  const BalanceInfo({Key? key, required this.label, required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white70),
        ),
        const SizedBox(height: 4),
        Text(
          amount,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class TransactionTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String date;
  final String amount;
  final bool isIncome;

  const TransactionTile({
    Key? key,
    required this.icon,
    required this.label,
    required this.date,
    required this.amount,
    required this.isIncome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey.shade200,
        child: Icon(icon, color: Colors.teal),
      ),
      title: Text(label),
      subtitle: Text(date),
      trailing: Text(
        amount,
        style: TextStyle(
          color: isIncome ? Colors.green : Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
