import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'theme_store.g.dart';

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  //Let's generate theme_store.g.dart file using a command.
  @observable
  ThemeData themeStore = ThemeData.fallback();

  @action
  void switchTheme() {
    if (themeStore == ThemeData.fallback()) {
      themeStore = ThemeData.dark();
    } else {
      themeStore = ThemeData.fallback();
    }

    //Let's updated generated file.
  }
}
