---
title: "Introducción a Swift"
date: 2019-10-20T21:45:28-05:00
draft: true
---

## Introducción a Swift
### Variables
La declaración de una variable, puede ser de dos formas:
```swift
var number: Int
var secondNumber = 8 //  Inferencia de tipos
```

### Constantes
La declaración de una contante, una vez que la variable se declare con let, su valor ya no puede cambiar:
```swift
let number = 8
```
> Una recomendación es siempre utilizar let. Existirán casos donde no se pueda utilizar, pero siempre es mejor utilizar let.

### Tipos de datos
Si no se le indica el tipo de dato a la variable, el compilador lo tomará de acuerdo a su valor.

#### Entero
El valor por defecto que tiene un entero es de 64 bits.
```swift
var number: Int = 10
let number: Int
let number: Int8 = 120 //Se puede indicar el valor máximo que usará
```
> Se debe tener cuidado cuando se indique el valor máximo que utilizará porque si rebasa ese valor puede causar un overflow.

En este caso se genera un error en tiempo de ejecución, el compilador al usar 'y' y saber qué es de tipo Int8, le pone el mismo tipo de dato a 'z'. Pero al ejecutarse la variable rebasa su valor máximo.
```swift
let y: Int8 = 120
let z = y + 10 // Genera un error de ejecucion, al compilar se le asigna un tipo de datos Int8 a la variable

let z = y &+ 10 // El & indica que swift se comporte como C, genera un overflow pero el resultado es -126
```
Ponemos imprimir los valores máximos y mínimos de cada entero:
```swift
print("El valor máximo de Int es \(Int.max).") //Imprime: 9223372036854775807
print("El valor mínimo de Int es \(Int.min).") //Imprime: -9223372036854775808
print("El valor máximo de UInt es \(UInt.max).") //Imprime: 18446744073709551615
print("El valor mínimo de UInt es \(UInt.min).") //Imprime: 0
print("El valor máximo de Int8 es \(Int8.max).") //Imprime: 127
print("El valor máximo de Int16 es \(Int16.max).") //Imprime: 32767
print("El valor máximo de Int32 es \(Int32.max).") //Imprime: 2147483647
print("El valor máximo de Int64 es \(Int64.max).") //Imprime: 9223372036854775807
```
#### Cadenas
```swift
let myString: String = "Mi cadena"
let myString2 = "Mi ca\u{301}dena" //Tiene soporte de unicode
let myString3 = "Mi cádena" //Pero también funciona así
```
Algunas funciones que se pueden hacer con las cadenas:
```swift
//En este caso no cuenta el acento como un caracter más
myString.count //imprime: 9
myString2.count //imprime: 9

//De esta manera el unicode lo separa y nos regresa ambos caracteres separados
myString2.unicodeScalars.count //imprime: 10


//Estructuras de control
//Lo que devulve indices es un iterador
for index in myString2.indices {
  print("La salida es: \(myString2[index])")
}

//Igualdad
//La igualdad será de contenido, no compara que sea exactamente el mismo objeto
if myString2 == myString3 {
  print("Son iguales")
}
```

#### Flotante
Los flotantes son de 32 bits.
```swift
var myfloat: Float = 100.3
let myfloat2: Float
```
#### Double
Los double son de 64 bits.
```swift
var myDouble: Double = 1.1
let myDouble2: Double
```
**Se debe tener en cuenta que el valor de los decimales se guarda en notación científica, al momento de regresar de la notación se pierde precisión.**

> Por otro lado nunca se deben validar si son iguales los doubles, porque al guardarse en notación científica muy difícilmente cuadran.

```swift
print("myDouble + 0.1 es \(myDouble + 0.1)") //imprime: 1.2000000000000002

if myDouble + 0.1 == 1.2 {
  print("Son iguales") // Nunca entra
}
```


### Modelado de datos
#### Tuplas
Declaración de las tuplas y forma de acceder a una tupla sin descripción:
```swift
let errorCode = (404, "Not Found")
print(errorCode.0) //imprime: 404
```
Forma de agregar nombre a las tuplas:
```swift
let errorCode2 = (code: 404, description: "Not Found")
print(errorCode2.description) //imprime: Not Found
```
Asignación de variables con Pattern Matching de una tupla:
```swift
//Funciona como una afirmacion
//Lo que esta del lado izquierdo es igual a lo que tengo del lado derecho
//Se de-estructura para poder extraer valores

let (code, message) = errorCode
print("\(code) : \(message)") //imprime: 404 : Not Found

//De esta manera no importa recuperar el primer elemento, el único que importa es el segundo
let (_, message2) = errorCode


let errorCode3 = (404, "Not found", "Otro mensaje")
let (_,_,message3) = errorCode3
print(message3) //Imprime: Otro mensaje
```

