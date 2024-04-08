import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Wallet App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WalletPage(),
    );
  }
}

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ryBank'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20), 
              Padding(
                padding: EdgeInsets.all(8.6),
                child: Image(
                  image: AssetImage('assets/logo_ryBank.png'),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'ryBank',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'ryBank@gmail.com',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TransactionPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: Text(
                  'Transaksi',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HistoryPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: Text(
                  'Riwayat',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DepositPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: Text(
                  'Tabungan',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WithdrawPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: Text(
                  'Penarikan',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: Text(
                  'Pengaturan',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Transaksi'),
      ),
        body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Pilih Jenis Transaksi:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 21.0),
            ElevatedButton(
              onPressed: () {
                
              },
              child: Text('Top-up'),
            ),
            ElevatedButton(
              onPressed: () {
                
              },
              child: Text('Transfer'),
            ),
            ElevatedButton(
              onPressed: () {
                
              },
              child: Text('Pembayaran'),
            ),
          ],
        ),
      ),
    );
  }
}


class TransactionItem extends StatelessWidget {
  final String title;
  final String amount;

  TransactionItem({
    required this.title,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Transaksi'),
      ),
      body: ListView.builder(
        itemCount: transactionHistory.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(transactionHistory[index].title),
            subtitle: Text(transactionHistory[index].date),
            trailing: Text(
              transactionHistory[index].amount,
              style: TextStyle(
                color: transactionHistory[index].type == TransactionType.income
                    ? Colors.green
                    : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}

enum TransactionType { income, expense }

class Transaction {
  final String title;
  final String date;
  final String amount;
  final TransactionType type;

  Transaction({
    required this.title,
    required this.date,
    required this.amount,
    required this.type,
  });
}

List<Transaction> transactionHistory = [
  Transaction(
    title: 'Top-up',
    date: '08 April 2024',
    amount: '+ Rp. 100.000',
    type: TransactionType.income,
  ),
  Transaction(
    title: 'Pembayaran',
    date: '07 April 2024',
    amount: '- Rp. 50.000',
    type: TransactionType.expense,
  ),
  Transaction(
    title: 'Transfer',
    date: '06 April 2024',
    amount: '- Rp. 200.000',
    type: TransactionType.expense,
  ),
  Transaction(
    title: 'Pembayaran',
    date: '05 April 2024',
    amount: '- Rp. 75.000',
    type: TransactionType.expense,
  ),
];


class DepositPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Tabungan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Saldo Anda:',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Rp. 1.000.000',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                
              },
              child: Text('Deposit'),
            ),
            ElevatedButton(
              onPressed: () {
                
              },
              child: Text('Riwayat Transaksi'),
            ),
          ],
        ),
      ),
    );
  }
}

class WithdrawPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Penarikan'),
      ),
      body: Center(
        child: Text('Ini Halaman Penarikan'),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Pengaturan'),
      ),
      body: Center(
        child: Text('Ini Halaman Pengaturan'),
      ),
    );
  }
}
