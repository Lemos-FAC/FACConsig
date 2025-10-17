import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _parcela = '';
  String get parcela => _parcela;
  set parcela(String value) {
    _parcela = value;
  }

  String _valorParcela = '';
  String get valorParcela => _valorParcela;
  set valorParcela(String value) {
    _valorParcela = value;
  }

  String _totalParcela = '';
  String get totalParcela => _totalParcela;
  set totalParcela(String value) {
    _totalParcela = value;
  }

  double _valorSlider = 0.0;
  double get valorSlider => _valorSlider;
  set valorSlider(double value) {
    _valorSlider = value;
  }

  String _valorParcelaAlterado = '';
  String get valorParcelaAlterado => _valorParcelaAlterado;
  set valorParcelaAlterado(String value) {
    _valorParcelaAlterado = value;
  }

  String _parcelaAlterado = '';
  String get parcelaAlterado => _parcelaAlterado;
  set parcelaAlterado(String value) {
    _parcelaAlterado = value;
  }

  List<String> _dropDownList = [];
  List<String> get dropDownList => _dropDownList;
  set dropDownList(List<String> value) {
    _dropDownList = value;
  }

  void addToDropDownList(String value) {
    dropDownList.add(value);
  }

  void removeFromDropDownList(String value) {
    dropDownList.remove(value);
  }

  void removeAtIndexFromDropDownList(int index) {
    dropDownList.removeAt(index);
  }

  void updateDropDownListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    dropDownList[index] = updateFn(_dropDownList[index]);
  }

  void insertAtIndexInDropDownList(int index, String value) {
    dropDownList.insert(index, value);
  }

  double _prevSlider = 0.0;
  double get prevSlider => _prevSlider;
  set prevSlider(double value) {
    _prevSlider = value;
  }

  bool _hasChanged = false;
  bool get hasChanged => _hasChanged;
  set hasChanged(bool value) {
    _hasChanged = value;
  }

  String _dropDownItem = '';
  String get dropDownItem => _dropDownItem;
  set dropDownItem(String value) {
    _dropDownItem = value;
  }

  String _constParcela = '';
  String get constParcela => _constParcela;
  set constParcela(String value) {
    _constParcela = value;
  }

  double _customSliderValue = 0.0;
  double get customSliderValue => _customSliderValue;
  set customSliderValue(double value) {
    _customSliderValue = value;
  }

  DateTime? _lastSliderRequestTime =
      DateTime.fromMillisecondsSinceEpoch(1760106300000);
  DateTime? get lastSliderRequestTime => _lastSliderRequestTime;
  set lastSliderRequestTime(DateTime? value) {
    _lastSliderRequestTime = value;
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
  }

  double _ValorFormatado = 0.0;
  double get ValorFormatado => _ValorFormatado;
  set ValorFormatado(double value) {
    _ValorFormatado = value;
  }

  double _ValorFormatadoTotal = 0.0;
  double get ValorFormatadoTotal => _ValorFormatadoTotal;
  set ValorFormatadoTotal(double value) {
    _ValorFormatadoTotal = value;
  }

  double _maxAllowedValue = 0.0;
  double get maxAllowedValue => _maxAllowedValue;
  set maxAllowedValue(double value) {
    _maxAllowedValue = value;
  }

  double _facValorEmprestimo = 0.0;
  double get facValorEmprestimo => _facValorEmprestimo;
  set facValorEmprestimo(double value) {
    _facValorEmprestimo = value;
  }

  double _facValorTemp = 0.0;
  double get facValorTemp => _facValorTemp;
  set facValorTemp(double value) {
    _facValorTemp = value;
  }

  String _displayValue = '';
  String get displayValue => _displayValue;
  set displayValue(String value) {
    _displayValue = value;
  }
}
