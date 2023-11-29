import 'package:mobx/mobx.dart';

import '../models/item.dart';

part 'carrinho_store.g.dart';

class CarrinhoStore = _CarrinhoStore with _$CarrinhoStore;

abstract class _CarrinhoStore with Store {
  @observable
  List<Item> listItem = ObservableList<Item>();

  @observable
  double totalDaCompra = 0;

  @computed
  int get quantidadeItem => listItem.length;

  @computed
  bool get isEmpty => listItem.isEmpty;

  @action
  void adicionarCarrinho(Item item) {
    listItem.add(item);
    atualizaTotalDaCompra();
  }

  @action
  removeCarrinho(Item item) {
    listItem.remove(item);
    atualizaTotalDaCompra();
  }

  @action
  void atualizaTotalDaCompra() {
    totalDaCompra = 0;
    for (var i = 0; i < listItem.length; i++) {
      totalDaCompra += listItem[i].preco;
    }
  }
}
