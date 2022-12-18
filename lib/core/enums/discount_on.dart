enum DiscountOn {
  INVOICE,
  PRODUCT
}

String getDiscountOnString(
    DiscountOn discountOn,
    ) {
  return discountOn.toString().split('.').last;
}
