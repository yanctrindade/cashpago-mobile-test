class ServiceResponseItem {
  final String id;
  final String tipo;
  final String nomeTipo;
  final String nome;
  final double valor;

  ServiceResponseItem({
    required this.id,
    required this.tipo,
    required this.nomeTipo,
    required this.nome,
    required this.valor,
  });

  factory ServiceResponseItem.fromJson(Map<String, dynamic> json) {
    return ServiceResponseItem(
      id: json['id'],
      tipo: json['tipo'],
      nomeTipo: json['nome_tipo'],
      nome: json['nome'],
      valor: (json['valor'] as num).toDouble(),
    );
  }
}