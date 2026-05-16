class Cliente {
  final String idCliente;
  final String nome;
  final String email;

  Cliente({
    required this.idCliente,
    required this.nome,
    required this.email,
  });
}

class Pagamento {
  final String metodo;
  final int parcelas;
  final bool confirmado;

  Pagamento({
    required this.metodo,
    required this.parcelas,
    required this.confirmado,
  });
}

class Item { 
  final String idProduto;
  final String nome;
  final double precoUnitario;
  final int quantidade;

  Item({
    required this.idProduto,
    required this.nome,
    required this.precoUnitario,
    required this.quantidade,
  });
}

class Pedido {
  final String idPedido;
  final DateTime dataCriacao;
  final String status;
  final Cliente cliente;      
  final Pagamento pagamento; 
  final List<Item> itens; 

  Pedido({
    required this.idPedido,
    required this.dataCriacao,
    required this.status,
    required this.cliente,
    required this.pagamento,
    required this.itens,
  });
}



void main() {
  // Exemplo de lista de maps a ser convertida em objetos do tipo Pedido
  final List<Map<String, dynamic>> listaPedidos = [
  {
    "id_pedido": "REQ-9872",
    "data_criacao": "2026-05-14T10:00:00Z",
    "status": "processando",
    "cliente": {
      "id_cliente": "USR-441",
      "nome": "Ana Silva",
      "email": "ana.silva@email.com",
    },
    "pagamento": {
      "metodo": "cartao_credito",
      "parcelas": 3,
      "confirmado": true,
    },
    "itens": [
      {
        "id_produto": "PROD-001",
        "nome": "Teclado Mecânico RGB",
        "preco_unitario": 349.90,
        "quantidade": 1,
      },

      {
        "id_produto": "PROD-012",
        "nome": "Mouse Pad Extendido",
        "preco_unitario": 89.90,
        "quantidade": 2,
      },
    ],
  },
  {
    "id_pedido": "REQ-9873",
    "data_criacao": "2026-05-14T10:15:00Z",
    "status": "entregue",
    "cliente": {
      "id_cliente": "USR-102",
      "nome": "Carlos Souza",
      "email": "carlos.s@email.com",
    },
    "pagamento": {"metodo": "pix", "parcelas": 1, "confirmado": true},
    "itens": [
      {
        "id_produto": "PROD-055",
        "nome": "Fone de Ouvido Bluetooth",
        "preco_unitario": 199.00,
        "quantidade": 1,
      },
    ],
  },
];

    final List<Pedido> listaObjetosPedidos = listaPedidos.map((mapaPedido) {
    
    final dadosCliente = mapaPedido['cliente'] as Map<String, dynamic>;
    final objetoCliente = Cliente(
      idCliente: dadosCliente['id_cliente'] as String,
      nome: dadosCliente['nome'] as String,
      email: dadosCliente['email'] as String,
    );

    final dadosPagamento = mapaPedido['pagamento'] as Map<String, dynamic>;
    final objetoPagamento = Pagamento(
      metodo: dadosPagamento['metodo'] as String,
      parcelas: dadosPagamento['parcelas'] as int,
      confirmado: dadosPagamento['confirmado'] as bool,
    );

    
    final listaItensBruta = mapaPedido['itens'] as List;
    final List<Item> listaObjetosItens = listaItensBruta.map((mapaItem) {
    final item = mapaItem as Map<String, dynamic>;
    return Item(
      idProduto: item['id_produto'] as String,
      nome: item['nome'] as String,
      precoUnitario: (item['preco_unitario'] as num).toDouble(),
      quantidade: item['quantidade'] as int,
      );
    }).toList();

    
    return Pedido(
      idPedido: mapaPedido['id_pedido'] as String,
      dataCriacao: DateTime.parse(mapaPedido['data_criacao'] as String),
      status: mapaPedido['status'] as String,
      cliente: objetoCliente,
      pagamento: objetoPagamento,
      itens: listaObjetosItens,
    );
  }).toList();

    for (var pedido in listaObjetosPedidos) {
    print("ID do Pedido: ${pedido.idPedido}");
    print("Nome do Cliente: ${pedido.cliente.nome}");
    print("Método de Pagamento: ${pedido.pagamento.metodo}");
    print ('Itens do Pedido:');
    for (var item in pedido.itens) {  
      print("  - ${item.nome} (Quantidade: ${item.quantidade}, Preço Unitário: R\$${item.precoUnitario})");
    }
   
  }
}







