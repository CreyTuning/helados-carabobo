import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mispedidos/objects/producto.dart';

class SeleccionarCantidad extends StatelessWidget {
  const SeleccionarCantidad({
    Key? key,
    required this.producto,
    this.initialValue = 0
  }) : super(key: key);

  final Producto producto;
  final int initialValue;

  @override
  Widget build(BuildContext context) {

    RxString cantidad = '$initialValue'.obs;

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Seleccionar cantidad'),
        ),
    
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
    
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            cantidad.value,
                            style: TextStyle(
                              fontSize: Get.height * 0.1,
                            ),
                          
                            textAlign: TextAlign.center,
                          ),
                        ),

                        Center(
                          child: Text(
                            (producto.paqueteCantidad != null) ? 'Blisters' : 'Unidades',
                            style: TextStyle(
                              fontSize: Get.height * 0.05,
                            ),
                          
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
    
                (producto.paqueteCantidad == null) ? const SizedBox() : Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.2),
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
                  ),
                  child: Text('${int.parse(cantidad.value) * producto.paqueteCantidad!} unidades'),
                ),
    
                SizedBox(
                  height: Get.height * 0.5,
                  child: Keyboard(
                    text: cantidad,
                    done: (){
                      if(cantidad.value != '0'){
                        Get.back(result: int.parse(cantidad.value));
                      }
                    }
                  ),
                )
    
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Keyboard extends StatelessWidget {
  const Keyboard({
    Key? key,
    required this.done,
    required this.text
  }) : super(key: key);

  final Function done;
  final RxString text;


  void onNumberTap(int number){
    
    if(text.value.length >= 4){
      // Do nothing
    }
    
    else if(number == 0 && text.value.length == 1 && text.value[0] == '0'){
      // Do nothing
    }

    else if(number == 0 && text.value.length > 1 && text.value[0] != '0'){
      text.value = '${text.value}0';
    }

    else if(number != 0 && text.value.length == 1 && text.value[0] == '0'){
      text.value = '$number';
    }

    else if(text.value.length < 8){
      text.value = '${text.value}$number';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.2),
          borderRadius: BorderRadius.circular(30)
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  MyBontonDeTeclado(texto: '1', onTap: (){onNumberTap(1);}),
                  MyBontonDeTeclado(texto: '2', onTap: (){onNumberTap(2);}),
                  MyBontonDeTeclado(texto: '3', onTap: (){onNumberTap(3);})
                ],
              ),
            ),
      
            Expanded(
              child: Row(
                children: [
                  MyBontonDeTeclado(texto: '4', onTap: (){onNumberTap(4);}),
                  MyBontonDeTeclado(texto: '5', onTap: (){onNumberTap(5);}),
                  MyBontonDeTeclado(texto: '6', onTap: (){onNumberTap(6);})
                ],
              ),
            ),
      
            Expanded(
              child: Row(
                children: [
                  MyBontonDeTeclado(texto: '7', onTap: (){onNumberTap(7);}),
                  MyBontonDeTeclado(texto: '8', onTap: (){onNumberTap(8);}),
                  MyBontonDeTeclado(texto: '9', onTap: (){onNumberTap(9);})
                ],
              ),
            ),
      
            Expanded(
              child: Row(
                children:  [
                  MyBontonDeTeclado(
                    enabled: (text.value != '0' ? true : false),
                    icon: Icons.arrow_back_rounded,
                    onTap: (){
                    if(text.value.isNotEmpty){
                      text.value = text.value.substring(0, text.value.length - 1);
                    }

                    if(text.value.isEmpty){
                      text.value = '0';
                    }
                  }),

                  MyBontonDeTeclado(texto: '0', onTap: (){onNumberTap(0);}),

                  MyBontonDeTeclado(
                    enabled: (text.value != '0' ? true : false),
                    icon: Icons.done,
                    onTap: (){done();}
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyBontonDeTeclado extends StatelessWidget {
  const MyBontonDeTeclado({
    Key? key,
    this.texto,
    required this.onTap,
    this.icon,
    this.enabled = true
  }) : super(key: key);

  final String? texto;
  final IconData? icon;
  final Function onTap;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: (enabled == true) ? (){onTap();} : null,
        child: SizedBox(
          height: double.infinity,
          child: Center(
            child: Stack(
              children: 
                [
                  (texto == null) ? const SizedBox() : Text(texto as String,
                    style: const TextStyle(
                      fontSize: 25
                    ),
                  ),

                  (icon == null) ? const SizedBox() : Icon(icon as IconData,
                    size: 25,
                    color: (enabled == true) ? Theme.of(context).iconTheme.color : Theme.of(context).iconTheme.color!.withOpacity(0.4),
                  ),
              ]
            ),
          )
        ),
      ),
    );
  }
}