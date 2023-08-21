import 'dart:collection';

class ExtendableList<T> with ListMixin<T> {
  final List<T?> _list = [];

  @override
  int get length => _list.length;

  @override
  T operator [](int index) => _list[index] as T;

  @override
  void operator []=(int index, T value) => _list[index] = value;

  @override
  set length(int newLength) => _list.length = newLength;
}