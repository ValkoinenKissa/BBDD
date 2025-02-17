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
    if idCategoria in fkIdCategoria:
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

for i in range(0, 80):
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

    while True:
        idprodcuto = random.randint(1000, 9999)
        if idprodcuto not in arrayIdProducto:
            break

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

    while True:
        cif = str(random.randint(10000000, 99999999))
        cifrandom = abecedario_max[random.randint(0, 25)] + cif
        if cif not in arrayCIF:
            break

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


# Metódo para validación de fechas (Alberto)

def es_bisiesto(anio):
    return (anio % 4 == 0 and anio % 100 != 0) or (anio % 400 == 0)


def evaluar_mes(mes_intro, anio):
    check_bisiesto = es_bisiesto(anio)
    dia_entero = random.randint(1, 31)

    match mes_intro:
        case 1 | 3 | 5 | 7 | 8 | 10 | 12:
            dia_entero = random.randint(1, 31)
        case 4 | 6 | 9 | 11:
            dia_entero = random.randint(1, 30)
        case 2:
            dias_febrero = 29 if check_bisiesto else 28
            dia_entero = random.randint(1, dias_febrero)

    return dia_entero


for i in range(0, 80):
    cif_pedido = arrayCIF[random.randint(0, 9)]
    anno = (random.randint(2012, 2023))
    mes = (random.randint(1, 12))
    dia = evaluar_mes(mes, anno)
    while True:
        idPedido = random.randint(1000, 9999)
        if idPedido not in arrayPedido:
            break
    fecha = f"{anno}-{mes}-{dia}"

    print(
        f"insert into pedido values{cif_pedido, idPedido, metodoPago[random.randint(0, 5)], fecha, estado[random.randint(0, 2)]};"
    )
    arrayPedido.append(idPedido)
    array_cif_pedido.append(cif_pedido)

print(
    "************************************Cliente********************************************"
)

# Insert cliente --> Alex, mejorado por Alberto


usuario = "u"
direccion = "d"
correo = ["@gmail.com", "@hotmail.com", "@outlook.com", "@icloud.com"]

arrayCliente = []

for i in range(0, 80):
    while True:
        idCliente = random.randint(1000, 9999)
        if idCliente not in arrayCliente:
            break

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

    print(
        f"insert into cliente values({idCliente}, '{usuariorandom}', '{correousuario}', {telefono}, '{direccion}');"
    )

    arrayCliente.append(idCliente)

print(
    "*****************************************Compra**********************************"
)

# Insert compra --> Alberto

for i in range(0, 80):
    id_producto_compra = arrayIdProducto
    id_cliente_compra = arrayCliente
    cif_compra = array_cif_pedido[i]
    id_pedido_compra = arrayPedido

    print(f"insert into compra values({id_producto_compra[i]}, {id_cliente_compra[i]}, '{cif_compra}', "
          f"{id_pedido_compra[i]});")

# Tabla empleado --> Alberto


print(
    "***************************************Empleado**********************************"
)
nombre_emp = "nom"
array_id_empleado = []

nombres = [
    "Ana", "Juan", "María", "Carlos", "Laura", "Pedro", "Lucía", "Diego", "Sofía", "Alejandro",
    "Valentina", "Miguel", "Paula", "José", "Carmen", "Manuel", "Isabel", "Javier", "Elena", "Andrés",
    "Adriana", "Raúl", "Victoria", "Fernando", "Luisa", "Gabriel", "Natalia", "Ricardo", "Clara", "Emilio",
    "Rosa", "Francisco", "Esther", "Martín", "Alicia", "Héctor", "Lorena", "Gonzalo", "Olivia", "Pablo",
    "Daniela", "Roberto", "Angela", "Simón", "Marina", "Alberto", "Inés", "Emilia", "Renata", "Alex"
]

apellidos = [
    "García", "González", "López", "Rodríguez", "Martínez", "Pérez", "Sánchez", "Ramírez", "Romero", "Sosa",
    "Álvarez", "Torres", "Fernández", "Ruiz", "Díaz", "Vázquez", "Rojas", "Morales", "Suárez", "Ortiz",
    "Castro", "Flores", "Núñez", "Herrera", "Jiménez", "Silva", "Medina", "Vargas", "Aguirre", "Mendoza",
    "Castillo", "Giménez", "Luna", "Chávez", "Martiñón", "Maldonado", "Pacheco", "Zamora", "Soto", "Peña",
    "Ibarra", "Cabrera", "Campos", "Domínguez", "Guerrero", "Cruz", "Orozco", "Vega", "Ramos", "Navarro",
    "Guerrero", "Valenzuela", "Salazar", "Hernández", "Moreno", "Ríos", "Andrade", "Molina", "Aguilar", "Delgado",
    "Salinas", "Miranda", "Montes", "Escobar", "Gómez", "Ponce", "Cortés", "Chacón", "Santos", "Valencia",
    "Ochoa", "Rosales", "Estrada", "Juárez", "Cisneros", "Bautista", "Castañeda", "Guerra", "Serrano", "Lara",
    "Mercado", "Rangel", "Fuentes", "Terán", "Aranda", "Serrano", "Landa", "Zavala", "León", "Olvera",
    "Figueroa", "Beltrán", "Escamilla", "Montoya", "Corona", "Barajas", "Téllez", "Zúñiga", "Aguilera", "Mulero"
]

for i in range(0, 20):
    anno = (random.randint(2010, 2023))
    mes = (random.randint(1, 12))
    dia = evaluar_mes(mes, anno)
    fecha_incorporacion = f"{anno}-{mes}-{dia}"
    salario = random.randint(1050, 4500)
    while True:
        id_empleado = random.randint(1000, 9999)
        if id_empleado not in array_id_empleado:
            break

    nombrerand = random.choice(nombres)
    apellidorand = random.choice(apellidos)
    nombre_empleado = str(nombrerand + " " + apellidorand)

    print(f"insert into empleado values {id_empleado, salario, nombre_empleado, fecha_incorporacion};")

    array_id_empleado.append(id_empleado)

# Tabla supervisa --> Alberto

print(
    "*****************************************supervisa**********************************"
)

for i in range(0, 5):
    id_empleado_supervisa = array_id_empleado[i]

    while True:
        id_empleado_supervisado = random.choice(array_id_empleado)
        if id_empleado_supervisado not in [id_empleado_supervisa]:
            break

    print(f"insert into supervisa values {id_empleado_supervisa, id_empleado_supervisado};")

print(
    "****************************************gestion**********************************"
)

# Tabla gestion --> Alberto
for i in range(0, 60):
    id_empleado_gestion = random.choice(array_id_empleado)
    cif_gestion = array_cif_pedido[i]
    id_pedido_gestion = arrayPedido[i]

    print(f"insert into gestion values {id_empleado_gestion, cif_gestion, id_pedido_gestion};")