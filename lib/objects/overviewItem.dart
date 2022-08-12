class OverviewItem {

  OverviewItem({
    required this.producto,
    required this.sabor,
    required this.cantidad,
    required this.blister,
  });

  String producto = '';
  String sabor = '';
  int cantidad = 0;
  bool blister = false;

  @override
  String toString() {
    return '$producto\t$sabor\t$cantidad\t${(blister == true) ? 'blister' : 'unidades'}';
  }
}