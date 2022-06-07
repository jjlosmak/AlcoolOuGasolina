import 'package:flutter/material.dart';

class AlcoolOuGasolina extends StatefulWidget {
  @override
  _AlcoolOuGasolinaState createState() => _AlcoolOuGasolinaState();
}

class _AlcoolOuGasolinaState extends State<AlcoolOuGasolina> {
  TextEditingController _controllererAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  var _resultado = " ";

  void _calcular() {
    var precoAlcool = double.tryParse(_controllererAlcool.text);
    var precoGasolina = double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _resultado = "numero invalido, digite numeros maiores que zero e separados por (.)";
      });
    } else {
      if ((precoAlcool / precoGasolina) >= 0.7) {
        setState(() {
          _resultado = "É melhor abastecer com gasolina";
        });
      } else {
        setState(() {
          _resultado = "É melhor abastecer com alcool";
        });
      }
    }

    limparCampos();
  }

  void limparCampos() {
    _controllerGasolina.text = " ";
    _controllererAlcool.text = " ";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Alcool ou Gasolina',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: Container(
          child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(32),
              child: Column(
                children: <Widget>[
                  Image.asset('imagens/logo.png'),
                  Padding(padding: EdgeInsets.all(16)),
                  Text(
                    'Saiba qual a melhor opção para o abastecimento do seu carro',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: 'Preço alcool, ex 1.59'),
                    controller: _controllererAlcool,
                    maxLength: 4,
                  ),
                  TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: 'Preço gasolina, ex 3.15'),
                    controller: _controllerGasolina,
                    maxLength: 4,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16, bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: _calcular,
                          child: Text(
                            'Calcular',
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                          color: Colors.blue[900],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(32),
                    child: Column(
                      children: <Widget>[
                        Text(
                          '$_resultado',
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
