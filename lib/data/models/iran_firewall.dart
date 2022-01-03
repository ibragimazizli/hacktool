// To parse this JSON data, do
//
//     final iranFirewallResponse = iranFirewallResponseFromJson(jsonString);

import 'dart:convert';

IranFirewallResponse iranFirewallResponseFromJson(String str) => IranFirewallResponse.fromJson(json.decode(str));

String iranFirewallResponseToJson(IranFirewallResponse data) => json.encode(data.toJson());

class IranFirewallResponse {
    IranFirewallResponse({
        this.query,
        this.response,
    });

    Query ?query;
    Response? response;

    factory IranFirewallResponse.fromJson(Map<String, dynamic> json) => IranFirewallResponse(
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
        this.siteurl,
    });

    String? tool;
    String ?siteurl;

    factory Query.fromJson(Map<String, dynamic> json) => Query(
        tool: json["tool"],
        siteurl: json["siteurl"],
    );

    Map<String, dynamic> toJson() => {
        "tool": tool,
        "siteurl": siteurl,
    };
}

class Response {
    Response({
        this.result,
    });

    String ?result;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        result: json["result"],
    );

    Map<String, dynamic> toJson() => {
        "result": result,
    };
}
