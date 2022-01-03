// To parse this JSON data, do
//
//     final traceRouteResponse = traceRouteResponseFromJson(jsonString);

import 'dart:convert';

TraceRouteResponse traceRouteResponseFromJson(String str) => TraceRouteResponse.fromJson(json.decode(str));

String traceRouteResponseToJson(TraceRouteResponse data) => json.encode(data.toJson());

class TraceRouteResponse {
    TraceRouteResponse({
        this.query,
        this.response,
    });

    Query? query;
    Response? response;

    factory TraceRouteResponse.fromJson(Map<String, dynamic> json) => TraceRouteResponse(
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

    String ?tool;
    String? domain;

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
        this.hops,
    });

    List<Hop>? hops;

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        hops: List<Hop>.from(json["hops"].map((x) => Hop.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "hops": List<dynamic>.from(hops!.map((x) => x.toJson())),
    };
}

class Hop {
    Hop({
        this.number,
        this.hostname,
        this.ip,
        this.rtt,
    });

    String? number;
    String? hostname;
    String? ip;
    String? rtt;

    factory Hop.fromJson(Map<String, dynamic> json) => Hop(
        number: json["number"],
        hostname: json["hostname"],
        ip: json["ip"],
        rtt: json["rtt"],
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "hostname": hostname,
        "ip": ip,
        "rtt": rtt,
    };
}
