import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template/features/purchase/controllers/ingredient_controller.dart';
import 'package:url_launcher/url_launcher.dart';

/// 재료 구매하기 화면
class IngredientPurchaseScreen extends ConsumerWidget {
  /// 생성자
  const IngredientPurchaseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ingredientState = ref.watch(ingredientControllerProvider);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          '재료 구매하기',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          // 필터 토글
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: Colors.white,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.orange[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.kitchen,
                    color: Colors.orange[700],
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    '내 냉장고에 있는 재료 제외하기',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Switch(
                  value: ingredientState.hideMyFridgeIngredients,
                  onChanged: (_) => ref
                      .read(ingredientControllerProvider.notifier)
                      .toggleFridgeFilter(),
                  activeThumbColor: Colors.orange,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // 재료 그리드
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: ingredientState.filteredIngredients.length,
              itemBuilder: (context, index) {
                final ingredient = ingredientState.filteredIngredients[index];
                return _IngredientCard(
                  name: ingredient.name,
                  imageUrl: ingredient.imageUrl,
                  description: ingredient.description,
                  substitutes: ingredient.substitutes,
                  purchaseUrl: ingredient.purchaseUrl,
                  onPurchaseTap: () async {
                    final uri = Uri.parse(ingredient.purchaseUrl);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(
                        uri,
                        mode: LaunchMode.externalApplication,
                      );
                    } else {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('링크를 열 수 없습니다')),
                        );
                      }
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// 재료 카드 위젯
class _IngredientCard extends StatefulWidget {
  const _IngredientCard({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.substitutes,
    required this.purchaseUrl,
    required this.onPurchaseTap,
  });
  final String name;
  final String imageUrl;
  final String description;
  final List substitutes;
  final String purchaseUrl;
  final VoidCallback onPurchaseTap;

  @override
  State<_IngredientCard> createState() => _IngredientCardState();
}

class _IngredientCardState extends State<_IngredientCard> {
  var _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 이미지
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                color: Colors.grey[200],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.network(
                  widget.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.image_not_supported,
                        color: Colors.grey,
                        size: 40,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          // 정보
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // 재료 이름
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),

                // 대체 재료
                if (widget.substitutes.isNotEmpty)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        color: _isExpanded
                            ? Colors.orange[50]
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        children: [
                          Text(
                            '대체 재료 ',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.orange[700],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(
                            _isExpanded
                                ? Icons.expand_less
                                : Icons.chevron_right,
                            size: 14,
                            color: Colors.orange,
                          ),
                        ],
                      ),
                    ),
                  ),

                // 대체 재료 목록 (펼쳐졌을 때)
                if (_isExpanded && widget.substitutes.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 6, left: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: widget.substitutes.map<Widget>((substitute) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Row(
                            children: [
                              Container(
                                width: 4,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: Colors.orange[400],
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  '${substitute.name} (${substitute.ratio})',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                const SizedBox(height: 4),

                // 설명
                if (!_isExpanded)
                  Text(
                    widget.description,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey[600],
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                const SizedBox(height: 8),

                // 구매하러가기 버튼
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: widget.onPurchaseTap,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.orange[700],
                      side: BorderSide(color: Colors.orange[300]!),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    child: const Text(
                      '구매하러가기',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
