import '../resources/config.dart';

enum ApiServiceEndpoints {
  baseUrl,
  services,
  cpfSearch,
  sales
}

extension ApiServiceEndpointsExtension on ApiServiceEndpoints {
  String get endpoint {
    switch (this) {
      case ApiServiceEndpoints.baseUrl:
        return "https://apihml.vivacairu.com";
      case ApiServiceEndpoints.services:
        return '/services';
      case ApiServiceEndpoints.cpfSearch:
        return "/cpf/search";
      case ApiServiceEndpoints.sales:
        return "/sales";
    }
  }

  Map<String, String> get headers {
    return {
      'Authorization': 'Basic ${Config.apiKey}',
      'Content-Type': 'application/json'
    };
  }
}