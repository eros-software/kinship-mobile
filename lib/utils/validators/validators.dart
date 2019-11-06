import 'package:intl/intl.dart';

String emailValidator(value) {
  Pattern pattern =
  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (value.isEmpty) 
    return 'Por favor digite um e-mail';
  if (!regex.hasMatch(value))
    return 'Entre com um e-mail válido';
  return null;
}

String passwordValidator(value) {
  if (value.isEmpty) {
    return 'Por favor digite uma senha';
  }
  return null;
}

String emptyValidator(value, String nome) {
  if (value == null || value.isEmpty) {
    return 'Por favor digite um$nome';
  }
  return null;
}

String nomeValidator(value) {
  if (value.isEmpty) {
    return 'Por favor digite um nome';
  }
  return null;
}

String dateValidator(value) {
  try {
    new DateFormat("dd/MM/yyyy").parse(value);
  } catch (e) {
    return 'Por favor digite uma data';
  }
  return null;
}

String tryIntParseOrNull(value) {
  if (value.isEmpty) {
    return null;
  }
  if (int.tryParse(value) == null) {
    return 'Número inválido';
  }
  return null;
}