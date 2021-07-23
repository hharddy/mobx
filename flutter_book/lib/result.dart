import 'package:flutter_book/main.dart';
import 'package:mobx/mobx.dart';
part 'result.g.dart';

class ResultStore = _ResultBase with _$ResultStore;

abstract class _ResultBase with Store {

 // @observable
  ObservableMap result =ObservableMap();


  @action
  void add(var option,String title) {

    result[title]=option;
    print(result.toString());
  }


}
