import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _lembrarCPF = prefs.getBool('ff_lembrarCPF') ?? _lembrarCPF;
    });
    _safeInit(() {
      _loginBiometria = prefs.getBool('ff_loginBiometria') ?? _loginBiometria;
    });
    _safeInit(() {
      _storedCPF = prefs.getString('ff_storedCPF') ?? _storedCPF;
    });
    _safeInit(() {
      _storedSenha = prefs.getString('ff_storedSenha') ?? _storedSenha;
    });
    _safeInit(() {
      _codigoContratante =
          prefs.getString('ff_codigoContratante') ?? _codigoContratante;
    });
    _safeInit(() {
      _contratante = prefs.getStringList('ff_contratante')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _contratante;
    });
    _safeInit(() {
      _cpfPrimeiroAcesso =
          prefs.getString('ff_cpfPrimeiroAcesso') ?? _cpfPrimeiroAcesso;
    });
    _safeInit(() {
      _nomContratante = prefs.getString('ff_nomContratante') ?? _nomContratante;
    });
    _safeInit(() {
      _canLoad = prefs.getBool('ff_canLoad') ?? _canLoad;
    });
    _safeInit(() {
      _cpfContratante = prefs.getString('ff_cpfContratante') ?? _cpfContratante;
    });
    _safeInit(() {
      _margemDisponivel =
          prefs.getString('ff_margemDisponivel') ?? _margemDisponivel;
    });
    _safeInit(() {
      _celular = prefs.getString('ff_celular') ?? _celular;
    });
    _safeInit(() {
      _dataNascimento = prefs.getString('ff_dataNascimento') ?? _dataNascimento;
    });
    _safeInit(() {
      _uploadedIdentificacao =
          prefs.getBool('ff_uploadedIdentificacao') ?? _uploadedIdentificacao;
    });
    _safeInit(() {
      _uploadedComprovante =
          prefs.getBool('ff_uploadedComprovante') ?? _uploadedComprovante;
    });
    _safeInit(() {
      _uploadedPAD = prefs.getBool('ff_uploadedPAD') ?? _uploadedPAD;
    });
    _safeInit(() {
      _uploadedComprovanteBanco =
          prefs.getBool('ff_uploadedComprovanteBanco') ??
              _uploadedComprovanteBanco;
    });
    _safeInit(() {
      _uploadedContraCheque =
          prefs.getBool('ff_uploadedContraCheque') ?? _uploadedContraCheque;
    });
    _safeInit(() {
      _uploadedRecompra =
          prefs.getBool('ff_uploadedRecompra') ?? _uploadedRecompra;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

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

  String _reajuste = '';
  String get reajuste => _reajuste;
  set reajuste(String value) {
    _reajuste = value;
  }

  String _cpf = '';
  String get cpf => _cpf;
  set cpf(String value) {
    _cpf = value;
  }

  String _matricula = '';
  String get matricula => _matricula;
  set matricula(String value) {
    _matricula = value;
  }

  List<String> _dropDownMatricula = [];
  List<String> get dropDownMatricula => _dropDownMatricula;
  set dropDownMatricula(List<String> value) {
    _dropDownMatricula = value;
  }

  void addToDropDownMatricula(String value) {
    dropDownMatricula.add(value);
  }

  void removeFromDropDownMatricula(String value) {
    dropDownMatricula.remove(value);
  }

  void removeAtIndexFromDropDownMatricula(int index) {
    dropDownMatricula.removeAt(index);
  }

  void updateDropDownMatriculaAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    dropDownMatricula[index] = updateFn(_dropDownMatricula[index]);
  }

  void insertAtIndexInDropDownMatricula(int index, String value) {
    dropDownMatricula.insert(index, value);
  }

  bool _lembrarCPF = false;
  bool get lembrarCPF => _lembrarCPF;
  set lembrarCPF(bool value) {
    _lembrarCPF = value;
    prefs.setBool('ff_lembrarCPF', value);
  }

  bool _loginBiometria = false;
  bool get loginBiometria => _loginBiometria;
  set loginBiometria(bool value) {
    _loginBiometria = value;
    prefs.setBool('ff_loginBiometria', value);
  }

  String _storedCPF = '';
  String get storedCPF => _storedCPF;
  set storedCPF(String value) {
    _storedCPF = value;
    prefs.setString('ff_storedCPF', value);
  }

  String _storedSenha = '';
  String get storedSenha => _storedSenha;
  set storedSenha(String value) {
    _storedSenha = value;
    prefs.setString('ff_storedSenha', value);
  }

  bool _toggledBiometric = false;
  bool get toggledBiometric => _toggledBiometric;
  set toggledBiometric(bool value) {
    _toggledBiometric = value;
  }

  String _codigoContratante = '';
  String get codigoContratante => _codigoContratante;
  set codigoContratante(String value) {
    _codigoContratante = value;
    prefs.setString('ff_codigoContratante', value);
  }

  List<dynamic> _matriculaDataList = [];
  List<dynamic> get matriculaDataList => _matriculaDataList;
  set matriculaDataList(List<dynamic> value) {
    _matriculaDataList = value;
  }

  void addToMatriculaDataList(dynamic value) {
    matriculaDataList.add(value);
  }

  void removeFromMatriculaDataList(dynamic value) {
    matriculaDataList.remove(value);
  }

  void removeAtIndexFromMatriculaDataList(int index) {
    matriculaDataList.removeAt(index);
  }

  void updateMatriculaDataListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    matriculaDataList[index] = updateFn(_matriculaDataList[index]);
  }

  void insertAtIndexInMatriculaDataList(int index, dynamic value) {
    matriculaDataList.insert(index, value);
  }

  List<dynamic> _contratante = [];
  List<dynamic> get contratante => _contratante;
  set contratante(List<dynamic> value) {
    _contratante = value;
    prefs.setStringList(
        'ff_contratante', value.map((x) => jsonEncode(x)).toList());
  }

  void addToContratante(dynamic value) {
    contratante.add(value);
    prefs.setStringList(
        'ff_contratante', _contratante.map((x) => jsonEncode(x)).toList());
  }

  void removeFromContratante(dynamic value) {
    contratante.remove(value);
    prefs.setStringList(
        'ff_contratante', _contratante.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromContratante(int index) {
    contratante.removeAt(index);
    prefs.setStringList(
        'ff_contratante', _contratante.map((x) => jsonEncode(x)).toList());
  }

  void updateContratanteAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    contratante[index] = updateFn(_contratante[index]);
    prefs.setStringList(
        'ff_contratante', _contratante.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInContratante(int index, dynamic value) {
    contratante.insert(index, value);
    prefs.setStringList(
        'ff_contratante', _contratante.map((x) => jsonEncode(x)).toList());
  }

  List<FaqItemStruct> _faqList = [
    FaqItemStruct.fromSerializableMap(jsonDecode(
        '{\"headerValue\":\"Como trocar a minha senha\",\"expandedValue\":\"Na parte inferior da tela clique em conta ➔ clique em Alterar Senha ➔ Digita a Senha Atual, Digita a Senha Nova, Digita a nova senha novamente em Confirme a senha ➔ Clique em Alterar Senha\",\"id\":\"0\"}')),
    FaqItemStruct.fromSerializableMap(jsonDecode(
        '{\"headerValue\":\"Como mandar mensagem para o instituto\",\"expandedValue\":\"Na parte inferior da tela Clique em Mensagem ➔ Clique em Suporte ➔ Clique em Nova mensagem ➔ Digita o Assunto  e a mensagem desejada ➔ Clique em Enviar Mensaegem\",\"id\":\"1\"}')),
    FaqItemStruct.fromSerializableMap(jsonDecode(
        '{\"headerValue\":\"Como ler as notificações enviadas pelo instituto\",\"expandedValue\":\"Na parte inferior da tela Clique em Mensagem ➔ Clique em Notificações\",\"id\":\"2\"}')),
    FaqItemStruct.fromSerializableMap(jsonDecode(
        '{\"headerValue\":\"Como atualizar meus dados pessoais\",\"expandedValue\":\"Clique em conta ➔ Clique em Alterar Dados➔ altere os dados desejados e Clique em Confirma\",\"id\":\"3\"}')),
    FaqItemStruct.fromSerializableMap(jsonDecode(
        '{\"headerValue\":\"Como ver meu contra cheque\",\"expandedValue\":\"Clique em Contra cheque ➔ Selecione o ano desejado ➔ Selecione o Mês desejado ➔ abrirá a imagem do seu contracheque onde você pode salvar em PDF ou compartilha-lo caso desejar. \\\\n\\\\n Observação : Menu disponível somente para Ativos\",\"id\":\"4\"}')),
    FaqItemStruct.fromSerializableMap(jsonDecode(
        '{\"headerValue\":\"O que é carta margem\",\"expandedValue\":\"Clique em Contra cheque ➔ Selecione o ano desejado ➔ Selecione o Mês desejado ➔ abrirá a imagem do seu contracheque onde você pode salvar em PDF ou compartilha-lo caso desejar. \\\\n\\\\n Observação : Menu disponível somente para Ativos\",\"id\":\"5\"}')),
    FaqItemStruct.fromSerializableMap(jsonDecode(
        '{\"headerValue\":\"Como saber quanto tenho disponível de empréstimos Consignado\",\"expandedValue\":\"Clique em Carta Margem ➔ dentro deste menu aparecerão as informações do valor total e o valor disponível.\",\"id\":\"6\"}')),
    FaqItemStruct.fromSerializableMap(jsonDecode(
        '{\"headerValue\":\"Como realizar minha prova de vida\",\"expandedValue\":\"Clique em Censo ➔ preencha as informações da tela ➔ Clique em Próximo ➔ Vincule as imagens sobre os documentos necessários ➔ Clique em Finalizar Censo.\",\"id\":\"7\"}')),
    FaqItemStruct.fromSerializableMap(jsonDecode(
        '{\"headerValue\":\"Qual a diferença entre Arquivo Foto e Arquivo PDF\",\"expandedValue\":\"O Arquivo Foto são os arquivos provindos de imagens retiradas pela câmera do celular ou já armazenada no aparelho anteriormente e  Arquivo PDF  são arquivos que, como o próprio nome diz foram salvos com a extensão PDF e que também podem trazer as informações necessárias para validar o censo.\",\"id\":\"8\"}')),
    FaqItemStruct.fromSerializableMap(jsonDecode(
        '{\"headerValue\":\"Como alterar a matricula que estou verificando\",\"expandedValue\":\"No canto superior direito é mostrada qual matricula o sistema irá trazer as informações. Para mudar de matricula, clique na palavra Matricula e selecione a outra matricula que deseja ver as informações.\",\"id\":\"9\"}')),
    FaqItemStruct.fromSerializableMap(jsonDecode(
        '{\"headerValue\":\"Como recuperar minha senha\",\"expandedValue\":\"Na tela principal clique em esqueci minha senha ➔ Selecione o tipo de cadastro ➔ digite o CPF e a data de nascimento cadastrados e clique em avançar ➔ Selecione por qual recurso deseja realizar o processo e clique em avançar ➔ Digite o código recebido pela recurso que você escolheu e clique em avançar ➔ Digita a nova senha, repita a digitação da  nova senha e clique em Alterar Senha.\",\"id\":\"10\"}'))
  ];
  List<FaqItemStruct> get faqList => _faqList;
  set faqList(List<FaqItemStruct> value) {
    _faqList = value;
  }

  void addToFaqList(FaqItemStruct value) {
    faqList.add(value);
  }

  void removeFromFaqList(FaqItemStruct value) {
    faqList.remove(value);
  }

  void removeAtIndexFromFaqList(int index) {
    faqList.removeAt(index);
  }

  void updateFaqListAtIndex(
    int index,
    FaqItemStruct Function(FaqItemStruct) updateFn,
  ) {
    faqList[index] = updateFn(_faqList[index]);
  }

  void insertAtIndexInFaqList(int index, FaqItemStruct value) {
    faqList.insert(index, value);
  }

  String _cpfPrimeiroAcesso = '';
  String get cpfPrimeiroAcesso => _cpfPrimeiroAcesso;
  set cpfPrimeiroAcesso(String value) {
    _cpfPrimeiroAcesso = value;
    prefs.setString('ff_cpfPrimeiroAcesso', value);
  }

  String _nomContratante = '';
  String get nomContratante => _nomContratante;
  set nomContratante(String value) {
    _nomContratante = value;
    prefs.setString('ff_nomContratante', value);
  }

  String _email = '';
  String get email => _email;
  set email(String value) {
    _email = value;
  }

  bool _canLoad = false;
  bool get canLoad => _canLoad;
  set canLoad(bool value) {
    _canLoad = value;
    prefs.setBool('ff_canLoad', value);
  }

  String _cpfContratante = '';
  String get cpfContratante => _cpfContratante;
  set cpfContratante(String value) {
    _cpfContratante = value;
    prefs.setString('ff_cpfContratante', value);
  }

  String _margemDisponivel = '';
  String get margemDisponivel => _margemDisponivel;
  set margemDisponivel(String value) {
    _margemDisponivel = value;
    prefs.setString('ff_margemDisponivel', value);
  }

  String _celular = '';
  String get celular => _celular;
  set celular(String value) {
    _celular = value;
    prefs.setString('ff_celular', value);
  }

  String _dataNascimento = '';
  String get dataNascimento => _dataNascimento;
  set dataNascimento(String value) {
    _dataNascimento = value;
    prefs.setString('ff_dataNascimento', value);
  }

  List<dynamic> _dropDownBancos = [];
  List<dynamic> get dropDownBancos => _dropDownBancos;
  set dropDownBancos(List<dynamic> value) {
    _dropDownBancos = value;
  }

  void addToDropDownBancos(dynamic value) {
    dropDownBancos.add(value);
  }

  void removeFromDropDownBancos(dynamic value) {
    dropDownBancos.remove(value);
  }

  void removeAtIndexFromDropDownBancos(int index) {
    dropDownBancos.removeAt(index);
  }

  void updateDropDownBancosAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    dropDownBancos[index] = updateFn(_dropDownBancos[index]);
  }

  void insertAtIndexInDropDownBancos(int index, dynamic value) {
    dropDownBancos.insert(index, value);
  }

  List<dynamic> _documentosPendentes = [];
  List<dynamic> get documentosPendentes => _documentosPendentes;
  set documentosPendentes(List<dynamic> value) {
    _documentosPendentes = value;
  }

  void addToDocumentosPendentes(dynamic value) {
    documentosPendentes.add(value);
  }

  void removeFromDocumentosPendentes(dynamic value) {
    documentosPendentes.remove(value);
  }

  void removeAtIndexFromDocumentosPendentes(int index) {
    documentosPendentes.removeAt(index);
  }

  void updateDocumentosPendentesAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    documentosPendentes[index] = updateFn(_documentosPendentes[index]);
  }

  void insertAtIndexInDocumentosPendentes(int index, dynamic value) {
    documentosPendentes.insert(index, value);
  }

  List<int> _documento = [];
  List<int> get documento => _documento;
  set documento(List<int> value) {
    _documento = value;
  }

  void addToDocumento(int value) {
    documento.add(value);
  }

  void removeFromDocumento(int value) {
    documento.remove(value);
  }

  void removeAtIndexFromDocumento(int index) {
    documento.removeAt(index);
  }

  void updateDocumentoAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    documento[index] = updateFn(_documento[index]);
  }

  void insertAtIndexInDocumento(int index, int value) {
    documento.insert(index, value);
  }

  bool _uploadedIdentificacao = false;
  bool get uploadedIdentificacao => _uploadedIdentificacao;
  set uploadedIdentificacao(bool value) {
    _uploadedIdentificacao = value;
    prefs.setBool('ff_uploadedIdentificacao', value);
  }

  bool _uploadedComprovante = false;
  bool get uploadedComprovante => _uploadedComprovante;
  set uploadedComprovante(bool value) {
    _uploadedComprovante = value;
    prefs.setBool('ff_uploadedComprovante', value);
  }

  bool _uploadedPAD = false;
  bool get uploadedPAD => _uploadedPAD;
  set uploadedPAD(bool value) {
    _uploadedPAD = value;
    prefs.setBool('ff_uploadedPAD', value);
  }

  bool _uploadedComprovanteBanco = false;
  bool get uploadedComprovanteBanco => _uploadedComprovanteBanco;
  set uploadedComprovanteBanco(bool value) {
    _uploadedComprovanteBanco = value;
    prefs.setBool('ff_uploadedComprovanteBanco', value);
  }

  bool _uploadedContraCheque = false;
  bool get uploadedContraCheque => _uploadedContraCheque;
  set uploadedContraCheque(bool value) {
    _uploadedContraCheque = value;
    prefs.setBool('ff_uploadedContraCheque', value);
  }

  bool _uploadedRecompra = false;
  bool get uploadedRecompra => _uploadedRecompra;
  set uploadedRecompra(bool value) {
    _uploadedRecompra = value;
    prefs.setBool('ff_uploadedRecompra', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
