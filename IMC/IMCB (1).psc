//Nombre del archivo: IMCB.psc
//Descripción: algoritmo que saca el imc y te dice en qué categoría de peso está el usuario.
//Autores: Eduardo Emiliano Aguirre Toledo y Juan Pablo Salcido Valenzuela.
//Fecha: 27/08/26.
Algoritmo IMCB
	Definir peso,estatura,IMC Como Real
	Definir edad Como Entero
	Escribir "Este algoritmo calcula el IMC"
	Escribir sin saltar "Por favor, introduzca su edad"
	leer edad 
	//Se analiza la edad para ver si es apto para sacar el IMC.
	Si edad >= 20 Entonces
		Escribir Sin Saltar "Por favor, introduzca su peso en kilogramos: "
		Leer peso
		//Se evalúa que el peso sea válido.
		si peso>= 0 Entonces
			Escribir Sin Saltar"Por favor, introduzca su estatura en metros: "
			leer estatura
			//Se evalúa que la estatura también sea válida.
			si estatura>0 Entonces
				//Pasada la lectura, se empiezan a hacer las operaciones para sacar el IMC y se asigna la categoría de peso.
				IMC <- peso/(estatura)^2
				Si imc < 16.5  Entonces
					Escribir "Su IMC es: ",imc, ", usted esta en bajo peso severo."
				FinSi
				Si imc >= 16.5 y imc < 18.5 Entonces
					Escribir "Su IMC es: ",imc, ", usted está en bajo peso." 
				FinSi
				Si imc >= 18.5 y imc < 25.0 Entonces
					Escribir "Su IMC es: ",imc, ", usted está en peso saludable."
				FinSi
				Si imc >= 25.0 y imc < 30.0 Entonces
					Escribir "Su IMC es: ",imc,", usted está en sobrepeso."
				FinSi
				Si imc >= 30.0 y imc < 35.0 Entonces
					Escribir "Su IMC es: ",imc,", usted está en obesidad tipo I."
				FinSi
				Si imc >= 35.0 y imc < 40.0 Entonces
					Escribir "Su IMC es: ",imc,", usted está en obesidad tipo II."
				FinSi
				Si imc >= 40.0 Entonces
					Escribir "Su IMC es: ",imc,", usted está en obesidad tipo III."
				FinSi
			FinSi
			//Si  la altura que ponga el usuario es menor o igual a 0, se pondrá el siguiente mensaje.
			Si estatura<=0 Entonces
				Escribir "Dato inválido, la estatura no puede ser igual o menor a 0."
			FinSi
		FinSi
		//Si el usario pone un valor negativo en el peso, se escribirá lo siguiente.
		Si peso<0 Entonces
			Escribir "Dato inválido, el peso no puede ser negativo."
		FinSi
	FinSi
	//En caso de que la edad sea menor de 20 años, dará el siguiente mensaje.
	Si edad < 20 Entonces
		Escribir "Dato invalido, debe ser mayor a 20 años."
	FinSi

FinAlgoritmo
