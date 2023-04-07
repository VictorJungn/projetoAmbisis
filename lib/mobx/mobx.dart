// ignore_for_file: library_private_types_in_public_api, avoid_print, unused_field, prefer_final_fields, unused_element

import 'package:mobx/mobx.dart';

part 'mobx.g.dart';

class StoreMobx = _StoreMobx with _$StoreMobx;

abstract class _StoreMobx with Store {
  @observable
  double? totalAmbiental;

  @observable
  String? concluidasAmbiental;

  @observable
  double? totalSocial;

  @observable
  String? concluidasSocial;

  @observable
  double? totalGovernanca;

  @observable
  String? concluidasGovernanca;

  @observable
  String? concluidasGeral;

  @observable
  String? mediaGeral;

  @observable
  double? crescimento;

  @observable
  String? total;

  @observable
  List<bool> isSelectedFiltro = [false, false, false, false];

  @action
  void selectButtonFiltro(int index) {
    for (int i = 0; i < isSelectedFiltro.length; i++) {
      if (i == index) {
        isSelectedFiltro[i] = true;
      } else {
        isSelectedFiltro[i] = false;
      }
    }
  }

  @observable
  List<bool> isSelected = [false, false, false, false];

  @action
  void selectButton(int index) {
    for (int i = 0; i < isSelectedFiltro.length; i++) {
      if (i == index) {
        isSelectedFiltro[i] = true;
      } else {
        isSelectedFiltro[i] = false;
      }
    }
  }
}