### Switch
No importa qué tipo de dato sea, switch lo soporta.
Lleva break por defecto, así que no es necesario indicarlo.
```swift
let personaje: String = "Lobo estepario"

switch personaje {
  case "Caballero":
    print("El personaje \(personaje) es un caballero")
  case "Mago":
    print("El personaje \(personaje) es un Mago")
  //Si personaje asignado tiene prefijo 'lobo' y el sufijo 'pario' se asigne a la variable
  case let unPersonaje where unPersonaje.hasPrefix("Lobo") && unPersonaje.hasSuffix("pario"):
    print("Wow! El personaje \(personaje) es un Lobo")
  default:
    print("Este no es un personaje del juego")
}
```
> En la medida de lo posible, evitar poner default en el switch. Debido a que en ocasiones dentro del default no se declara ninguna acción y se vuelve un problema cuando la aplicación no manda ningún error.
>
>Se recomienda  manejar todos los casos y no colocar default.

El switch soporta rangos:
```swift
var  numero = 5
switch  numero {
  case  0...5:
    numero += 1
    fallthrough //Realizará las acciones y seguirá para entrar en el siguiente caso si es que cumple
  case  6..<10:
    numero *= 1
  case  11:
    print("Hola")
    break
  default:
    numero += 1
    print(numero)
}
```


### Opcionales
En swift las variables no pueden ser nulas. El proyecto no compila sí tiene valores nulos.

```swift
var x2: Int
x2 + 1  // x2 no esta declarada, es nula. Y por lo tanto no compila
```
  De esta manera se declaran las variables opcionales en swift:
```swift
var x3: Int? // De esta manera se indica que la variable puede ser nula
x3 = 1
x3 = nil
```
Si no se indica que puede ser nula, la aplicación no compilará.
```swift
var x4: Int
x4 = 1
x4 = nil //Error de compilación
```
De esta manera, es más visual que la variable puede ser nula. Cuando la variable es declarada como posible nula, es necesario forzar a sacar el valor de la variable.
```swift
var  f: Float? = 1.0
let  flotante = f! +  1.9  //El signo de admiracion es para forzar a sacar valor
```
> Se recomiendo evitar optionals siempre

##### IF LET
En caso de realmente necesitar usar una variable que tal vez sea nula. La mejor forma de manejarla es con un if let. Si la variable es nula, no hará nada con la variable.
```swift
if  let x = f {
  print("Todo bien \(x+1)") //Tambien se puede quedar con el if, sin la necesidad de usar else
} else {
  print("El opcional no tiene valor")
}
```
Para evitar tener tantos if let anidados como en el siguiente ejemplo:
```swift
var  cadenaOpcional: String? = "10"
if  let s = cadenaOpcional {
  if  let i = Int(s) { // Para evitar tener tantos if anidados
    print("El entero es \(i)")
  }
}
```
Se puede poner una coma y poner varias validaciones en la misma linea.
```swift
if  let s = cadenaOpcional, let i = Int(s) { //Si es necesario que lleve las llaves
  print("Cadena es \(s); el entero es \(i)")  //Imprime: Cadena es 10; el entero es 10
}
```

### Arreglos
```swift
var  librosFavoritos1: [String] = ["Aprende Swift en 3 segundos",
"Elm para principiantes",
"Crea sitios increibles con Elixir"]

var  librosFavoritos = ["Aprende Swift en 3 segundos",
"Elm para principiantes",
"Crea sitios increibles con Elixir"] //Inferencia de tipos
```
Algunas funciones con arreglos:
```swift
librosFavoritos.count  //Imprime: 3
librosFavoritos.first  //Imprime: Aprende Swift en 3 segundos
librosFavoritos.last  //Imprime: Crea sitios increibles con Elixir
librosFavoritos[1]  //Imprime: Elm para principiantes
librosFavoritos.append("Code complete")  //Imprime: ["Aprende Swift en 3 segundos", "Elm para principiantes", "Crea sitios increibles con Elixir", "Code complete"]
librosFavoritos[2]  //Imprime: Crea sitios increibles con Elixir
librosFavoritos.insert("The art of unix programming", at: 2) //Imprime: ["Aprende Swift en 3 segundos", "Elm para principiantes", "The art of unix programming", "Crea sitios increibles con Elixir", "Code complete"]
librosFavoritos[2]  //Imprime: The art of unix programming
librosFavoritos.remove(at: 3)  //Imprime: Crea sitios increibles con Elixir
```
Iterar arreglos:
```swift
for libro in  librosFavoritos {
  print(libro)
}

//enumerated devuelve un conjunto de tuplas
//Se hace un pattern matching con la tupla
for (indice, libro) in librosFavoritos.enumerated() {
  print("\(indice + 1) : \(libro)")
}
```


