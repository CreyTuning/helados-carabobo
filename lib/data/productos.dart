import 'package:mispedidos/objects/producto.dart';
import 'package:mispedidos/objects/sabor.dart';

class Productos {
  static final List<Producto> categoriaImpulso = [
    tiniton,
    sorbete,
    batiboom,
    barquilla,
    swing,
    zoek,
    sundae,
    chocolate
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
    sirope,
    afiche,
    cucharilla,
    bolsoTermico,
    envaseCuatroLitros,
    descuento
  ];
  
  // NULO -------------------------------------------------

  static final Producto nulo = Producto(
    id: '',
    nombre: '',
    descripcion: '',
  );

  // IMPULSOS -------------------------------------------------
  static final Producto tiniton = Producto(
    id: 'IMP001',
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
    id: 'IMP002',
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
    id: 'IMP003',
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
    id: 'IMP004',
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
    id: 'IMP005',
    nombre: 'Swing',
    descripcion: 'Cremoso helado de mantecado con sirope de chocolate, sirope de fresa y crujiente topping de maní.',
    precioCompra: 0.35,
    precioVenta: 0.46,
    paqueteCantidad: 6,
  );
  
  static final Producto sundae = Producto(
    id: 'IMP006',
    nombre: 'Sundae',
    descripcion: 'Cremoso helado de tinita.',
    precioCompra: 0.32,
    precioVenta: 0.42,
    paqueteCantidad: 6,
    sabores: [
      Sabor(nombre: 'Sundae de Chocolate'),
      Sabor(nombre: 'Sundae de Fresa'),
      Sabor(nombre: 'Sundae de Naranja')
    ]
  );

  static final Producto chocolate = Producto(
    id: 'IMP007',
    nombre: 'Doble Chocolate',
    descripcion: 'Chocolate con sirope de chocolate.',
    precioCompra: 0.32,
    precioVenta: 0.42,
    paqueteCantidad: 6,
  );

  static final Producto zoek = Producto(
    id: 'IMP009',
    nombre: 'Zoek',
    descripcion: '',
    precioCompra: 0.35,
    precioVenta: 0.46,
    paqueteCantidad: 5,
    sabores: [
      Sabor(nombre: 'Clásico'),
      Sabor(nombre: 'Crocante'),
    ]
  );


  // POTES ----------------------------------------------------
  static final Producto medioLitro = Producto(
    id: 'REC001',
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
    id: 'REC002',
    nombre: 'Litro',
    descripcion: 'Cremoso helado de Litro.',
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
        nombre: 'Café',
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
    id: 'REC003',
    nombre: 'Napolitano',
    descripcion: 'Cremoso helado Napolitano en sabor de mantecado con cholate y fresa.',
    precioCompra: 4.4,
    precioVenta: 6
  );

  static final Producto cuatroLitros = Producto(
    id: 'REC004',
    nombre: '4.4 Litros',
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
        nombre: 'Choco Brownie',
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


  // UTENSILIOS ----------------------------------------------------
  static final Producto cucharilla = Producto(
    id: 'UT001',
    nombre: 'Cucharilla',
    descripcion: 'Paletas o cucharillas plásticas para helados, postres, degustaciones u otros.',
    precioCompra: 0.01,
    precioVenta: 0.02
  );

  // GALLETAS ----------------------------------------------------
  static final Producto galletaConoBarquillaTradicional = Producto(
    id: 'GA001',
    nombre: 'Galleta de Barquilla Tradicional',
    descripcion: 'Crujientes galletas de barquillas tradicionales en tamaño estandar para rellenar.',
    precioCompra: 0.1,
    precioVenta: 0.12
  );

  static final Producto galletaConoMiniBarquillon = Producto(
    id: 'GA002',
    nombre: 'Galleta de Mini Barquillón',
    descripcion: 'Crujientes galletas de mini barquillón para rellenar.',
    paqueteCantidad: 45,
    precioCompra: 0.155555556,
    precioVenta: 0.177777778
  );

  static final Producto galletaCestaFlor = Producto(
    id: 'GA003',
    nombre: 'Cesta de Galleta',
    descripcion: 'Crujientes Cesta de Galleta en forma de Flor para rellenar.',
    paqueteCantidad: 32,
    precioCompra: 0.21875,
    precioVenta: 0.25
  );

  // SIROPE ----------------------------------------------------
  static final Producto sirope = Producto(
    id: 'SIR001',
    nombre: 'Sirope',
    descripcion: 'Sirope',
    sabores: [
      Sabor(
        nombre: 'Fresa',
        precioCompra: 2.45,
        precioVenta: 4
      ),

      Sabor(
        nombre: 'Chocolate',
        precioCompra: 2.45,
        precioVenta: 4
      ),

      Sabor(
        nombre: 'Dulce de Leche',
        precioCompra: 6,
        precioVenta: 8
      ),

      Sabor(
        nombre: 'Capita Magica',
        precioCompra: 9,
        precioVenta: 12
      ),
    ]
  );

  static final Producto afiche = Producto(
    id: 'AFI001',
    nombre: 'Afiche Publicitario',
    descripcion: 'Afiche Publicitario',
    precioCompra: 0,
    precioVenta: 0
  );

  static final Producto envaseCuatroLitros = Producto(
    id: 'ENV001',
    nombre: 'Envase 4.4L',
    descripcion: 'Envase 4.4L',
    precioCompra: 3,
    precioVenta: 3
  );

  // BOLSOS ----------------------------------------------------
  static final Producto bolsoTermico = Producto(
    id: 'BOL001',
    nombre: 'Bolso Térmico',
    descripcion: 'Bolso térmico con capacidad para 20 litros de helado.',
    precioCompra: 12,
    precioVenta: 15
  );

  // DESCUENTO --------------------------------------------------
  static final Producto descuento = Producto(
    id: 'DES001',
    nombre: 'Descuento',
    descripcion: 'Descuento',
    precioCompra: 0,
    precioVenta: -0.01
  );
}
