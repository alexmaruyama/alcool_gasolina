import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _mensagem = '';

  void _calcular() {
    double precoAlcool = double.tryParse(_controllerAlcool.text);
    double precoGasolina = double.tryParse(_controllerGasolina.text);

    setState(() {
      if (precoAlcool == null || precoGasolina == null) {
        _mensagem =
            'Campo não pode estar em branco. Utilizar PONTO e não VÍRGULA';
      } else {
        if ((precoAlcool / precoGasolina) >= 0.7) {
          _mensagem = 'Gasolina é mais vantajosa';
        } else {
          _mensagem = 'Álcool é mais vantajoso';
        }
      }
    });
  }

  void _limpar() {
    _controllerAlcool.text = '';
    _controllerGasolina.text = '';
    setState(() {
      _mensagem = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Álcool ou Gasolina'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            Image.asset('imagens/logo.png'),
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Text(
                'Saiba qual a melhor opção para abastecimento do seu carro',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            TextField(
              controller: _controllerAlcool,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Digite o preço do álcool Ex: 3.60',
              ),
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
              ),
            ),
            TextField(
              controller: _controllerGasolina,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Digite o preço da gasolina Ex: 4.60',
              ),
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    onPressed: _calcular,
                    child: Text('Calcular'),
                    color: Colors.blue,
                    textColor: Colors.white,
                  ),
                  RaisedButton(
                    onPressed: _limpar,
                    child: Text(
                      'Limpar',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                _mensagem,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
