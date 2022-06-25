import 'package:mispedidos/objects/producto.dart';
import 'package:mispedidos/objects/sabor.dart';

class Productos {
  static final List<Producto> categoriaImpulso = [
    tiniton,
    sorbete,
    batiboom,
    barquilla,
    swing,
    sundae
  ];

  static final List<Producto> categoriaPotes = [
    medioLitro,
    litro,
    napolitano,
    cuatroLitros
  ];

  static final List<Producto> categoriaGalletas = [
    galletaConoBarquillaTradicional,
    galletaConoMiniBarquillon,
    galletaCestaFlor,
  ];

  static final List<Producto> categoriaOtros = [
    cucharilla,
    bolsoTermico
  ];
  
  // NULO -------------------------------------------------

  static final Producto nulo = Producto(
    id: -1,
    nombre: '',
    descripcion: '',
  );

  // IMPULSOS -------------------------------------------------
  static final Producto tiniton = Producto(
    id: 1,
    nombre: 'Tinitón',
    descripcion: 'Cremoso helado de tinita.',
    precioCompra: 0.29,
    precioVenta: 0.38,
    paqueteCantidad: 6,
    sabores: [
      Sabor(nombre: 'Mantecado y Chocolate'),
      Sabor(nombre:'Mantecado y Fresa'),      
      Sabor(nombre:'Mantecado y Naranja'),      
      Sabor(nombre:'Chocolate y Fresa'),    ]
  );

  static final Producto sorbete = Producto(
    id: 2,
    nombre: 'Sorbete',
    descripcion: 'Refrescante helado de sorbete.',
    precioCompra: 0.29,
    precioVenta: 0.38,
    paqueteCantidad: 6,
    sabores: [
      Sabor(nombre: 'Mango'),
      Sabor(nombre: 'Parchita'),
      Sabor(nombre: 'Guanábana'),
      Sabor(nombre: 'Tamarindo')
    ]
  );

  static final Producto batiboom = Producto(
    id: 3,
    nombre: 'Batiboom',
    descripcion: 'Divertido helado de cono.',
    precioCompra: 0.29,
    precioVenta: 0.38,
    paqueteCantidad: 8,
    sabores: [
      Sabor(nombre: 'Uva'),
      Sabor(nombre: 'Uva y fresa'),
      Sabor(nombre: 'Uva y Mantecado'),
    ]
  );

  static final Producto barquilla = Producto(
    id: 4,
    nombre: 'Barquilla Clásica',
    descripcion: 'Cremosa barquilla de helado en cono de galleta dulce con cobertura interna de chocolate.',
    precioCompra: 0.35,
    precioVenta: 0.46,
    paqueteCantidad: 5,
    sabores: [
      Sabor(nombre: 'Mantecado'),
      Sabor(nombre: 'Fresa'),
      Sabor(nombre: 'Chocolate')
    ]
  );

  static final Producto swing = Producto(
    id: 5,
    nombre: 'Swing',
    descripcion: 'Cremoso helado de mantecado con sirope de chocolate, sirope de fresa y crujiente topping de maní.',
    precioCompra: 0.35,
    precioVenta: 0.46,
    paqueteCantidad: 6,
  );
  
  static final Producto sundae = Producto(
    id: 6,
    nombre: 'Sundae',
    descripcion: 'Cremoso helado de tinita.',
    precioCompra: 0.32,
    precioVenta: 0.42,
    paqueteCantidad: 6,
    sabores: [
      Sabor(nombre: 'Mantecado con Sirope de Chocolate'),
      Sabor(nombre: 'Mantecado con Sirope de Fresa'),
      Sabor(nombre: 'Mantecado con Sirope de Naranja')
    ]
  );


  // POTES ----------------------------------------------------
  static final Producto medioLitro = Producto(
    id: 7,
    nombre: 'Medio Litro',
    descripcion: 'Cremoso helado de Medio Litro.',
    sabores: [
      // Clásicos
      Sabor(
        categoria: 'Clasico',
        nombre: 'Mantecado',
        precioCompra: 1.2,
        precioVenta: 1.5
      ),

      Sabor(
        categoria: 'Clasico',
        nombre: 'Fresa',
        precioCompra: 1.2,
        precioVenta: 1.5
      ),

      Sabor(
        categoria: 'Clasico',
        nombre: 'Mantecado y Chocolate',
        precioCompra: 1.2,
        precioVenta: 1.5
      ),

      Sabor(
        categoria: 'Clasico',
        nombre: 'Mantecado y Fresa',
        precioCompra: 1.2,
        precioVenta: 1.5
      ),

      Sabor(
        categoria: 'Clasico',
        nombre: 'Mantecado y Naranja',
        precioCompra: 1.2,
        precioVenta: 1.5
      ),

      Sabor(
        categoria: 'Clasico',
        nombre: 'Chocolate y Fresa',
        precioCompra: 1.2,
        precioVenta: 1.5
      ),

      // Premium --------------------
      Sabor(
        categoria: 'Premium',
        nombre: 'Chocolate',
        precioCompra: 1.4,
        precioVenta: 1.8
      ),

      Sabor(
        categoria: 'Premium',
        nombre: 'Galleta de Chocolate',
        precioCompra: 1.4,
        precioVenta: 1.8
      ),

      Sabor(
        categoria: 'Premium',
        nombre: 'Brownie',
        precioCompra: 1.4,
        precioVenta: 1.8
      ),

      Sabor(
        categoria: 'Premium',
        nombre: 'Torta Suiza',
        precioCompra: 1.4,
        precioVenta: 1.8
      ),

      Sabor(
        categoria: 'Premium',
        nombre: 'Ron con Pasas',
        precioCompra: 1.4,
        precioVenta: 1.8
      ),

      Sabor(
        categoria: 'Premium',
        nombre: 'Café',
        precioCompra: 1.4,
        precioVenta: 1.8
      ),

      Sabor(
        categoria: 'Premium',
        nombre: 'Dulce de Leche',
        precioCompra: 1.4,
        precioVenta: 1.8
      ),

      Sabor(
        categoria: 'Premium',
        nombre: 'Stracciatella',
        precioCompra: 1.4,
        precioVenta: 1.8
      ),
    ]
  );