### Enums
Con los enums se puede controlar los únicos valores que puede tener la variable:
```swift
enum  Dia {
  case Lunes
  case  Martes
  case  Miércoles
  case  Jueves
  case  Viernes
  case  Sabado
}

//Restringo el tipo de dato, pero no el valor. En este caso el tipo de dato es String, el tipo de dato es dia.
//El valor se puede cambiar simplemente con .valor del enum

var  nombre: String
var  diaSemana = Dia.Lunes

diaSemana = .Jueves
```
#### Switch con enums
El switch  tiene que ser exhaustivo y cubrir todos los casos. Con el Enum, se controla los únicos valores que puede tener la variable.

Si se coloca un default incluso contemplando todos los casos, el compilador mandará un mensaje de que nunca entrará a ese caso porque la variable nunca tendrá ese valor.
```swift
switch  diaSemana {
  case .Lunes:
    print("Otra vez a trbajar")
  case .Martes:
    print("Ya quiero que acabe la semana")
  case .Miércoles:
    print("Apenas vamos a la mitad")
  case .Jueves:
    print("Ya casi es fin de semana")
  case .Viernes:
    print("Por fin es viernes!!")
  case .Sabado:
    print("Y ya es fin de semana")
}
```

### Diccionarios
Diccionarios, mapas o colecciones asociativas

```swift
var  unDiccionario: [String:Int] = [:]
var  diccionario = ["llave1": 1, "llave2": 2, "llave3": 3]

//Dentro de unValor se guarda el valor anterior de la llave
//unValor es de tipo opcional
let unValor = diccionario.updateValue(4, forKey: "llave2")
diccionario["llave1"] = 10

//Si la llave no se encuentra, la va a crear
diccionario  //Imprime:["llave1": 10, "llave2": 4, "llave3": 3]
diccionario["llavee"] = 10
diccionario  //Imprime: ["llave1": 10, "llavee": 10, "llave2": 4, "llave3": 3]
```
Diccionarios con llaves nulas
```swift
//Cuando una llave es nula, la quita del mapa
//No se recomienda borrar llaves de esta manera

diccionario["llave3"] = nil
diccionario  //Imprime: ["llave2": 4, "llavee": 10, "llave1": 10]

//Si se quiere remover una llave, se recomienda removerla de esta manera:

let llave2 = diccionario.removeValue(forKey:"llave1")
diccionario.removeValue(forKey:"llave2")
diccionario  // Imprime: ["llavee": 10]
```


### Conjuntos
Declaración de conjuntos:
```swift
//colecciones no ordenadas

var  amigos = Set<String>()
var  amigos1: Set<String> = [] //Si se inicializa
var  amigos2 = Set(["Julieta", "Violeta", "Andres", "Ernesto"])
var  amigos3: Set = ["Fabian", "Freddy", "Andres", "Ernesto"]
```
Algunas funciones con conjuntos:
```swift
amigos3.insert("Julian") //Imprime: (inserted true, memberAfterInsert "Julian")
amigos3.remove("Ernesto")
//No acepta duplicados
//Regresar una isercion falsa si se inserta un duplicado

amigos3.insert("Julian")  //Imprime: (inserted false, memberAfterInsert "Julian")

let  estaVacio = amigos3.isEmpty  //Imprime: false
let  estaAndres = amigos3.contains("Andres")  //Imprime: true
let  numeroAmigos = amigos3.count  //Imprime: 4

//Intersecciones, diferencia de interesecciones y la union

let  comunes = amigos2.intersection(amigos3)  //Imprime: {"Andres"}
let  diferencias = amigos2.symmetricDifference(amigos3)  //Imprime: {"Ernesto", "Julieta", "Fabian", "Freddy", "Julian", "Violeta"}
let  todos = amigos2.union(amigos3)  //Imprime: {"Freddy", "Violeta", "Fabian", "Julieta", "Julian", "Ernesto", "Andres"}
let  resta = amigos2.subtract(amigos3) //Imprime: ()
let  resta2 = amigos2.subtracting(amigos3) //Imprime: {'Julieta', 'Violeta', 'Ernesto'}
```

Iterando conjuntos:

- No hay que perder de vista que no hay garantia de orden

```swift
for amigo in amigos3 {
  print("\(amigo) es mi amigo")
}
```
