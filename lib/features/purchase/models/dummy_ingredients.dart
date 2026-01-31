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
        imageUrl:
            'https://images.unsplash.com/photo-1626200419199-391ae4be7a41',
        ratio: '1:0.8',
      ),
      Substitute(
        name: '타마리 간장',
        description: '글루텐 프리 일본 간장으로 진한 맛이 특징입니다',
        imageUrl:
            'https://images.unsplash.com/photo-1599909533730-f9d49c0c7e0e',
        ratio: '1:1',
      ),
    ],
    description: '한국 요리의 기본 조미료로, 국, 찌개, 볶음 등 다양한 요리에 사용됩니다',
    imageUrl: 'https://images.unsplash.com/photo-1599909533730-f9d49c0c7e0e',
    purchaseUrl: 'https://search.shopping.naver.com/search/all?query=간장',
  ),

  // 2. 고추장
  const Ingredient(
    name: '고추장',
    substitutes: [
      Substitute(
        name: '미소된장',
        description: '일본 된장으로 매운맛은 없지만 감칠맛을 더할 수 있습니다',
        imageUrl:
            'https://images.unsplash.com/photo-1599909533730-f9d49c0c7e0e',
        ratio: '1:1',
      ),
    ],
    description: '매콤한 맛을 내는 한국 전통 발효 조미료로 비빔밥, 찌개 등에 필수적입니다',
    imageUrl: 'https://images.unsplash.com/photo-1626200419199-391ae4be7a41',
    purchaseUrl: 'https://search.shopping.naver.com/search/all?query=고추장',
  ),

  // 3. 된장
  const Ingredient(
    name: '된장',
    substitutes: [
      Substitute(
        name: '미소된장',
        description: '일본 된장으로 한국 된장보다 부드럽고 단맛이 있습니다',
        imageUrl:
            'https://images.unsplash.com/photo-1599909533730-f9d49c0c7e0e',
        ratio: '1:1',
      ),
    ],
    description: '구수한 맛의 한국 전통 발효 식품으로 된장찌개, 쌈장 등에 사용됩니다',
    imageUrl: 'https://images.unsplash.com/photo-1626200419199-391ae4be7a41',
    purchaseUrl: 'https://search.shopping.naver.com/search/all?query=된장',
  ),

  // 4. 참기름
  const Ingredient(
    name: '참기름',
    substitutes: [
      Substitute(
        name: '고마아부라',
        description: '일본식 참기름으로 한국 참기름과 비슷하지만 향이 약간 더 고소합니다',
        imageUrl:
            'https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5',
        ratio: '1:1',
      ),
    ],
    description: '고소한 향이 특징인 참깨로 만든 기름으로 나물, 비빔밥 등에 사용됩니다',
    imageUrl: 'https://images.unsplash.com/photo-1474979266404-7eaacbcd87c5',
    purchaseUrl: 'https://search.shopping.naver.com/search/all?query=참기름',
  ),

  // 5. 고춧가루
  const Ingredient(
    name: '고춧가루',
    substitutes: [
      Substitute(
        name: '시치미',
        description: '일본 7가지 향신료 혼합물로 매운맛과 향을 더할 수 있습니다',
        imageUrl:
            'https://images.unsplash.com/photo-1583623025817-d180a2221d0a',
        ratio: '1:0.5',
      ),
      Substitute(
        name: '이치미',
        description: '일본 고추가루로 한국 고춧가루보다 매운맛이 강합니다',
        imageUrl:
            'https://images.unsplash.com/photo-1583623025817-d180a2221d0a',
        ratio: '1:0.7',
      ),
    ],
    description: '김치, 찌개 등 매운 한국 요리에 필수적인 고추를 말려 빻은 가루입니다',
    imageUrl: 'https://images.unsplash.com/photo-1583623025817-d180a2221d0a',
    purchaseUrl: 'https://search.shopping.naver.com/search/all?query=고춧가루',
  ),

  // 6. 다진 마늘
  const Ingredient(
    name: '다진 마늘',
    substitutes: [
      Substitute(
        name: '마늘 튜브',
        description: '일본식 마늘 페이스트로 편리하게 사용할 수 있습니다',
        imageUrl:
            'https://images.unsplash.com/photo-1471943311424-646960669fbc',
        ratio: '1:1',
      ),
    ],
    description: '한국 요리의 기본 양념으로 거의 모든 요리에 사용되는 필수 재료입니다',
    imageUrl: 'https://images.unsplash.com/photo-1471943311424-646960669fbc',
    purchaseUrl: 'https://search.shopping.naver.com/search/all?query=다진마늘',
  ),
];