  static final Producto litro = Producto(
    id: 8,
    nombre: 'Helado de 1 Litro',
    descripcion: 'Cremoso helado de Medio Litro.',
    sabores: [
      // Clásicos
      Sabor(
        categoria: 'Clasico',
        nombre: 'Mantecado',
        precioCompra: 2.0,
        precioVenta: 2.5
      ),

      Sabor(
        categoria: 'Clasico',
        nombre: 'Fresa',
        precioCompra: 2.0,
        precioVenta: 2.5
      ),

      Sabor(
        categoria: 'Clasico',
        nombre: 'Mantecado y Chocolate',
        precioCompra: 2.0,
        precioVenta: 2.5
      ),

      Sabor(
        categoria: 'Clasico',
        nombre: 'Mantecado y Fresa',
        precioCompra: 2.0,
        precioVenta: 2.5
      ),

      Sabor(
        categoria: 'Clasico',
        nombre: 'Mantecado y Naranja',
        precioCompra: 2.0,
        precioVenta: 2.5
      ),

      Sabor(
        categoria: 'Clasico',
        nombre: 'Chocolate y Fresa',
        precioCompra: 2.0,
        precioVenta: 2.5
      ),

      // Premium --------------------
      Sabor(
        categoria: 'Premium',
        nombre: 'Chocolate',
        precioCompra: 2.3,
        precioVenta: 2.9
      ),

      Sabor(
        categoria: 'Premium',
        nombre: 'Galleta de Chocolate',
        precioCompra: 2.3,
        precioVenta: 2.9
      ),

      Sabor(
        categoria: 'Premium',
        nombre: 'Brownie',
        precioCompra: 2.3,
        precioVenta: 2.9
      ),

      Sabor(
        categoria: 'Premium',
        nombre: 'Coco',
        precioCompra: 2.3,
        precioVenta: 2.9
      ),

      Sabor(
        categoria: 'Premium',
        nombre: 'Torta Suiza',
        precioCompra: 2.3,
        precioVenta: 2.9
      ),

      Sabor(
        categoria: 'Premium',
        nombre: 'Ron con Pasas',
        precioCompra: 2.3,
        precioVenta: 2.9
      ),

      Sabor(
        categoria: 'Premium',
        nombre: 'Sundae de Fresa',
        precioCompra: 2.3,
        precioVenta: 2.9
      ),

      Sabor(
        categoria: 'Premium',
        nombre: 'Fresa con Sirope de Fresa',
        precioCompra: 2.3,
        precioVenta: 2.9
      ),

      Sabor(
        categoria: 'Premium',
        nombre: 'Sundae de Chocolate',
        precioCompra: 2.3,
        precioVenta: 2.9
      ),
    ]
  );

  static final Producto napolitano = Producto(
    id: 9,
    nombre: 'Napolitano',
    descripcion: 'Cremoso helado Napolitano en sabor de mantecado con cholate y fresa.',
    precioCompra: 4.4,
    precioVenta: 5.5
  );

