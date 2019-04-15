+++
image = "img/portfolio/pruebas.png"
showonlyimage = true
draft = false
date = "2018-05-14"
title = "Pruebas"
categories = [ "Testing" ]
weight = 5
+++



# Pruebas en el desarrollo de software

Dentro del desarrollo de software los errores existen en cualquier etapa del proyecto, aun cuando pensemos que nuestro código esta bien, existen ocasiones en las que no contemplamos bien el resultado de una validación y el resultado que esperamos no es el mismo que arroja.
Algo importante en el desarrollo de nuestro proyecto es ocupar métodos que nos permitan tener más desglosado nuestro código para facilitarnos la aplicación de pruebas para así saber en dónde falla nuestro código.
Otro aspecto importante por lo cual es importante realizar pruebas, es porque en ocasiones para compilar proyectos grandes se toman algunos minutos, y suponiendo que sean solo 3 o 4 minutos a la larga comprobar que la validación que acabas de realizar funciona, se vuelve muy cansado y los proyectos comienzan a alargarse en el tiempo.

Para verlo un poco más claro explicaremos un pequeño ejemplo:
>Tenemos unas cadenas de letras y queremos saber si tienen dos letras iguales juntas.

Lo probaremos con estas cadenas para verificar si el programa funciona correctamente:
~~~
  asdfgjwerpoq
  asdgmymdffdg
~~~
>Comenzando con la prueba, crearemos la clase que nos permita ver si nuestro programa funciona. Crearemos métodos para probar cada cadena por separado.

~~~
class ListExampleTest extends GroovyTestCase{

	def lista = new ListExample()

	void testContainsAPairOfSameLetters(){
		String text = "asdfgjwerpoq"
		Integer result = lista.verifyIfIsANiceString(text)
		assert result == 0 //El cero significa que la cadena no es valida
	}

	void testContainsAPairOfSameLettersNumberTwo(){
		String text = "asdgmymdffdg"
		Integer result = lista.verifyIfIsANiceString(text)
		assert result == 1 //El uno significa que la cadena cumple
	}

~~~

Nuestro programa quedaría de la siguiente forma:

~~~
class ListExample {
	Integer comprobarSiEsUnaBuenaLista(String text){
		Integer contador=0
		text.eachLine() { line ->
			validationEveryString(line)? contador++ : 0
		}
		contador
	}

	def verifyIfTheStringContainsAPairOfLettersWhichRepeats(String line){
		line.findAll(~/(.)\1/)
	}

   def validationEveryString(String line){
   	(verifyIfTheStringContainsAPairOfLettersWhichRepeats(line))? true :	false
   }
}
~~~
El desglosar nuestro programa en métodos nos facilita mucho encontrar un error, si es que existiera uno.
