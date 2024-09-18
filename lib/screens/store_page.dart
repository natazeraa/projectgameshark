import 'package:flutter/material.dart';

class Produto {
  String nome;
  String imagemPath;
  double preco;
  double precoAntigo;

  Produto({
    required this.nome,
    required this.imagemPath,
    required this.preco,
    required this.precoAntigo,
  });
}

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  List<Produto> produtos = [
    Produto(
        nome: "GTA 6",
        imagemPath: "assets/gta6.png",
        preco: 290,
        precoAntigo: 300),
    Produto(
        nome: "Resident Evil 4 REMAKE",
        imagemPath: "assets/resident_evil_4_remake.png",
        preco: 159,
        precoAntigo: 169),
    Produto(
        nome: "Mortal Kombat 11",
        imagemPath: "assets/mortal_kombat_11.png",
        preco: 219,
        precoAntigo: 229),
    Produto(
        nome: "Dying Light",
        imagemPath: "assets/dying_light.png",
        preco: 40,
        precoAntigo: 50),
  ];

  List<Map<String, String>> categorias = [
    {'nome': 'Jogos Novos', 'icone': "assets/jogos_novos.png"},
    {'nome': 'Jogos semi-novos', 'icone': "assets/jogos_semi_novos.png"},
    {'nome': 'Gift-Cards', 'icone': "assets/gift_cards.png"},
    {'nome': 'DLCs', 'icone': "assets/dlcs.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 55, 5, 102),
        title: Row(
          children: [
            Icon(Icons.person, color: const Color.fromARGB(255, 0, 0, 0)),
            SizedBox(width: 10),
            Text(
              "Entregar em Casa",
              style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart, color: Colors.white),
            ),
          ],
        ),
      ),
      body: Container(
        color: const Color(0xFF240046),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.purple),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 236, 236, 236),
                  hintText: 'Buscar produtos...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 100, // Altura da área das categorias
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categorias.length,
                itemBuilder: (context, index) {
                  return _buildCategoryItem(categorias[index]);
                },
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.65, // nao mecher nunca mais ####
                ),
                itemCount: produtos.length,
                itemBuilder: (context, index) {
                  return _buildProductCard(context, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(Map<String, String> categoria) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0), // espasamento
      child: Column(
        children: [
          CircleAvatar(
            radius: 30, //  tamanho do ícone redondo
            backgroundImage:
                AssetImage(categoria['icone']!), // Carrega imagem dos assets
            backgroundColor: Colors.white,
          ),
          SizedBox(height: 8),
          Text(
            categoria['nome']!,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, int index) {
    Produto produto = produtos[index];
    return Card(
      color: const Color(0xFF1B0133),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(produto.imagemPath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              produto.nome,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '10% OFF',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                Spacer(),
                Icon(Icons.timer, color: Colors.white, size: 18),
                SizedBox(width: 5),
                Text(
                  '9 MIN',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Text(
                  'R\$ ${produto.preco}',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(width: 10),
                Text(
                  'R\$ ${produto.precoAntigo}',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove, color: Colors.white),
                  onPressed: () {},
                ),
                Text(
                  '0',
                  style: TextStyle(color: Colors.white),
                ),
                IconButton(
                  icon: Icon(Icons.add, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: StorePage(),
  ));
}
