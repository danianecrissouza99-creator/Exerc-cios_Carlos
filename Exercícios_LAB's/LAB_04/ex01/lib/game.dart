import 'package:flutter/material.dart';
import 'dart:math';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  // TODO 1 — Declara as variáveis de estado necessárias:
  //   • _appImage (AssetImage) — imagem inicial: "assets/images/pedra.png"
  //   • _message (String)     — mensagem inicial: "Escolhe:"
  //   • _userScore, _appScore, _draws (int) — placar, inicializados a 0
  //   • _messageColor (Color) — cor inicial: Colors.black87

  AssetImage _appImage = const AssetImage("assets/imagens/pedra.png");
  String _message = "Escolhe:";
  int _userScore = 0;
  int _appScore = 0;
  int _draws = 0;
  Color _messageColor = Colors.black87;

  void _reset() {
    // TODO 2 — Repõe todas as variáveis ao estado inicial com setState()
    setState(() {
      _appImage = const AssetImage("assets/imagens/pedra.png");
      _message = "Escolhe:";
      _userScore = 0;
      _appScore = 0;
      _draws = 0;
      _messageColor = Colors.black87;
    });
  }

  Widget _scoreBox(String label, int value, Color color) {
    // TODO 3 — Devolve uma Column com o label e o valor
    //          formatados com as cores recebidas
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          value.toString(),
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }

  void _onOptionSelected(String userChoice) {
    // TODO 4 — Gera aleatoriamente a escolha da app (pedra/papel/tesoura)
    //          usando Random().nextInt(3)

    final choices = ['pedra', 'papel', 'tesoura'];
    final random = Random();
    final appChoice = choices[random.nextInt(3)];

    // TODO 5 — Actualiza _appImage com setState() conforme a escolha da app

    setState(() {
      _appImage = AssetImage("assets/imagens/$appChoice.png");

      // TODO 6 — Determina o resultado (vitória/derrota/empate) e actualiza
      //          _message, _messageColor e os contadores com setState()
      //          Regras: pedra vence tesoura · tesoura vence papel · papel vence pedra

      if (userChoice == appChoice) {
        _message = "Empate!";
        _messageColor = Colors.orange;
        _draws++;
      } else if ((userChoice == 'pedra' && appChoice == 'tesoura') ||
                 (userChoice == 'tesoura' && appChoice == 'papel') ||
                 (userChoice == 'papel' && appChoice == 'pedra')) {
        _message = "Ganhaste!";
        _messageColor = Colors.green;
        _userScore++;
      } else {
        _message = "Perdeste!";
        _messageColor = Colors.red;
        _appScore++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pedra, Papel & Tesoura"),
        actions: [
          // TODO 7 — Adiciona um IconButton com Icons.refresh que chama _reset()
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _reset,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // TODO 8 — Row com os três scoreBox (Tu | Empates | App)
          //          Envolve num Container com padding vertical 16
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _scoreBox("Tu", _userScore, Colors.blue),
                _scoreBox("Empates", _draws, Colors.orange),
                _scoreBox("App", _appScore, Colors.red),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(top: 16, bottom: 8),
            child: Text(
              "Escolha da App:",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          // TODO 9 — Mostra a imagem da app usando _appImage

          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Image(
              image: _appImage,
              height: 100,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 16),
            child: Text(
              // TODO 10 — Substitui por _message e usa _messageColor no TextStyle
              _message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: _messageColor,
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // TODO 11 — Três GestureDetector, cada um com a imagem
              //            correspondente (height: 100) e onTap a chamar
              //            _onOptionSelected com o argumento correcto
              GestureDetector(
                onTap: () => _onOptionSelected('pedra'),
                child: Image.asset(
                  'assets/imagens/pedra.png',
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _onOptionSelected('papel'),
                child: Image.asset(
                  'assets/imagens/papel.png',
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _onOptionSelected('tesoura'),
                child: Image.asset(
                  'assets/imagens/tesoura.png',
                  height: 100,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}