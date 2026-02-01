import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/features/purchase/models/dummy_ingredients.dart';
import 'package:template/features/purchase/models/ingredient.dart';

/// 재료 목록을 관리하는 Provider
final ingredientControllerProvider =
    NotifierProvider<IngredientController, IngredientState>(
      IngredientController.new,
    );

/// 재료 목록을 관리하는 Notifier
class IngredientController extends Notifier<IngredientState> {
  @override
  IngredientState build() {
    return IngredientState(
      ingredients: dummyIngredients,
      myFridgeIngredients: myIngredients,
    );
  }

  /// 재료 추가
  void addIngredient(Ingredient ingredient) {
    state = state.copyWith(
      ingredients: [...state.ingredients, ingredient],
    );
  }

  /// 재료 제거
  void removeIngredient(String name) {
    state = state.copyWith(
      ingredients: state.ingredients
          .where((ingredient) => ingredient.name != name)
          .toList(),
    );
  }

  /// 특정 재료 찾기
  Ingredient? findByName(String name) {
    return state.ingredients.cast<Ingredient?>().firstWhere(
      (ingredient) => ingredient?.name == name,
      orElse: () => null,
    );
  }

  /// 냉장고 재료 필터링 토글
  void toggleFridgeFilter() {
    state = state.copyWith(
      hideMyFridgeIngredients: !state.hideMyFridgeIngredients,
    );
  }
}

/// 재료 관리 상태
class IngredientState {
  /// 재료 관리 상태
  const IngredientState({
    required this.ingredients,
    required this.myFridgeIngredients,
    this.hideMyFridgeIngredients = false,
  });

  /// 전체 재료 목록
  final List<Ingredient> ingredients;

  /// 냉장고에 있는 재료 이름 목록
  final Set<String> myFridgeIngredients;

  /// 냉장고 재료 필터링 활성화 여부
  final bool hideMyFridgeIngredients;

  /// 필터링된 재료 목록 (냉장고 재료 제외)
  List<Ingredient> get filteredIngredients {
    if (!hideMyFridgeIngredients) {
      return ingredients;
    }
    return ingredients
        .where((ingredient) => !myFridgeIngredients.contains(ingredient.name))
        .toList();
  }

  /// 상태 복사
  IngredientState copyWith({
    List<Ingredient>? ingredients,
    Set<String>? myFridgeIngredients,
    bool? hideMyFridgeIngredients,
  }) {
    return IngredientState(
      ingredients: ingredients ?? this.ingredients,
      myFridgeIngredients: myFridgeIngredients ?? this.myFridgeIngredients,
      hideMyFridgeIngredients:
          hideMyFridgeIngredients ?? this.hideMyFridgeIngredients,
    );
  }
}
