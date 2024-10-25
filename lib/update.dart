import 'package:flutter/material.dart';

class UpdatePage extends StatefulWidget {
  final List<Map<String, dynamic>> salesData;
  final Function(String, Map<String, dynamic>) onUpdate;
  final Function(String) onDelete;

  UpdatePage({required this.salesData, required this.onUpdate, required this.onDelete});

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final TextEditingController fakturController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController customerController = TextEditingController();
  final TextEditingController jumlahController = TextEditingController();
  final TextEditingController totalController = TextEditingController();

  void loadSale(String noFaktur) {
    final sale = widget.salesData.firstWhere(
      (sale) => sale['noFaktur'] == noFaktur,
      orElse: () => {},
    );
    if (sale.isNotEmpty) {
      setState(() {
        fakturController.text = sale['noFaktur'];
        tanggalController.text = sale['tanggal'];
        customerController.text = sale['customer'];
        jumlahController.text = sale['jumlahBarang'].toString();
        totalController.text = sale['totalPenjualan'].toString();
      });
    }
  }

  void updateSale() {
    if (fakturController.text.isNotEmpty) {
      widget.onUpdate(fakturController.text, {
        'noFaktur': fakturController.text,
        'tanggal': tanggalController.text,
        'customer': customerController.text,
        'jumlahBarang': int.parse(jumlahController.text),
        'totalPenjualan': int.parse(totalController.text),
      });
      Navigator.pop(context);
    }
  }

  void deleteSale() {
    if (fakturController.text.isNotEmpty) {
      widget.onDelete(fakturController.text);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update/Hapus Data Penjualan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: fakturController,
                decoration: InputDecoration(labelText: 'No Faktur'),
                onChanged: (value) {
                  loadSale(value);
                },
              ),
              TextFormField(
                controller: tanggalController,
                decoration: InputDecoration(labelText: 'Tanggal Penjualan'),
              ),
              TextFormField(
                controller: customerController,
                decoration: InputDecoration(labelText: 'Nama Customer'),
              ),
              TextFormField(
                controller: jumlahController,
                decoration: InputDecoration(labelText: 'Jumlah Barang'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: totalController,
                decoration: InputDecoration(labelText: 'Total Penjualan'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: updateSale,
                child: Text('Update'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: deleteSale,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: Text('Hapus'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
