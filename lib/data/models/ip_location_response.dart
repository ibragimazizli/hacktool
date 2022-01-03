// To parse this JSON data, do
//
//     final ipLocationResponse = ipLocationResponseFromJson(jsonString);

import 'dart:convert';

IpLocationResponse ipLocationResponseFromJson(String str) =>
    IpLocationResponse.fromJson(json.decode(str));

String ipLocationResponseToJson(IpLocationResponse data) =>
    json.encode(data.toJson());

class IpLocationResponse {
  IpLocationResponse({
    this.query,
    this.response,
  });

  Query? query;
  Response? response;

  factory IpLocationResponse.fromJson(Map<String, dynamic> json) =>
      IpLocationResponse(
        query: Query.fromJson(json["query"]),
        response: Response.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "query": query!.toJson(),
        "response": response!.toJson(),
      };
}

class Query {
  Query({
    this.tool,
    this.ip,
  });

  String? tool;
  String? ip;

  factory Query.fromJson(Map<String, dynamic> json) => Query(
        tool: json["tool"],
        ip: json["ip"],
      );

  Map<String, dynamic> toJson() => {
        "tool": tool,
        "ip": ip,
      };
}

class Response {
  Response({
    this.city,
    this.zipcode,
    this.regionCode,
    this.regionName,
    this.countryCode,
    this.countryName,
    this.latitude,
    this.longitude,
    this.gmtOffset,
    this.dstOffset,
  });

  String? city;
  String? zipcode;
  String? regionCode;
  String? regionName;
  String? countryCode;
  String? countryName;
  String? latitude;
  String? longitude;
  String? gmtOffset;
  String? dstOffset;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        city: json["city"],
        zipcode: json["zipcode"],
        regionCode: json["region_code"],
        regionName: json["region_name"],
        countryCode: json["country_code"],
        countryName: json["country_name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        gmtOffset: json["gmt_offset"],
        dstOffset: json["dst_offset"],
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "zipcode": zipcode,
        "region_code": regionCode,
        "region_name": regionName,
        "country_code": countryCode,
        "country_name": countryName,
        "latitude": latitude,
        "longitude": longitude,
        "gmt_offset": gmtOffset,
        "dst_offset": dstOffset,
      };
}
