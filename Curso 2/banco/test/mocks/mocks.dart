import 'package:banco/database/dao/contato_dao.dart';
import 'package:banco/http/webclient/transacao_webclient.dart';
import 'package:mockito/mockito.dart';

class MockContatoDao extends Mock implements ContatoDao {}

class MockTransactionWebClient extends Mock implements TransactionWebClient {}
