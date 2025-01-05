import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:blockchain_project/features/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/io.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<DashboardInitialFechEvent>(dashboardInitialFechEvent);
  }

  List<TransactionModel> transactions = [];
  Web3Client? _web3Client;
  late ContractAbi _abiCode;

  FutureOr<void> dashboardInitialFechEvent(
    DashboardInitialFechEvent event,
    Emitter<DashboardState> emit,
  ) async {
    emit(DashboardLoadingState());
    final rpcUrl = 'http://127.0.0.1:7545';
    final socketUrl = 'ws://127.0.0.1:7545';
    final privateKey =
        '0x2dee7a178aa2b65efd434a5eca960ed71111639e9c3d8fd58af351eb24e8ae72';

    _web3Client = Web3Client(
      rpcUrl,
      http.Client(),
      socketConnector: () {
        return IOWebSocketChannel.connect(socketUrl).cast<String>();
      },
    );

    String abiFile = await rootBundle
        .loadString('build/contracts/ExpenseManagerContract.json');
    var jsonDecoded = jsonDecode(abiFile);

    _abiCode = ContractAbi.fromJson(
        jsonEncode(jsonDecoded['abi']), 'ExpenseManagerContract');
  }
}
