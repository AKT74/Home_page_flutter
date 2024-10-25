import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  final Function(Map<String, dynamic>) onAdd;

  AddPage({required this.onAdd});

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController fakturController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController customerController = TextEditingController();
  final TextEditingController jumlahController = TextEditingController();
  final TextEditingController totalController = TextEditingController();

  void submit() {
    if (_formKey.currentState!.validate()) {
      widget.onAdd({
        'noFaktur': fakturController.text,
        'tanggal': tanggalController.text,
        'customer': customerController.text,
        'jumlahBarang': int.parse(jumlahController.text),
        'totalPenjualan': int.parse(totalController.text),
      });

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Data Penjualan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: fakturController,
                decoration: InputDecoration(labelText: 'No Faktur'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'No Faktur wajib diisi';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: tanggalController,
                decoration: InputDecoration(labelText: 'Tanggal Penjualan'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tanggal Penjualan wajib diisi';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: customerController,
                decoration: InputDecoration(labelText: 'Nama Customer'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama Customer wajib diisi';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: jumlahController,
                decoration: InputDecoration(labelText: 'Jumlah Barang'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Jumlah Barang wajib diisi';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: totalController,
                decoration: InputDecoration(labelText: 'Total Penjualan'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Total Penjualan wajib diisi';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: submit,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
