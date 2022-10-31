import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

class ProposalCubitState {
  ProposalCubitState(this.result);

  final String result;
}

class ProposalCubit extends Cubit<ProposalCubitState> {
  ProposalCubit(
    super.initialState, {
    required this.symbolStream,
    required this.productStream,
  }) {
    output.listen((event) => emit(event));
  }

  final Stream<String> symbolStream;
  final Stream<String> productStream;

  Stream<ProposalCubitState> get output => Rx.combineLatest2(
        symbolStream,
        productStream,
        (symbol, product) => ProposalCubitState(
          'Start Proposal listening for $symbol and $product',
        ),
      ).debounceTime(Duration(milliseconds: 500));
}
