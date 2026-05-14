class usuario {
  int id;
  String nome;
  String? telefone;

  usuario({required this.id, required this.nome, this.telefone});


}


void main() {
 
  List<Map<String, dynamic>> usuarios = [
    
    {"id": 0000001, "nome":"Luiz", "fone": '4141-4141'},
    {"id": 0000002, "nome":"Fernando", "fone": null},
    {"id": 0000003, "nome":"Lorenzo", "fone": '5252-5252'},
    {"id": 0000004, "nome":"Junior", "fone": '6363-6363'},
  ];
  List<String> nome = usuarios.map((user) {
    return (user['nome'] as String).toUpperCase();
  }).toList();

  nome.forEach((elemento) {
    print(elemento);
  });
 } 