enum PaymentTypeEnum {
  dinheiro('Dinheiro'),
  pix('Pix'),
  debito('Deb'),
  credito('Crédito'),
  ted('Ted');

  final String paymentTypeName;

  const PaymentTypeEnum(this.paymentTypeName);
}
