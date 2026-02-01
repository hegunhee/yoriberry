import 'package:template/features/purchase/models/ingredient.dart';
import 'package:template/features/purchase/models/substitute.dart';

/// 한국 요리 재료 더미 데이터
final dummyIngredients = <Ingredient>[
  // 1. 간장
  const Ingredient(
    name: '간장',
    substitutes: [
      Substitute(
        name: '쯔유',
        description: '일본식 간장 베이스 소스로, 간장보다 단맛이 강하고 감칠맛이 있습니다',
        imageUrl: 'https://picsum.photos/seed/tsuyu/400/300',
        ratio: '1:0.8',
      ),
      Substitute(
        name: '타마리 간장',
        description: '글루텐 프리 일본 간장으로 진한 맛이 특징입니다',
        imageUrl: 'https://picsum.photos/seed/tamari/400/300',
        ratio: '1:1',
      ),
    ],
    description: '짭짤하고 감칠맛이 나며, 국물 요리와 볶음 요리에 깊은 맛을 더해줍니다',
    imageUrl: 'https://picsum.photos/seed/soy-sauce/400/300',
    purchaseUrl: 'https://search.shopping.naver.com/search/all?query=간장',
  ),

  // 2. 고추장
  const Ingredient(
    name: '고추장',
    substitutes: [
      Substitute(
        name: '미소된장',
        description: '일본 된장으로 매운맛은 없지만 감칠맛을 더할 수 있습니다',
        imageUrl: 'https://picsum.photos/seed/miso/400/300',
        ratio: '1:1',
      ),
    ],
    description: '매콤하고 달콤한 맛이 특징이며, 비빔밥과 찌개에 깊은 맛과 색을 더해줍니다',
    imageUrl: 'https://picsum.photos/seed/gochujang/400/300',
    purchaseUrl: 'https://search.shopping.naver.com/search/all?query=고추장',
  ),

  // 3. 된장
  const Ingredient(
    name: '된장',
    substitutes: [
      Substitute(
        name: '미소된장',
        description: '일본 된장으로 한국 된장보다 부드럽고 단맛이 있습니다',
        imageUrl: 'https://picsum.photos/seed/miso2/400/300',
        ratio: '1:1',
      ),
    ],
    description: '구수하고 깊은 감칠맛이 나며, 찌개와 국에 진한 풍미를 더해줍니다',
    imageUrl: 'https://picsum.photos/seed/doenjang/400/300',
    purchaseUrl: 'https://search.shopping.naver.com/search/all?query=된장',
  ),

  // 4. 참기름
  const Ingredient(
    name: '참기름',
    substitutes: [
      Substitute(
        name: '고마아부라',
        description: '일본식 참기름으로 한국 참기름과 비슷하지만 향이 약간 더 고소합니다',
        imageUrl: 'https://picsum.photos/seed/goma/400/300',
        ratio: '1:1',
      ),
    ],
    description: '진한 고소한 향과 맛이 특징이며, 나물과 무침 요리에 풍미를 더해줍니다',
    imageUrl: 'https://picsum.photos/seed/sesame-oil/400/300',
    purchaseUrl: 'https://search.shopping.naver.com/search/all?query=참기름',
  ),

  // 5. 고춧가루
  const Ingredient(
    name: '고춧가루',
    substitutes: [
      Substitute(
        name: '시치미',
        description: '일본 7가지 향신료 혼합물로 매운맛과 향을 더할 수 있습니다',
        imageUrl: 'https://picsum.photos/seed/shichimi/400/300',
        ratio: '1:0.5',
      ),
      Substitute(
        name: '이치미',
        description: '일본 고추가루로 한국 고춧가루보다 매운맛이 강합니다',
        imageUrl: 'https://picsum.photos/seed/ichimi/400/300',
        ratio: '1:0.7',
      ),
    ],
    description: '매콤하고 은은한 단맛이 있으며, 김치와 찌개에 매운맛과 붉은 색을 더해줍니다',
    imageUrl: 'https://picsum.photos/seed/pepper-powder/400/300',
    purchaseUrl: 'https://search.shopping.naver.com/search/all?query=고춧가루',
  ),

  // 6. 다진 마늘
  const Ingredient(
    name: '다진 마늘',
    substitutes: [
      Substitute(
        name: '마늘 튜브',
        description: '일본식 마늘 페이스트로 편리하게 사용할 수 있습니다',
        imageUrl: 'https://picsum.photos/seed/garlic-tube/400/300',
        ratio: '1:1',
      ),
    ],
    description: '알싸하고 향긋한 맛이 특징이며, 거의 모든 요리에 깊은 맛을 더해줍니다',
    imageUrl: 'https://picsum.photos/seed/garlic/400/300',
    purchaseUrl: 'https://search.shopping.naver.com/search/all?query=다진마늘',
  ),
];

/// 내 냉장고에 있는 재료들 더미 데이터
final myIngredients = <String>{
  '고추장',
  '고춧가루',
};
