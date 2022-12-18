enum DiscountType { VALUE, PERCENT }

String getDiscountTypeString(
  DiscountType discountType,
) {
  return discountType.toString().split('.').last;
}
