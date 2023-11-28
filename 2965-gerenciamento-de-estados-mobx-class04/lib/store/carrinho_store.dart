import 'package:mobx/mobx.dart';

import '../models/item.dart';

part 'carrinho_store.g.dart';

class CarrinhoStore = _CarrinhoStore with _$CarrinhoStore;

abstract class _CarrinhoStore with Store {
  @observable
  List<Item> listItem = ObservableList<Item>();

  @computed
  int get quantidadeItem => listItem.length;

  @computed
  bool get isEmpty => listItem.isEmpty;

  @action
  void adicionarCarrinho(Item item) {
    listItem.add(item);
  }

  @action
  removeCarrinho(Item item) {
    listItem.remove(item);
  }
}
