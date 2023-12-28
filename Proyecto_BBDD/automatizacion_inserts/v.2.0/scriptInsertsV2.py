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
fabricantes = ["LG", "Samsung", "Philips", "Apple", "MSI", "Razer", "Xiaomi"]
stock = ["S", "N"]

# Array para fk
arrayIdProducto = []

for i in range(0, 40):
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

    # Comparacion para asegurar que el id producto != a la numeracion del array

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
    "TNT Express",
    "USPS United States Postal Service",
    "Royal Mail",
    "Canada Post",
    "Correios Brazil",
    "Japan Post",
    "Australia Post",
    "Singapore Post",
    "Deutsche Post DHL Group",
    "La Poste France",
    "Correo Argentino",
    "Correos de México",
    "India Post",
    "China Post"
    "Korea Post",
    "Russian Post",
    "Swiss Post",
    "Poste Italiane",
    "PostNord",
    "An Post Ireland",
    "PostNL",
    "SingPost Singapore",
    "Pos Malaysia",
    "South African Post Office",
    "Emirates Post",
    "Saudi Post",
    "New Zealand Post",
    "Swedish Post",
    "Norwegian post",
    "Fin post",
    "Denmark postal service",
]

# Array para fk

arrayCIF = []

for i in range(0, 40):
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
array_cif_pedido = []


def evaluar_mes(mes_intro):
    dia_entero = random.randint(1, 31)

    match mes_intro:
        case 1 | 3 | 5 | 7 | 8 | 10 | 12:
            dia_entero = random.randint(1, 31)
        case 4 | 6 | 9 | 11:
            dia_entero = random.randint(1, 30)
        case 2:
            dia_entero = random.randint(1, 28)

    return dia_entero


for i in range(0, 40):
    idPedido = random.randint(1000, 9999)
    cif_pedido = arrayCIF[random.randint(0, 9)]
    anno = str(random.randint(2012, 2023))
    mes = str(random.randint(1, 12))
    dia = evaluar_mes(mes)

    fecha = f"{anno}-{mes}-{dia}"
    if idPedido in arrayPedido:
        idPedido = random.randint(1000, 9999)
        print(
            f"insert into pedido values{cif_pedido, idPedido, metodoPago[random.randint(0, 5)], fecha, estado[random.randint(0, 2)]};"
        )
    else:
        print(
            f"insert into pedido values{cif_pedido, idPedido, metodoPago[random.randint(0, 5)], fecha, estado[random.randint(0, 2)]};"
        )
    arrayPedido.append(idPedido)
    array_cif_pedido.append(cif_pedido)

print(
    "************************************Cliente********************************************"
)

# Insert cliente --> Alex

usuario = "u"
direccion = "d"
correo = ["@gmail.com", "@hotmail.com", "@outlook.com", "@icloud.com"]

arrayCliente = []

for i in range(0, 40):
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
# Error

"""
Los inserts de la tabla compra se componen únicamente de las foreing keys de las tablas producto, cliente y pedido
"""

for i in range(0, 40):
    id_producto_compra = arrayIdProducto
    id_cliente_compra = arrayCliente
    cif_compra = array_cif_pedido[i]
    id_pedido_compra = arrayPedido

    print(f"insert into compra values({id_producto_compra[i]}, {id_cliente_compra[i]}, '{cif_compra}', "
          f"{id_pedido_compra[i]});")

# Tabla empleado --> Alberto

"""
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
"""
