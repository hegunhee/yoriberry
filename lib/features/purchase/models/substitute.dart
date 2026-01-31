/// 대체 재료 정보를 담는 클래스
class Substitute {

  /// 대체 재료 생성자
  const Substitute({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.ratio,
  });

  /// 대체 재료 이름
  final String name;

  /// 대체 재료 설명
  final String description;

  /// 대체 재료 이미지 URL
  final String imageUrl;

  /// 대체 비율 (예: "1:1", "1:0.75")
  final String ratio;

  @override
  String toString() {
    return 'Substitute(name: $name, description: $description, imageUrl: $imageUrl, ratio: $ratio)';
  }
}
