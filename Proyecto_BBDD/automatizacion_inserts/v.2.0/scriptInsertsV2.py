import random

abecedario_max = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z",
]
abecedario_min = [
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m",
    "n",
    "o",
    "p",
    "q",
    "r",
    "s",
    "t",
    "u",
    "v",
    "w",
    "x",
    "y",
    "z",
]
abecedario_numerico = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

print(
    "************************************Categoria********************************************"
)

# Insert categoria
categoria = [
    "Smartphones",
    "Portatiles",
    "Ordenadores",
    "Perifericos",
    "Monitores",
    "Componentes",
    "Consolas",
    "Videojuegos",
    "Patinetes",
    "Televisiones",
]
descripciones = [
    "Telefonos inteligentes de ultima generacion",
    "Portatiles potentes con el mejor precio del mercado",
    "Los ordenadores mas potentes del mercado",
    "Los ultimos perifericos del mercado",
    "Los monitores con mejor resolucion",
    "Los componentes mas potentes",
    "Ultimas novedades en consolas",
    "Los videojuegos mas divertidos",
    "Los patinetes mas rapidos",
    "Las televisiones mas grandes",
]

fkIdCategoria = []

for i in range(0, 10):
    idCategoria = random.randint(1000, 9999)
    if idCategoria == fkIdCategoria:
        idCategoria = random.randint(1000, 9999)
        print(
            f"insert into categoria values{idCategoria, categoria[i], descripciones[i]};"
        )
    else:
        print(
            f"insert into categoria values{idCategoria, categoria[i], descripciones[i]};"
        )
    fkIdCategoria.append(idCategoria)

print(
    "************************************Producto********************************************"
)

# Insert producto --> Alex
nombreprod = "n"
descripcion = "d"
fabricantes = ["LG", "Samsung", "Philips", "Appel", "MSI", "Razer", "Xiaomi"]
stock = ["S", "N"]

# Array para fk
arrayIdProducto = []

for i in range(0, 30):
    idprodcuto = random.randint(1000, 9999)
    precio = random.uniform(0, 9999)
    redondeado = round(precio, 2)
    fabricantess = fabricantes[random.randint(0, 6)]
    prodlength = random.randint(0, 2)

    if prodlength == 0:
        usuariorandom = (
                fabricantess
                + "-"
                + abecedario_max[random.randint(0, 25)]
                + abecedario_min[random.randint(0, 25)]
                + abecedario_min[random.randint(0, 25)]
                + abecedario_min[random.randint(0, 25)]
                + abecedario_min[random.randint(0, 25)]
                + abecedario_min[random.randint(0, 25)]
                + abecedario_min[random.randint(0, 25)]
                + abecedario_numerico[random.randint(0, 8)]
                + abecedario_numerico[random.randint(0, 8)]
        )
    elif prodlength == 1:
        usuariorandom = (
                fabricantess
                + "-"
                + abecedario_max[random.randint(0, 25)]
                + abecedario_min[random.randint(0, 25)]
                + abecedario_min[random.randint(0, 25)]
                + abecedario_min[random.randint(0, 25)]
                + abecedario_min[random.randint(0, 25)]
                + abecedario_numerico[random.randint(0, 8)]
                + abecedario_numerico[random.randint(0, 8)]
                + abecedario_numerico[random.randint(0, 8)]
        )
    else:
        usuariorandom = (
                fabricantess
                + "-"
                + abecedario_max[random.randint(0, 25)]
                + abecedario_max[random.randint(0, 25)]
                + abecedario_min[random.randint(0, 25)]
                + abecedario_min[random.randint(0, 25)]
                + abecedario_min[random.randint(0, 25)]
                + abecedario_min[random.randint(0, 25)]
                + abecedario_min[random.randint(0, 25)]
                + abecedario_min[random.randint(0, 25)]
                + abecedario_numerico[random.randint(0, 8)]
                + abecedario_numerico[random.randint(0, 8)]
                + abecedario_numerico[random.randint(0, 8)]
        )

    # Comparacion para asegurar que el id producto != a la numercion del array

    if idprodcuto == arrayIdProducto:
        print(
            f"insert into producto values{idprodcuto, usuariorandom, redondeado, fabricantess, stock[random.randint(0, 1)], descripcion, fkIdCategoria[random.randint(0, 9)]};"
        )
    else:
        idprodcuto = random.randint(1000, 9999)
        print(
            f"insert into producto values{idprodcuto, usuariorandom, redondeado, fabricantess, stock[random.randint(0, 1)], descripcion, fkIdCategoria[random.randint(0, 9)]};"
        )

    arrayIdProducto.append(idprodcuto)

