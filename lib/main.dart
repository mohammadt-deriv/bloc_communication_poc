import 'package:feature_a/main.dart';
import 'package:feature_b/main.dart';
import 'package:feature_c/main.dart';

void main() {
  final blocA = SymbolCubit(SymbolCubitState('initialSymbol'));
  final blocB = ProductCubit(ProductCubitState('initialProduct'));

  final blocC = ProposalCubit(
    ProposalCubitState('initialState'),
    symbolStream: blocA.stream.map((event) => event.symbol),
    productStream: blocB.stream.map((event) => event.product),
  );

  blocC.stream.listen((state) => print(state.result));
}
