class FormValidators {
  static String? Function(String?) alphanumeric(String errorText) => (value) {
        if (value != null) {
          if (value.contains(' ') ||
              !RegExp(r'^[a-z A-Z 0-9]+$').hasMatch(value)) {
            return errorText;
          }
        }

        return null;
      };
}
