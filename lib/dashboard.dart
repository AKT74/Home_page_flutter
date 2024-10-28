import 'package:flutter/material.dart';
import 'package:management_system/add.dart';
import '../item_penjualan.dart';

class DashboardPage extends StatelessWidget {
  final List<Map<String, dynamic>> salesData;

  DashboardPage({required this.salesData});
  
  get addSale => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard - Tabel Penjualan'),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddPage(onAdd: addSale, salesData: [],),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: salesData.isEmpty
            ? Center(child: const Text('Tidak ada data penjualan'))
            : ListView.builder(
                itemCount: salesData.length,
                itemBuilder: (context, index) {
                  final sale = salesData[index];
                  return ItemPenjualan(
                    noFaktur: sale['noFaktur'],
                    tanggal: sale['tanggal'],
                    customer: sale['customer'],
                    jumlahBarang: sale['jumlahBarang'],
                    totalPenjualan: sale['totalPenjualan'],
                  );
                },
              ),
      ),
    );
  }
}
