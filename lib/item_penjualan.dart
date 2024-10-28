import 'package:flutter/material.dart';
import '../penjualan_detail.dart';

class ItemPenjualan extends StatelessWidget {
  final String noFaktur;
  final String tanggal;
  final String customer;
  final int jumlahBarang;
  final int totalPenjualan;

  const ItemPenjualan({
    Key? key,
    required this.noFaktur,
    required this.tanggal,
    required this.customer,
    required this.jumlahBarang,
    required this.totalPenjualan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text('Faktur: $noFaktur'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Tanggal: $tanggal'),
              Text('Customer: $customer'),
              Text('Jumlah Barang: $jumlahBarang'),
              Text('Total Penjualan: $totalPenjualan'),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PenjualanDetail(
              noFaktur: noFaktur,
              tanggal: tanggal,
              customer: customer,
              jumlahBarang: jumlahBarang,
              totalPenjualan: totalPenjualan,
            ),
          ),
        );
      },
    );
  }
}
