class Data {
  String _billID;
  String _sellerName;
  String _date;
  String _model;
  String _pic;
  String _status;

  Data(
    this._billID,
    this._sellerName,
    this._date,
    this._model,
    this._pic,
    this._status,
  );
  String toParams() =>
      '?billID=$_billID&sellerName=$_sellerName&date=$_date&model=$_model&pic=$_pic&status=$_status';
}
