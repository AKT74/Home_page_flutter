import 'package:flutter/material.dart';

class PenjualanDetail extends StatelessWidget {
  final String noFaktur;
  final String tanggal;
  final String customer;
  final int jumlahBarang;
  final int totalPenjualan;

  const PenjualanDetail({
    Key? key,
    required this.noFaktur,
    required this.tanggal,
    required this.customer,
    required this.jumlahBarang,
    required this.totalPenjualan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Penjualan')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('No Faktur: $noFaktur', style: const TextStyle(fontSize: 18)),
            Text('Tanggal: $tanggal', style: const TextStyle(fontSize: 18)),
            Text('Customer: $customer', style: const TextStyle(fontSize: 18)),
            Text('Jumlah Barang: $jumlahBarang', style: const TextStyle(fontSize: 18)),
            Text('Total Penjualan: $totalPenjualan', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
