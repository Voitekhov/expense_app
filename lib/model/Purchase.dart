class Purchase {
  int _id;
  String _title;
  double _price;
  DateTime _datetime;

  Purchase(
      {required int id,
      required String title,
      required double price,
      required DateTime dateTime})
      : this._id = id,
        this._title = title,
        this._price = price,
        this._datetime = dateTime;

  DateTime get datetime => _datetime;

  double get price => _price;

  String get title => _title;

  int get id => _id;
}


