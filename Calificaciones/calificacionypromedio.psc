//Grupo:6
//Autores: Eduardo Emiliano Aguirre Toledo y Juan Pablo Salcido Valenzuela.
//Nombre del archivo: calificacionypromedio.psc
//Descripción: Algoritmo que saca el promedio y clafica a n cantidad de alumnos.
//Fecha: 19/09/26.
Proceso calificacionypromedio
	Definir alumnos,promedio,examen4,calificacion,suficiente,sobresaliente, regular,rescate,reprobado Como real
	Definir contadorAlumnos, contadordecalificacion, numsobre,numsuf,numreg,numrep Como Entero
	escribir"Programa que da el promedio dede los alumnos, determine quienes aprueban y quienes reprobarán"
	Escribir Sin Saltar "Introduzca el número de alumnos a calificar: "
	leer alumnos
	//se valida la cantidad de alumnos a promediar y clasificar.
	Mientras  alumnos<1 Hacer
		Escribir Sin Saltar "Número de alumnos no válido, porfavor, introduzca la cantidad de alumnos: "
		leer alumnos
	FinMientras
	//Inician los contadores 4 en 0 excepto el de alumnos.
	contadorAlumnos<-1
	numsobre<-0
	numreg<-0
	numsuf<-0
	numrep<-0
	//Empieza el ciclo que es alumno en alumno
	Mientras contadorAlumnos<=alumnos hacer
		//se Inician los contadores dentro para que, con cada alumno evaluado se reinicie a esos valores.
		contadordecalificacion<-1
		promedio<-0
		//se inicia otro ciclo para sacar las calificaciones y sumarlas al promedio, pero aún no se dividirá.
		Escribir "Promedio de alumno #",contadorAlumnos
		Mientras contadordecalificacion<=3 Hacer
			Escribir "Introduzca la calificacion #",contadordecalificacion, " (De el 0 al 100): "
			Leer calificacion
			//Se valida que la calificación esté en el rango de 0 a 100.
			Mientras calificacion<0 o calificacion>100 Hacer
				Escribir "Por favor, introduzca la calificacion de el 0 al 100: "
				Leer calificacion
			FinMientras
			//Se suma al promedio la calificacion y se volverá a pedir hasta que sean las 3.
			promedio<-promedio+calificacion
			
			contadordecalificacion<-contadordecalificacion+1
		FinMientras
		//Ahora se saca el promedio entre 3 y se redondea, también se imprime el promedio actual.
		promedio<-redon(promedio/3)
		Escribir "El promedio actual del alumno #",ContadorAlumnos " es de: ",promedio
		//Se hacen los cálculos para saber la calificacion necesaria del alumno para alcanzar las 2 metas y para la clasificación.
		sobresaliente<-360-(promedio*3)
		regular<-244-(promedio*3)
		suficiente<-240-(promedio*3)
		//Se analiza si puede conseguir el promedio sobresaliente.
		Escribir Sin Saltar "Puntaje necesario en el cuarto examen para obtener promedio sobresaliente: "
		si sobresaliente<0 Entonces
			Escribir " Ya se alcanzó la meta."
		SiNo
			si sobresaliente>100 Entonces
				Escribir " No es alcanzable."
			SiNo
				Escribir sobresaliente
			FinSi
		FinSi
		//Se analiza si puede conseguir el promedio suficiente.
		Escribir Sin Saltar "Puntaje necesario en el cuarto examen para obtener promedio suficiente: "
		si suficiente<=0 Entonces
			Escribir " Ya se alcanzó la meta."
		SiNo
			si suficiente>100 Entonces
				Escribir " No es posible de alcanzar."
			SiNo 
				Escribir suficiente
			FinSi
		FinSi
		//Se le asigna al alumno una de las 4 categorías aprobatorías.
		Escribir Sin Saltar "Categoría del alumno #", contadorAlumnos,":"
		si sobresaliente<=100 Entonces
			Escribir " El alumno es sobresaliente."
			numsobre<-numsobre+1
		SiNo
			si regular<=100 Entonces
				Escribir " El alumno es regular."
				numreg<-numreg+1
			SiNo
				si suficiente<=100
					Escribir " El alumno puede recuperarse."
					numsuf<-numsuf+1
				SiNo
					Escribir " El alumno está reprobado."
					numrep<-numrep+1
				FinSi
			FinSi
		FinSi
		Escribir ""
		//Se acaba el ciclo y vuelve a iniciar hasta n número de alumnos.
		contadorAlumnos<-contadorAlumnos+1
	FinMientras
	//Después de promediar, analizar y clasificar a todos los alumnos, se escriben los resultados.
	Escribir "Para la cantidad de alumnos ",alumnos," los resultados son:"
	Escribir "Alumnos sobresalientes: ",numsobre
	Escribir "Alumnos regulares: ", numreg
	Escribir "Alumnos con posible rescate: ", numsuf
	Escribir "Alumnos reprobados inevitablemente: ", numrep
FinProceso
