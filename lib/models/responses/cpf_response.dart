class CPFResponse {
  final bool success;
  final CPFData data;

  CPFResponse({
    required this.success,
    required this.data,
  });

  factory CPFResponse.fromJson(Map<String, dynamic> json) {
    return CPFResponse(
      success: json['success'] as bool,
      data: CPFData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  @override
  String toString() {
    return 'success: $success, data: ${data.toString()}';
  }
}

class CPFData {
  final String nome;
  final String datNascimento;
  final String mae;
  final String sexo;

  CPFData({
    required this.nome,
    required this.datNascimento,
    required this.mae,
    required this.sexo,
  });

  factory CPFData.fromJson(Map<String, dynamic> json) {
    return CPFData(
      nome: json['nome'] as String,
      datNascimento: json['dat_nascimento'] as String,
      mae: json['mae'] as String,
      sexo: json['sexo'] as String,
    );
  }

  @override
  String toString() {
    return 'nome: $nome, dat_nascimento: $datNascimento, mae: $mae, sexo: $sexo';
  }
}