print(
    "************************************Agencia paquete********************************************"
)

# Insert Agencia de Paqueteria --> Alex

nombreAgencia = [
    "Fedex",
    "Correos",
    "DHL",
    "Inpost",
    "UPS",
    "T3C",
    "SEUR",
    "MRV",
    "Amazon",
    "Najesa",
]

# Array para fk

arrayCIF = []

for i in range(0, 10):
    cif = str(random.randint(10000000, 99999999))
    cifrandom = abecedario_max[random.randint(0, 25)] + cif
    if cifrandom == arrayCIF:
        cif = str(random.randint(10000000, 99999999))
        cifrandom = abecedario_max[random.randint(0, 25)] + cif
        print(f"insert into agencia_de_paqueteria values{cifrandom, nombreAgencia[i]};")
    else:
        print(f"insert into agencia_de_paqueteria values{cifrandom, nombreAgencia[i]};")
    arrayCIF.append(cifrandom)

print(
    "************************************Pedidos********************************************"
)

# Insert Pedidos --> Alex

metodoPago = [
    "En efectivo",
    "Tarjeta credito/debito",
    "Paypal",
    "Bizum",
    "Contra rembolso",
    "Transferencia bancaria",
]
estado = ["Preparacion", "Enviado", "Entregado"]

# Array para fk

arrayPedido = []

for i in range(0, 40):
    idPedido = random.randint(1000, 9999)
    anno = str(random.randint(2000, 2023))
    mes = str(random.randint(1, 12))
    dia = str(random.randint(1, 31))
    fecha = anno + "-" + mes + "-" + dia
    if idPedido == arrayPedido:
        idPedido = random.randint(1000, 9999)
        print(
            f"insert into pedido values{arrayCIF[random.randint(0, 9)], idPedido, metodoPago[random.randint(0, 5)], fecha, estado[random.randint(0, 2)]};"
        )
    else:
        print(
            f"insert into pedido values{arrayCIF[random.randint(0, 9)], idPedido, metodoPago[random.randint(0, 5)], fecha, estado[random.randint(0, 2)]};"
        )
    arrayPedido.append(idPedido)

print(
    "************************************Cliente********************************************"
)

# Insert cliente --> Alex

usuario = "u"
direccion = "d"
correo = ["@gmail.com", "@hotmail.com", "@outlook.com", "@icloud.com"]

arrayCliente = []

for i in range(0, 30):
    idCliente = random.randint(1000, 9999)
    telefono = random.randint(600000000, 999999999)
    usuariolength = random.randint(0, 2)

    if usuariolength == 0:
        usuariorandom = (
                abecedario_max[random.randint(0, 25)]
                + abecedario_min[random.randint(0, 25)]
                + abecedario_min[random.randint(0, 25)]
                + abecedario_min[random.randint(0, 25)]
                + abecedario_min[random.randint(0, 25)]
                + abecedario_min[random.randint(0, 25)]
                + abecedario_min[random.randint(0, 25)]
                + abecedario_numerico[random.randint(0, 8)]
                + abecedario_numerico[random.randint(0, 8)]
        )
    elif usuariolength == 1:
        usuariorandom = (
                abecedario_max[random.randint(0, 25)]
                + abecedario_min[random.randint(0, 25)]
                + abecedario_min[random.randint(0, 25)]
                + abecedario_min[random.randint(0, 25)]
                + abecedario_min[random.randint(0, 25)]
                + abecedario_numerico[random.randint(0, 8)]
                + abecedario_numerico[random.randint(0, 8)]
                + abecedario_numerico[random.randint(0, 8)]
        )
    else:
        usuariorandom = (
                abecedario_max[random.randint(0, 25)]
                + abecedario_max[random.randint(0, 25)]
                + abecedario_min[random.randint(0, 25)]
                + abecedario_min[random.randint(0, 25)]
                + abecedario_min[random.randint(0, 25)]
                + abecedario_min[random.randint(0, 25)]
                + abecedario_min[random.randint(0, 25)]
                + abecedario_min[random.randint(0, 25)]
                + abecedario_numerico[random.randint(0, 8)]
                + abecedario_numerico[random.randint(0, 8)]
                + abecedario_numerico[random.randint(0, 8)]
        )
    correousuario = usuariorandom + correo[random.randint(0, 3)]
    if idCliente == arrayCliente:
        idCliente = random.randint(1000, 9999)
        print(
            f"insert into cliente values{idCliente, usuariorandom, correousuario, telefono, direccion};"
        )
    else:
        print(
            f"insert into cliente values{idCliente, usuariorandom, correousuario, telefono, direccion};"
        )
    arrayCliente.append(idCliente)