  static final Producto cuatroLitros = Producto(
    id: 10,
    nombre: 'Helado de 4.4 Litros',
    descripcion: 'Cremoso helado.',
    sabores: [
      // Clásicos
      Sabor(
        categoria: 'Clasico',
        nombre: 'Mantecado',
        precioCompra: 7.5,
        precioVenta: 9.0
      ),

      Sabor(
        categoria: 'Clasico',
        nombre: 'Fresa',
        precioCompra: 7.5,
        precioVenta: 9.0
      ),

      Sabor(
        categoria: 'Clasico',
        nombre: 'Naranja',
        precioCompra: 7.5,
        precioVenta: 9.0
      ),

      Sabor(
        categoria: 'Clasico',
        nombre: 'Uva',
        precioCompra: 7.5,
        precioVenta: 9.0
      ),

      Sabor(
        categoria: 'Clasico',
        nombre: 'Frambuesa',
        precioCompra: 7.5,
        precioVenta: 9.0
      ),

      Sabor(
        categoria: 'Clasico',
        nombre: 'Chicle',
        precioCompra: 7.5,
        precioVenta: 9.0
      ),

      Sabor(
        categoria: 'Clasico',
        nombre: 'Limón',
        precioCompra: 7.5,
        precioVenta: 9.0
      ),

      // Premium ----------------
      Sabor(
        categoria: 'Premium',
        nombre: 'Chocolate',
        precioCompra: 8.2,
        precioVenta: 10.0
      ),

      Sabor(
        categoria: 'Premium',
        nombre: 'Coco',
        precioCompra: 8.2,
        precioVenta: 10.0
      ),

      Sabor(
        categoria: 'Premium',
        nombre: 'Café',
        precioCompra: 8.2,
        precioVenta: 10.0
      ),

      Sabor(
        categoria: 'Premium',
        nombre: 'Torta Suiza',
        precioCompra: 8.2,
        precioVenta: 10.0
      ),

      Sabor(
        categoria: 'Premium',
        nombre: 'Ron con Frutas',
        precioCompra: 8.2,
        precioVenta: 10.0
      ),

      Sabor(
        categoria: 'Premium',
        nombre: 'Sundae de Fresa',
        precioCompra: 8.2,
        precioVenta: 10.0
      ),

      Sabor(
        categoria: 'Premium',
        nombre: 'Sundae de Chocolate',
        precioCompra: 8.2,
        precioVenta: 10.0
      ),

      Sabor(
        categoria: 'Premium',
        nombre: 'Fresa con Sirope de Fresa',
        precioCompra: 8.2,
        precioVenta: 10.0
      ),

      Sabor(
        categoria: 'Premium',
        nombre: 'Tornado',
        precioCompra: 8.2,
        precioVenta: 10.0
      ),

      // Extra ----------------
      Sabor(
        categoria: 'Extra',
        nombre: 'Mantechip',
        precioCompra: 8.8,
        precioVenta: 10.5
      ),

      Sabor(
        categoria: 'Extra',
        nombre: 'Chocochip',
        precioCompra: 8.8,
        precioVenta: 10.5
      ),

      Sabor(
        categoria: 'Extra',
        nombre: 'Chocomani',
        precioCompra: 8.8,
        precioVenta: 10.5
      ),

      Sabor(
        categoria: 'Extra',
        nombre: 'Galleta de Chocolate',
        precioCompra: 8.8,
        precioVenta: 10.5
      ),

      Sabor(
        categoria: 'Extra',
        nombre: 'Dulce de Leche',
        precioCompra: 8.8,
        precioVenta: 10.5
      ),

      Sabor(
        categoria: 'Extra',
        nombre: 'Maní',
        precioCompra: 8.8,
        precioVenta: 10.5
      ),

      // Super ----------------
      Sabor(
        categoria: 'Super',
        nombre: 'Stracciatella',
        precioCompra: 9.7,
        precioVenta: 11.5
      ),

      Sabor(
        categoria: 'Super',
        nombre: 'Brownie',
        precioCompra: 9.7,
        precioVenta: 11.5
      ),

      Sabor(
        categoria: 'Super',
        nombre: 'Ron con Pasas',
        precioCompra: 9.7,
        precioVenta: 11.5
      ),
    ]
  );


  // OTROS ----------------------------------------------------
  static final Producto cucharilla = Producto(
    id: 11,
    nombre: 'Cucharilla',
    descripcion: 'Paletas o cucharillas plásticas para helados, postres, degustaciones u otros.',
    precioCompra: 0.01,
    precioVenta: 0.02
  );

  static final Producto galletaConoBarquillaTradicional = Producto(
    id: 12,
    nombre: 'Galleta de Barquilla Tradicional',
    descripcion: 'Crujientes galletas de barquillas tradicionales en tamaño estandar para rellenar.',
    paqueteCantidad: 50,
    precioCompra: 0.1,
    precioVenta: 0.12
  );

  static final Producto galletaConoMiniBarquillon = Producto(
    id: 13,
    nombre: 'Galleta de Mini Barquillón',
    descripcion: 'Crujientes galletas de mini barquillón para rellenar.',
    paqueteCantidad: 45,
    precioCompra: 0.155555556,
    precioVenta: 0.177777778
  );

  static final Producto galletaCestaFlor = Producto(
    id: 14,
    nombre: 'Cesta de Galleta',
    descripcion: 'Crujientes Cesta de Galleta en forma de Flor para rellenar.',
    paqueteCantidad: 32,
    precioCompra: 0.21875,
    precioVenta: 0.25
  );

  static final Producto bolsoTermico = Producto(
    id: 15,
    nombre: 'Bolso Térmico',
    descripcion: 'Bolso térmico con capacidad para 20 litros de helado.',
    precioCompra: 12,
    precioVenta: 15
  );
}
