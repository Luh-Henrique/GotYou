import 'package:flutter/material.dart';
import 'package:flutter_app_gotyou/request.dart';

class RequestDialog extends StatefulWidget {
  final Request request;

  // Construtor para receber uma tarefa quando precisar edita-la
  RequestDialog({this.request});

  @override
  _RequestDialogState createState() => _RequestDialogState();
}

class _RequestDialogState extends State<RequestDialog> {
  final _requesterController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _itemController = TextEditingController();

  Request _currentRequest = Request();

  @override
  void initState() {
    super.initState();

    // Verifica se foi enviado alguma tarefa para edição
    // Caso queira editar, copia-se essa tarefa
    if (widget.request != null) {
      _currentRequest = Request.fromMap(widget.request.toMap());
    }

    _requesterController.text = _currentRequest.requester;
    _descriptionController.text = _currentRequest.description;
    _itemController.text = _currentRequest.item;
  }

  @override
  void dispose() {
    super.dispose();
    _requesterController.clear();
    _descriptionController.clear();
    _itemController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.request == null ? 'Nova Requisição' : 'Editar requisições'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
              controller: _requesterController,
              decoration: InputDecoration(labelText: 'Requisitor'),
              autofocus: true),
          TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Descrição')),
          TextField(
              controller: _itemController,
              decoration: InputDecoration(labelText: 'Item')),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancelar'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Salvar'),
          onPressed: () {
            _currentRequest.requester = _requesterController.value.text;
            _currentRequest.description = _descriptionController.text;
            _currentRequest.item = _itemController.text;
            _currentRequest.done = false;

            Navigator.of(context).pop(_currentRequest);
          },
        ),
      ],
    );
  }
}

