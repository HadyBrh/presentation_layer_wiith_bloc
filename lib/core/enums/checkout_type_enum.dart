enum CheckOutType{
  INVOICE,
  TRANSFER_NOTE
}

String getCheckOutTypeString(CheckOutType checkOutType){
  return checkOutType.toString().split('.').last;
}