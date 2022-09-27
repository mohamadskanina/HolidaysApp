import 'package:json_annotation/json_annotation.dart';

part 'countrymodel.g.dart';

@JsonSerializable()
class CountryModel {
  String? date;
  String? localName;
  String? name;
  String? countryCode;
  bool? fixed;
  bool? global;
  List<dynamic>? counties;
  int? launchYear;
  String? type;

  CountryModel(
      {this.date,
      this.localName,
      this.name,
      this.countryCode,
      this.fixed,
      this.global,
      this.counties,
      this.launchYear,
      this.type});

  CountryModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    localName = json['localName'];
    name = json['name'];
    countryCode = json['countryCode'];
    fixed = json['fixed'];
    global = json['global'];
    counties = json['counties'];
    launchYear = json['launchYear'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['localName'] = this.localName;
    data['name'] = this.name;
    data['countryCode'] = this.countryCode;
    data['fixed'] = this.fixed;
    data['global'] = this.global;
    data['counties'] = this.counties;
    data['launchYear'] = this.launchYear;
    data['type'] = this.type;
    return data;
  }
}
