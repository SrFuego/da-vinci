class Alternativa {
  final int id;
  final String valor;

  Alternativa({
    required this.id,
    required this.valor,
  });

  factory Alternativa.fromJson(
    Map<String, dynamic> json,
  ) =>
      Alternativa(
        id: json["id"],
        valor: json["valor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "valor": valor,
      };
}
