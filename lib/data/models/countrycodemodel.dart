import 'package:json_annotation/json_annotation.dart';

part 'countrycodemodel.g.dart';

@JsonSerializable()
class CountriesCodeModel {
  String? countryName;
  String? countryShortName;

  CountriesCodeModel({this.countryName, this.countryShortName});

  factory CountriesCodeModel.fromJson(Map<String, dynamic> json) =>
      _$CountriesCodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountriesCodeModelToJson(this);
}