print(
    "*****************************************Compra**********************************"
)

# Insert compra --> Alberto

"""
Los inserts de a tabla compra se componen unicamente de las foreing keys de las tablas, producto, cliente
y pedido
"""
array_id_producto_compra = []
array_id_cliente_compra = []
array_cif_compra = []
array_id_pedido_compra = []

for i in range(0, 50):
    id_producto_compra = random.randint(1000, 9999)
    id_cliente_compra = random.randint(1000, 9999)
    cif_compra = arrayCIF[random.randint(0, 9)]
    id_pedido_compra = random.randint(1000, 9999)

    if (id_producto_compra == arrayIdProducto or id_cliente_compra == arrayCliente or arrayCIF == cif_compra or
            id_pedido_compra == arrayPedido):
        id_producto_compra = random.randint(1000, 9999)
        print(f"insert into compra values{id_pedido_compra, id_cliente_compra,cif_compra, id_pedido_compra};")

    else:
        print(f"insert into compra values{id_pedido_compra, id_cliente_compra,cif_compra, id_pedido_compra};")
    array_id_producto_compra.append(id_producto_compra)
    array_id_cliente_compra.append(id_cliente_compra)
    array_cif_compra.append(cif_compra)
    array_id_pedido_compra.append(id_pedido_compra)


# Tabla empleado --> Alberto

print(
    "***************************************Empleado**********************************"
)
nombre_emp = "nom"
array_id_empleado = []

for i in range(0, 20):
    anno = str(random.randint(2000, 2023))
    mes = str(random.randint(1, 12))
    dia = str(random.randint(1, 31))
    fecha_incorporacion = anno + "-" + mes + "-" + dia
    salario = random.randint(1050, 4500)
    id_empleado = random.randint(1000, 9999)

    print(f"insert into empleado values {id_empleado, salario, nombre_emp, fecha_incorporacion};")

    array_id_empleado.append(id_empleado)

# Tabla supervisa --> Alberto

print(
    "*****************************************supervisa**********************************"
)
array_id_empleado_supervisa = []
array_id_empleado_supervisado = []
for i in range(0, 5):
    id_empleado_supervisa = random.randint(1111, 9999)
    id_empleado_supervisado = random.randint(1111, 9999)

    if id_empleado_supervisa == array_id_empleado or id_empleado_supervisado == array_id_empleado:
        id_empleado_supervisa = random.randint(1111, 9999)
        id_empleado_supervisado = random.randint(1111, 9999)
        print(f"insert into supervisa values ({id_empleado_supervisa}, {id_empleado_supervisado};)")
    else:
        print(f"insert into supervisa values ({id_empleado_supervisa}, {id_empleado_supervisado};)")
    array_id_empleado_supervisa.append(id_empleado_supervisa)
    array_id_empleado_supervisado.append(id_empleado_supervisado)

print(
    "****************************************gestion**********************************"
)


# Tabla gestion --> Alberto
array_id_empleado_gestiona = []
array_cif_gestion = []
array_id_pedido = []
for i in range(0, 20):
    id_empleado_gestiona = random.randint(1000, 9999)
    cif_gestion = arrayCIF[random.randint(0, 9)]
    id_pedido = random.randint(3500, 9000)

    if id_empleado_gestiona == array_id_empleado or cif_gestion == arrayCIF or array_id_pedido == arrayPedido:
        print(f"insert into gestion values {id_empleado_gestiona, cif_gestion, id_pedido};")

    else:
        print(f"insert into gestion values {id_empleado_gestiona, cif_gestion, id_pedido};")

    array_id_empleado_gestiona.append(id_empleado_gestiona)
    array_cif_gestion.append(cif_gestion)
    array_id_pedido.append(id_pedido)
