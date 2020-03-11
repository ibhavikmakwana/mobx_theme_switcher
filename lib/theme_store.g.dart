// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ThemeStore on _ThemeStore, Store {
  final _$themeStoreAtom = Atom(name: '_ThemeStore.themeStore');

  @override
  ThemeData get themeStore {
    _$themeStoreAtom.context.enforceReadPolicy(_$themeStoreAtom);
    _$themeStoreAtom.reportObserved();
    return super.themeStore;
  }

  @override
  set themeStore(ThemeData value) {
    _$themeStoreAtom.context.conditionallyRunInAction(() {
      super.themeStore = value;
      _$themeStoreAtom.reportChanged();
    }, _$themeStoreAtom, name: '${_$themeStoreAtom.name}_set');
  }

  final _$_ThemeStoreActionController = ActionController(name: '_ThemeStore');

  @override
  void switchTheme() {
    final _$actionInfo = _$_ThemeStoreActionController.startAction();
    try {
      return super.switchTheme();
    } finally {
      _$_ThemeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'themeStore: ${themeStore.toString()}';
    return '{$string}';
  }
}
