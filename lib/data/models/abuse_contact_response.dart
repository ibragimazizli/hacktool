// To parse this JSON data, do
//
//     final abuseContactResponse = abuseContactResponseFromJson(jsonString);

import 'dart:convert';

AbuseContactResponse abuseContactResponseFromJson(String str) => AbuseContactResponse.fromJson(json.decode(str));

String abuseContactResponseToJson(AbuseContactResponse data) => json.encode(data.toJson());

class AbuseContactResponse {
    AbuseContactResponse({
        this.query,
        this.response,
    });

    Query? query;
    Response? response;

    factory AbuseContactResponse.fromJson(Map<String, dynamic> json) => AbuseContactResponse(
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
        this.domain,
    });

    String? tool;
    String ?domain;

    factory Query.fromJson(Map<String, dynamic> json) => Query(
        tool: json["tool"],
        domain: json["domain"],
    );

    Map<String, dynamic> toJson() => {
        "tool": tool,
        "domain": domain,
    };
}

class Response {
    Response({
        this.abusecontact,
    });

    String ?abusecontact;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        abusecontact: json["abusecontact"],
    );

    Map<String, dynamic> toJson() => {
        "abusecontact": abusecontact,
    };
}
