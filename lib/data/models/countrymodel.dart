import 'package:json_annotation/json_annotation.dart';

part 'countrymodel.g.dart';

@JsonSerializable()
class CountryModel {
  String? date;
  String? localName;
  String? name;
  String? countryCode;
  String? type;
  CountryModel(
      {this.date, this.localName, this.name, this.countryCode, this.type});

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountryModelToJson(this);
}
