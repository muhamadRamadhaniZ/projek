class Contact {
  int _id;
  String _name;
  String _phone;
  String _keterangan;
  Contact(this._name, this._phone, this._keterangan);
  Contact.forMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._phone = map['phone'];
    this._keterangan = map['keterangan'];
  }
  int get id => _id;
  String get name => _name;
  String get phone => _phone;
  String get keterangan => _keterangan;
  set name(String value) {
    _name = value;
  }

  set phone(String value) {
    _phone = value;
  }

  set keterangan(String value) {
    _keterangan = value;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['name'] = name;
    map['phone'] = phone;
    map['keterangan'] = keterangan;
    return map;
  }
}
