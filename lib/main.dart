import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explore Mundo', // Título do aplicativo
      theme: ThemeData(
        primarySwatch: Colors.blue, // Cor principal do aplicativo
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Explore Mundo'), // Título da barra de navegação
        ),
        body: ListView(
          children: [
            // Imagem destacada da cabana
            Image.asset(
              'images/lake.jpeg', // Caminho para a imagem
              width: 600, // Largura da imagem
              height: 240, // Altura da imagem
              fit: BoxFit.cover, // Ajuste da imagem dentro do espaço disponível
            ),
            // Seção de título
            titleSection,
            // Seção de botões
            buttonSection,
            // Seção de texto
            textSection,
          ],
        ),
      ),
    );
  }
}

// Seção de título da cabana
Widget titleSection = Container(
  padding: const EdgeInsets.all(32), // Espaçamento interno
  child: Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alinhamento à esquerda
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 8), // Espaçamento inferior
              child: const Text(
                'Oeschinen Lake Campground', // Nome do local
                style: TextStyle(
                  fontWeight: FontWeight.bold, // Título em negrito
                ),
              ),
            ),
            Text(
              'Kandersteg, Switzerland', // Localização da cabana
              style: TextStyle(
                color: Colors.grey[500], // Cor cinza para o subtítulo
              ),
            ),
          ],
        ),
      ),
      Icon(
        Icons.star, // Ícone de estrela para avaliação
        color: Colors.red[500], // Cor da estrela
      ),
      const Text('41'), // Avaliação do local (pontuação)
    ],
  ),
);

// Método auxiliar para criar colunas de botões
Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color), // Ícone do botão
      Container(
        margin: const EdgeInsets.only(top: 8), // Espaçamento superior
        child: Text(
          label, // Texto do botão
          style: TextStyle(
            fontSize: 12, // Tamanho da fonte
            fontWeight: FontWeight.w400, // Peso da fonte
            color: color, // Cor do texto
          ),
        ),
      ),
    ],
  );
}

// Seção de botões (chamada, rota e compartilhamento)
Widget buttonSection = Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Distribuição dos botões
  children: [
    _buildButtonColumn(Colors.blue, Icons.call, 'CALL'), // Botão de chamada
    _buildButtonColumn(Colors.blue, Icons.near_me, 'ROUTE'), // Botão de rota
    _buildButtonColumn(Colors.blue, Icons.share, 'SHARE'), // Botão de compartilhamento
  ],
);

// Seção de texto com informações sobre o local
Widget textSection = Container(
  padding: const EdgeInsets.all(32), // Espaçamento interno
  child: const Text(
    'O Lago Oeschinen fica aos pés do Blüemlisalp nos Alpes Berneses. '
        'Situado a 1.578 metros acima do nível do mar, é um dos lagos alpinos mais amplos. '
        'Um passeio de teleférico a partir de Kandersteg, seguido por meia hora de caminhada por pastagens e floresta de pinheiros, '
        'leva você ao lago, que aquece até 20 graus Celsius no verão. As atividades desfrutadas aqui incluem remo e andar no tobogã de verão.',
    softWrap: true, // Quebra de linha automática
  ),
);
