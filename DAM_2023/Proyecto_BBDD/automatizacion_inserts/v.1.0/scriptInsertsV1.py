import random

print("************************************Categoria********************************************")

#Insert categoria
categoria = ["Smartphones","Portatiles","Ordenadores","Perifericos","Monitores","Componentes","Consolas","Videojuegos","Patinetes","Televisiones"]
descripciones = ["Telefonos inteligentes de ultima generacion","Portatiles potentes con el mejor precio del mercado","Los ordenadores mas potentes del mercado","Los ultimos perifericos del mercado","Los monitores con mejor resolucion","Los componentes mas potentes","Ultimas novedades en consolas","Los videojuegos mas divertidos","Los patinetes mas rapidos","Las televisiones mas grandes"]

fkIdCategoria = []

for i in range (0,10):
    idCategoria = random.randint(1000, 9999)
    if idCategoria == fkIdCategoria:
        idCategoria = random.randint(1000, 9999)
        print(f"insert into categoria values{idCategoria, categoria[i], descripciones[i]};")
    else:
        print(f"insert into categoria values{idCategoria, categoria[i], descripciones[i]};")
    fkIdCategoria.append(idCategoria)

print("************************************Producto********************************************")

#Insert producto
nombreprod = "n"
descripcion = "d"
fabricantes = ["LG","Samsung","Philips","Appel","MSI","Razer","Xiaomi"]
stock = ["S","N"]

arrayIdProducto = []

for i in range(0,30):
    idprodcuto = random.randint(1000, 9999)
    precio = random.uniform(0, 9999)
    redondeado = round(precio, 2)
    if idprodcuto == arrayIdProducto:
        print(f"insert into producto values{idprodcuto,nombreprod,redondeado,fabricantes[random.randint(0,6)],stock[random.randint(0,1)],descripcion,fkIdCategoria[random.randint(0,9)]};")
    else:
        idprodcuto = random.randint(1000, 9999)
        print(f"insert into producto values{idprodcuto,nombreprod,redondeado,fabricantes[random.randint(0,6)],stock[random.randint(0,1)],descripcion,fkIdCategoria[random.randint(0,9)]};")

    arrayIdProducto.append(idprodcuto)


print("************************************Agencia paquete********************************************")

#Insert Agencia de Paqueteria

abecedario = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
nombreAgencia = ["Fedex","Correos","DHL","Inpost","UPS","T3C","SEUR","MRV","Amazon","Najesa"]

arrayCIF = []

for i in range (0,10):
    cif = str(random.randint(10000000, 99999999))
    cifrandom = abecedario[random.randint(0,25)] + cif
    if cifrandom == arrayCIF:
        cif = str(random.randint(10000000, 99999999))
        cifrandom = abecedario[random.randint(0,25)] + cif
        print(f"insert into agencia_de_paqueteria values{cifrandom,nombreAgencia[i]};")
    else:
        print(f"insert into agencia_de_paqueteria values{cifrandom,nombreAgencia[i]};")
    arrayCIF.append(cifrandom)
    

print("************************************Pedidos********************************************")

#Insert Pedidos

metodoPago = ["En efectivo","Tarjeta credito/debito","Paypal","Bizum","Contra rembolso","Transferencia bancaria"]
estado = ["Preparacion","Enviado","Entregado"]

arrayPedido = []

for i in range (0,40):
    idPedido = random.randint(1000, 9999)
    anno = str(random.randint(2000, 2023))
    mes = str(random.randint(1, 12))
    dia = str(random.randint(1, 31))
    fecha = anno + "-" + mes + "-" + dia
    if idPedido == arrayPedido:
        idPedido = random.randint(1000, 9999)
        print(f"insert into pedido values{arrayCIF[random.randint(0,9)],idPedido,metodoPago[random.randint(0,5)],fecha,estado[random.randint(0,2)]};")
    else:
        print(f"insert into pedido values{arrayCIF[random.randint(0,9)],idPedido,metodoPago[random.randint(0,5)],fecha,estado[random.randint(0,2)]};")
    arrayPedido.append(idPedido)

print("************************************Clientes********************************************")

#Insert cliente

usuario = "u"
direccion = "d"
correo = ["@gmail.com","@hotmail.com","@outlook.com","@icloud.com"]

arrayCliente = []

for i in range(0,30):
    idCliente = random.randint(1000,9999)
    telefono = random.randint(600000000,999999999)
    correousuario = usuario + correo[random.randint(0,3)]
    if idCliente == arrayCliente:
        idCliente = random.randint(1000,9999)
        print(f"insert into cliente values{idCliente,usuario,correousuario,telefono,direccion};")
    else:
        print(f"insert into cliente values{idCliente,usuario,correousuario,telefono,direccion};")
    arrayCliente.append(idCliente)


print("********************************************************************************")


