import 'package:template/features/purchase/models/substitute.dart';

/// 재료 정보를 담는 클래스
class Ingredient {
  /// 재료 생성자
  const Ingredient({
    required this.name,
    required this.substitutes,
    required this.description,
    required this.imageUrl,
    required this.purchaseUrl,
  });

  /// 재료 이름
  final String name;

  /// 대체 가능한 재료 목록
  final List<Substitute> substitutes;

  /// 재료 설명
  final String description;

  /// 재료 이미지 URL
  final String imageUrl;

  /// 구매 링크 URL
  final String purchaseUrl;

  @override
  String toString() {
    return 'Ingredient(name: $name, substitutes: $substitutes, description: $description, imageUrl: $imageUrl, referenceUrl: $purchaseUrl)';
  }
}
