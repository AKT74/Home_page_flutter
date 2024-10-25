import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  final List<Map<String, dynamic>> salesData;

  DashboardPage({required this.salesData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard - Tabel Penjualan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: salesData.isEmpty
            ? Center(child: Text('Tidak ada data penjualan'))
            : ListView.builder(
                itemCount: salesData.length,
                itemBuilder: (context, index) {
                  final sale = salesData[index];
                  return Card(
                    child: ListTile(
                      title: Text('Faktur: ${sale['noFaktur']}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Tanggal: ${sale['tanggal']}'),
                          Text('Customer: ${sale['customer']}'),
                          Text('Jumlah Barang: ${sale['jumlahBarang']}'),
                          Text('Total Penjualan: ${sale['totalPenjualan']}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
