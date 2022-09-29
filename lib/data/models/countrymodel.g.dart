// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countrymodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryModel _$CountryModelFromJson(Map<String, dynamic> json) => CountryModel(
      date: json['date'] as String?,
      localName: json['localName'] as String?,
      name: json['name'] as String?,
      countryCode: json['countryCode'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$CountryModelToJson(CountryModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'localName': instance.localName,
      'name': instance.name,
      'countryCode': instance.countryCode,
      'type': instance.type,
    };
