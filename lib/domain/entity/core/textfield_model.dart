import 'package:freezed_annotation/freezed_annotation.dart';

part 'textfield_model.freezed.dart';

@freezed
class TextFieldModel with _$TextFieldModel {
  const factory TextFieldModel(
      {required String value,
      @Default('') String errorMessage,
      @Default(false) bool isEmpty}) = _TextFieldModel;

  factory TextFieldModel.empty() =>
      const TextFieldModel(value: '', errorMessage: '', isEmpty: false);
}
