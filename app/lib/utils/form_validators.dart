import 'package:app/utils/dto_constants.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

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

  static String? Function(String?) username(String alphanumeric) =>
      FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormValidators.alphanumeric(alphanumeric),
        FormBuilderValidators.maxLength(DtoConstants.maxNumChUsername),
        FormBuilderValidators.minLength(DtoConstants.minNumChUsername),
      ]);

  static final description = FormBuilderValidators.compose([
    FormBuilderValidators.maxLength(DtoConstants.maxDescriptionChUsername),
  ]);

  static final name = FormBuilderValidators.compose([
    FormBuilderValidators.required(),
    FormBuilderValidators.maxLength(DtoConstants.maxNumChName),
    FormBuilderValidators.minLength(DtoConstants.minNumChName),
  ]);
}
