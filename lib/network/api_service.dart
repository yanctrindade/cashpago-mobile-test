import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/responses/cpf_response.dart';
import '../models/responses/service_response_item.dart';
import '../models/service.dart';
import 'api_service_endpoints.dart';

abstract class ApiService {
  final String baseUrl = ApiServiceEndpoints.baseUrl.endpoint;

  Future<List<Service>> getServices();
  Future<CPFResponse> cpfSearch(String cpf);
  Future<http.Response> postSales(Map<String, dynamic> data);
}

class ApiServiceImp extends ApiService {
  ApiServiceImp();

  @override
  Future<CPFResponse> cpfSearch(String cpf) async {
    const endpoint = ApiServiceEndpoints.cpfSearch;
    try {
      final response = await http.post(
        Uri.parse(baseUrl + endpoint.endpoint),
        headers: endpoint.headers,
        body: jsonEncode({'cpf': cpf}),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final cpfResponse = CPFResponse.fromJson(data);
        return cpfResponse;
      } else {
        throw Exception('Failed to search CPF');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  @override
  Future<List<Service>> getServices() async {
    const endpoint = ApiServiceEndpoints.services;
    try {
      final response = await http.get(
        Uri.parse(baseUrl + endpoint.endpoint),
        headers: endpoint.headers,
      );
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        debugPrint(json.encode(jsonResponse));
        final List<dynamic> data = jsonResponse['data'];
        final List<Service> services = data
            .map((item) =>
                Service.fromServiceResponse(ServiceResponseItem.fromJson(item)))
            .toList();

        return services;
      } else {
        throw Exception('Failed to load services');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  @override
  Future<http.Response> postSales(Map<String, dynamic> data) {
    // TODO: implement postSales
    throw UnimplementedError();
  }
}
