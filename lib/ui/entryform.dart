import 'package:crud/models/contact.dart';
import 'package:flutter/material.dart';


class EntryForm extends StatefulWidget {
  final Contact contact;
  EntryForm(this.contact);
  @override
  _EntryFormState createState() => _EntryFormState(this.contact);
}

class _EntryFormState extends State<EntryForm> {
  Contact _contact;
  _EntryFormState(this._contact);
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _keteranganController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (_contact != null) {
      _nameController.text = _contact.name;
      _phoneController.text = _contact.phone;
      _keteranganController.text = _contact.keterangan;
    }
    return Scaffold(
      appBar: AppBar(
        title: _contact == null ? Text('Tambah Data') : Text('Ubah Data'),
        leading: Icon(Icons.keyboard_arrow_left),
      ),
      body: 
      Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            //nama
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: _nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Nama Barang',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Jumlah',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: _keteranganController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Keterangan',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (value) {},
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Colors.blue[900],
                      textColor: Colors.greenAccent,
                      child: Text(
                        'Simpan',
                        style: TextStyle(color: Colors.white),
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        if (_contact == null) {
                          _contact = Contact(
                              _nameController.text,
                              _phoneController.text,
                              _keteranganController.text);
                        } else {
                          _contact.name = _nameController.text;
                          _contact.phone = _phoneController.text;
                          _contact.keterangan = _keteranganController.text;
                        }
                        Navigator.pop(context, _contact);
                      },
                    ),
                  ),
                  Container(
                    width: 5.0,
                  ),
                  Expanded(
                    child: RaisedButton(
                      color: Colors.red[900],
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Batal',
                        style: TextStyle(color: Colors.white),
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
