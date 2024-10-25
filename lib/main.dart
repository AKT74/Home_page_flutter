import 'package:flutter/material.dart';
import 'package:management_system/login.dart';
import 'dashboard.dart';
import 'add.dart';
import 'update.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Management System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> salesData = [
    {
      'noFaktur': 'INV001',
      'tanggal': '2023-10-01',
      'customer': 'John Doe',
      'jumlahBarang': 5,
      'totalPenjualan': 500000
    },
    {
      'noFaktur': 'INV002',
      'tanggal': '2023-10-05',
      'customer': 'Jane Smith',
      'jumlahBarang': 3,
      'totalPenjualan': 300000
    },
    {
      'noFaktur': 'INV003',
      'tanggal': '2023-10-10',
      'customer': 'Michael Johnson',
      'jumlahBarang': 7,
      'totalPenjualan': 700000
    },
  ];

  void addSale(Map<String, dynamic> newSale) {
    setState(() {
      salesData.add(newSale);
    });
  }

  void updateSale(String noFaktur, Map<String, dynamic> updatedSale) {
    setState(() {
      final index = salesData.indexWhere((sale) => sale['noFaktur'] == noFaktur);
      if (index != -1) {
        salesData[index] = updatedSale;
      }
    });
  }

  void deleteSale(String noFaktur) {
    setState(() {
      salesData.removeWhere((sale) => sale['noFaktur'] == noFaktur);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Management System'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  HomeMenuItem(
                    title: 'Dashboard',
                    icon: Icons.dashboard,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashboardPage(salesData: salesData),
                        ),
                      );
                    },
                  ),
                  HomeMenuItem(
                    title: 'Add',
                    icon: Icons.add,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddPage(onAdd: addSale),
                        ),
                      );
                    },
                  ),
                  HomeMenuItem(
                    title: 'Update',
                    icon: Icons.update,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdatePage(
                            salesData: salesData,
                            onUpdate: updateSale,
                            onDelete: deleteSale,
                          ),
                        ),
                      );
                    },
                  ),
                  HomeMenuItem(
                    title: 'Logout',
                    icon: Icons.logout,
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // Jarak antara tombol dan teks
            Text(
              'Nayaka Taqwa',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'NPM: 714220045',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}



class HomeMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  HomeMenuItem({required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50),
            SizedBox(height: 20),
            Text(title),
          ],
        ),
      ),
    );
  }
}
