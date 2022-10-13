class FormValidators {
  String? isRequired(dynamic value) {
    if (value.toString().isEmpty) {
      return "Campo Obligatorio";
    }

    return null;
  }
}
