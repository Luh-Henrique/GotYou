import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_app_gotyou/request_helper.dart';
import 'package:flutter_app_gotyou/request.dart';
import 'package:flutter_app_gotyou/request_dialog.dart';

class RequestPage extends StatefulWidget {
  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  List<Request> _requestList = [];
  RequestHelper _helper = RequestHelper();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _helper.getAll().then((list) {
      setState(() {
        _requestList = list;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Requisições')),
      floatingActionButton:
      FloatingActionButton(child: Icon(Icons.add), onPressed: _addNewRequest),
      body: _buildRequestList(),
    );
  }

  Widget _buildRequestList() {
    if (_requestList.isEmpty) {
      return Center(
        child: _loading ? CircularProgressIndicator() : Text(
            "Sem requisições!"),
      );
    } else {
      return ListView.builder(
        itemBuilder: _buildRequestItemSlidable,
        itemCount: _requestList.length,
      );
    }
  }

  Widget _buildRequestItem(BuildContext context, int index) {
    final request = _requestList[index];
    return CheckboxListTile(
      value: request.done,
      title: Text(request.requester),
      subtitle: Text(request.description),
      onChanged: (bool isChecked) {
        setState(() {
          request.done = isChecked;
        });

        _helper.update(request);
      },
    );
  }

    Widget _buildRequestItemSlidable(BuildContext context, int index) {
      return Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.25,
        child: _buildRequestItem(context, index),
        actions: <Widget>[
          IconSlideAction(
            caption: 'Editar',
            color: Colors.blue,
            icon: Icons.edit,
            onTap: () {
              _addNewRequest(editedRequest: _requestList[index], index: index);
            },
          ),
          IconSlideAction(
            caption: 'Excluir',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () {
              _deleteRequest(deletedRequest: _requestList[index], index: index);
            },
          ),
        ],
      );
    }

  Future _addNewRequest({Request editedRequest, int index}) async {
    final request = await showDialog<Request>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return RequestDialog(request: editedRequest);
      },
    );

    if (request != null) {
      setState(() {
        if (index == null) {
          _requestList.add(request);
          _helper.save(request);
        } else {
          _requestList[index] = request;
          _helper.update(request);
        }
      });
    }
  }

  void _deleteRequest({Request deletedRequest, int index}) {
    setState(() {
      _requestList.removeAt(index);
    });

    _helper.delete(deletedRequest.id);

    Flushbar(
      title: "Exclusão de Requisições",
      message: "Requisição \"${deletedRequest.requester}\" removida.",
      margin: EdgeInsets.all(8),
      duration: Duration(seconds: 3),
      mainButton: TextButton(
        child: Text(
          "Desfazer",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          setState(() {
            _requestList.insert(index, deletedRequest);
            _helper.update(deletedRequest);
          });
        },
      ),
    )..show(context);
  }
}