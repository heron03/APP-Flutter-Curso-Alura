import 'package:banco/database/dao/contato_dao.dart';
import 'package:banco/http/webclient/transacao_webclient.dart';
import 'package:flutter/cupertino.dart';

class AppDependecies extends InheritedWidget {
  final ContatoDao contatoDao;
  final TransactionWebClient transactionWebClient;

  AppDependecies({
    @required this.contatoDao,
    @required this.transactionWebClient,
    @required Widget child,
  }) : super(child: child);

  static AppDependecies of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppDependecies>();
  }

  @override
  bool updateShouldNotify(AppDependecies oldWidget) {
    return contatoDao != oldWidget.contatoDao || transactionWebClient != oldWidget.transactionWebClient;
  }
}
