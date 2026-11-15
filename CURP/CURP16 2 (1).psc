//Grupo: 6
//Nombre del archivo: CURP16
//descripción: Algoritmo que captura datos del usario y saca una curp de 16 dígitos
//Autor: Eduardo Emiliano Aguirre Toledo y Juan Pablo Salcido Valenzuela
//Fecha: 11/10/26
// Este subproceso nos permite enontrar la primera consonante interna de una palabra, se usará más tarde.
SubProceso consonante <- buscarConsonante(nombre)
	Definir consonante Como Caracter
	Definir consonanteSi Como Logico
	Definir i Como Entero
	//Aquí el contador empieza en 2, porque queremos la interna,  cada vuelta se comprueba si la letra es consonante, de no serlo, lo repetirá y si no encuentra se le pondrá un "x" a la variable.
	consonanteSi<- falso
	Para i<-2 Hasta Longitud(nombre) con paso 1 Hacer
		si consonanteSi <> Verdadero Entonces
			si Subcadena(nombre,i,i)<>"A" y Subcadena(nombre,i,i)<>"E" y Subcadena(nombre,i,i)<>"I" y Subcadena(nombre,i,i)<>"O" y Subcadena(nombre,i,i)<>"U" Entonces
				consonante <- Subcadena(nombre,i,i)
				ConsonanteSi<-Verdadero
			SiNo
				consonante<-"X"
				consonanteSi<-Falso
			FinSi
		FinSi
	FinPara
FinSubProceso
//****************************************************************
//similar al subproceso anterior, hace lo mismo pero en vez de consonantes, busca vocales.
SubProceso vocal <- buscarVocal(nombre)
	Definir vocal Como Caracter
	Definir vocalONo Como Logico
	Definir i Como Entero
	
	vocalONo<- falso
	Para i<-2 Hasta Longitud(nombre) con paso 1 Hacer
		si vocalONo <> Verdadero Entonces
			si Subcadena(nombre,i,i)="A" o Subcadena(nombre,i,i)="E" o Subcadena(nombre,i,i)="I" o Subcadena(nombre,i,i)="O" o Subcadena(nombre,i,i)="U" Entonces
				vocal <- Subcadena(nombre,i,i)
				vocalONo<-Verdadero
			SiNo
				vocal<-"X"
				vocalONo<-Falso
			FinSi
		FinSi
	FinPara
FinSubProceso
//******************************************************************************
//Este subproceso nos ayuda a saber cuantas letras tiene la primera palabra y la segunda palabra, guarda el valor de dónde está el espacio.
SubProceso espacio<-separacion(nombre)
	Definir espacio, i Como Entero
	Definir booleano Como Logico
	
	booleano<- Falso
	Para i<- 1 Hasta Longitud(nombre) Con Paso 1 Hacer
		si booleano<>Verdadero Entonces
			si subcadena(nombre,i,i) = " " Entonces
				booleano <- Verdadero
				espacio <- i	
			SiNo
				booleano <- Falso
				espacio <- i
			FinSi
		FinSi
	Fin Para
FinSubProceso
//********************************************************************************
//Este subproceso nos ayuda a identifcar si hay más de dos palabras en la cadena de caracteres, la usaremos pronto también.

SubProceso booleano<-separacion2(nombre)
	Definir booleano Como Logico
	Definir i, espacio Como Entero
	
	booleano<- Falso
	Para i<- 1 Hasta Longitud(nombre) Con Paso 1 Hacer
		si booleano<>Verdadero Entonces
			si subcadena(nombre,i,i) = " " Entonces
				booleano <- Verdadero
				espacio <- i	
			SiNo
				booleano <- Falso
				espacio <- i
			FinSi
		FinSi
	Fin Para
FinSubProceso
//*************************************************************************************
// Este subproceso recibe el nombre completo y devuelve los primeros 4 caracteres de la CURP.
SubProceso CURP1<-cuatrodigitos (nombre,apellidoP,apellidoS)
	Definir CURP1, vocalIP Como Caracter
	Definir espacioP, i, espacioN, espacioS como entero 
	Definir nombreCompuesto, apellidoPCompuesto, apellidoSCompuesto Como Logico
	
	// PRIMER APELLIDO
//se llama al subproceso que nos dice si hay más de dos palabras en el primer apellido.
	apellidoPCompuesto<-separacion2(apellidoP)
	//En caso de no haber segunda paabra se hará esto.
	Si ApellidoPCompuesto = Falso Entonces
		//se llama al subproceso que nos ayuda a saber cuál es la primera vocal interna del apellido paterno.
		vocalIP<- buscarVocal(apellidoP)
		apellidoP<-Concatenar(subcadena(apellidoP,1,1),vocalIP)
		//En caso de haber una excepción en la primera letra del apellido se reemplazará con una "x".
		si Subcadena(apellidoP,1,1)= "Ñ" o subcadena(apellidoP,1,1)="/" o Subcadena(apellidoP,1,1)="-" o Subcadena(apellidoP,1,1)="." Entonces
			apellidoP <- concatenar("X", vocalIP)
		FinSi
	SiNo
		//se llama al subproceso que nos dice cuántas letras hay antes del espacio.
		espacioP<-separacion(apellidoP)
		//se verifica si la primera palabra del primer apellido es una excepción, en caso de no serlo se concatena la primera letra y la vocal.
		si Subcadena(apellidoP,1,espacioP-1)<> "DA" y Subcadena(apellidoP,1,espacioP-1)<> "DAS" y Subcadena(apellidoP,1,espacioP-1)<> "DE" y Subcadena(apellidoP,1,espacioP-1)<> "DEL" y Subcadena(apellidoP,1,espacioP-1)<> "DER"y Subcadena(apellidoP,1,espacioP-1)<> "DI"y Subcadena(apellidoP,1,espacioP-1)<> "DIE"y Subcadena(apellidoP,1,espacioP-1)<> "DD"y Subcadena(apellidoP,1,espacioP-1)<> "EL"y Subcadena(apellidoP,1,espacioP-1)<> "LA"y Subcadena(apellidoP,1,espacioP-1)<> "LOS"y Subcadena(apellidoP,1,espacioP-1)<> "LAS"y Subcadena(apellidoP,1,espacioP-1)<> "LE"y Subcadena(apellidoP,1,espacioP-1)<> "LES"y Subcadena(apellidoP,1,espacioP-1)<> "MAC"y Subcadena(apellidoP,1,espacioP-1)<> "MC"y Subcadena(apellidoP,1,espacioP-1)<> "VAN"y Subcadena(apellidoP,1,espacioP-1)<> "VON"y Subcadena(apellidoP,1,espacioP-1)<> "Y" entonces 
			vocalIP<- buscarVocal(apellidoP)
			apellidoP<-Concatenar(subcadena(apellidoP,1,1),vocalIP)
		SiNo
			//En caso de ser una excepción, se agarrará la segunda palabra del primer apellido, se buscará la primera vocal de la segunda palabra, se concatenan la primera letra del segundo apellido y su vocal interna.
			apellidoP <- Subcadena(apellidoP, espacioP+1,espacioP+1)
			vocalIP<- buscarVocal(Subcadena(apellidoP,espacioP+1,Longitud(apellidoP)))
			apellidoP<- Concatenar(subcadena(apellidoP,espacioP+1,espacioP+1),vocalIP)
			// En caso de que la primera letra del segundo apellido sea una excepción se reemplaza con una "x".
			si Subcadena(apellidoP,1,1)= "Ñ" o subcadena(apellidoP,1,1)="/" o Subcadena(apellidoP,1,1)="-" o Subcadena(apellidoP,1,1)="." Entonces
				apellidoP <- concatenar("X", vocalIP)
			FinSi
		FinSi
	FinSi
	
	// SEGUNDO APELLIDO.
	//Se llama al subproceso para saber si es un apellido compuesto.
    apellidoSCompuesto<-separacion2(apellidoS)
	//Si no tiene segundo apellido, se pondrá una "x".
    si apellidoS="" Entonces
	   apellidoS<-"X"
   SiNo
	   
	   Si ApellidoSCompuesto = Falso Entonces
		   //Si solo hay una palabra del primer apellido se hará esto.
		   apellidoS<-subcadena(apellidoS,1,1)
		   //Si la primera letra es una excepción se reemplaza por una "x".
			si Subcadena(apellidoS,1,1)= "Ñ" o subcadena(apellidoS,1,1)="/" o Subcadena(apellidoS,1,1)="-" o Subcadena(apellidoS,1,1)="." Entonces
				apellidoS <- "X"
			FinSi
		SiNo
			// Si hay dos palabras en el segundo apellido, se llama al subproceso donde guarda cuantas letras hay junto con el espacio de la primera palabra.
			espacioS<-separacion(apellidoS)
			si Subcadena(apellidoS,1,espacioS-1)<>"DA" y Subcadena(apellidoS,1,espacioS-1)<> "DAS" y Subcadena(apellidoS,1,espacioS-1)<> "DE" y Subcadena(apellidoS,1,espacioS-1)<> "DEL" y Subcadena(apellidoS,1,espacioS-1)<> "DER"y Subcadena(apellidoS,1,espacioS-1)<> "DI"y Subcadena(apellidoS,1,espacioS-1)<> "DIE"y Subcadena(apellidoS,1,espacioS-1)<> "DD"y Subcadena(apellidoS,1,espacioS-1)<> "EL"y Subcadena(apellidoS,1,espacioS-1)<> "LA"y Subcadena(apellidoS,1,espacioS-1)<> "LOS"y Subcadena(apellidoS,1,espacioS-1)<> "LAS"y Subcadena(apellidoS,1,espacioS-1)<> "LE"y Subcadena(apellidoS,1,espacioS-1)<> "LES"y Subcadena(apellidoS,1,espacioS-1)<> "MAC"y Subcadena(apellidoS,1,espacioS-1)<> "MC"y Subcadena(apellidoS,1,espacioS-1)<> "VAN"y Subcadena(apellidoS,1,espacioS-1)<> "VON"y Subcadena(apellidoS,1,espacioS-1)<> "Y" entonces 
				si Subcadena(apellidoS,1,1)= "Ñ" o subcadena(apellidoS,1,1)="/" o Subcadena(apellidoS,1,1)="-" o Subcadena(apellidoS,1,1)="." Entonces
					apellidoS <- "X"
				FinSi
				apellidoS<-subcadena(apellidoS,1,1)
				//si la primera palabra es una excepción, se usará la segunda y se checará si la letra es una excepción, si es se pondrá una "x".
			SiNo
				espacioS<-separacion(apellidoS)
				si Subcadena(apellidoS,espacioS+1,espacioS+1)= "Ñ" o subcadena(apellidoS,espacioS+1,espacioS+1)="/" o subcadena(apellidoS,espacioS+1,espacioS+1)="-" o Subcadena(apellidoS,espacioS+1,espacioS+1)="." Entonces
					apellidoS <- "X"
				SiNo
					apellidoS<- subcadena(apellidoS,espacioS+1,espacioS+1)
				FinSi
				
			FinSi
		FinSi
	FinSi
	
	//CONCATENACIÓN DE APELLIDOS.
	CURP1<-Concatenar(apellidoP,apellidoS)
	
	//NOMBRE.
	//Se llama al subproceso para saber si el nombre es compuesto.
	nombrecompuesto<-separacion2(nombre)
	
	//Nombre simple.
	si nombreCompuesto = Falso Entonces
		// Si no es, se agarrará la primera letra y se comprobará si no es excepción, si lo es se sustituye por "x".
		si Subcadena(nombre,1,1)<>"Ñ" y subcadena(nombre,1,1)<>"/" y Subcadena(nombre,1,1)<>"-" y Subcadena(nombre,1,1)<>"."Entonces
			nombre<- Subcadena(nombre,1,1)
		SiNo
			nombre<- "X"
		FinSi
	//Nombre compuesto.
	SiNo
		//En caso de ser un nombre compuesto, se comprobará si la primera palabra no es excepción y se evaluará si no tiene excepción la letra, si lo es, se saltará a la segunda palabra y comprobará si no tiene excepciones en la letra.
		espacioN<-separacion(nombre)
		si Subcadena(nombre,1,espacioN-1)<>"MARIA" y Subcadena(nombre,1,espacioN-1)<>"MA" y Subcadena(nombre,1,espacioN-1)<>"MA." y Subcadena(nombre,1,espacioN-1)<>"JOSE" y Subcadena(nombre,1,espacioN-1)<>"J" y Subcadena(nombre,1,espacioN-1)<>"J."  Entonces
			si Subcadena(nombre,1,1)<>"Ñ" y Subcadena(nombre,1,1)<>"/" y Subcadena(nombre,1,1)<>"-" y Subcadena(nombre,1,1)<>"." Entonces
				nombre<- Subcadena(nombre,1,1)
			SiNo
				nombre<- "X"
				
			FinSi
		SiNo
			si Subcadena(nombre, espacioN+1,espacioN+1)<>"Ñ" y Subcadena(nombre,espacioN+1,espacioN+1)<>"/" y Subcadena(nombre,espacioN+1,espacioN+1)<>"-" y Subcadena(nombre,espacioN+1,espacioN+1)<>"." Entonces
				nombre <- Subcadena(nombre,espacioN+1,espacioN+1)
			SiNo
				nombre<- "X"
			FinSi
			
		FinSi
	FinSi
//Se concatenan y se comprueba de que no haya una palabra atisonante, en caso de haberla, se reemplaza a la segunda letra con una "x".
	CURP1<-Concatenar(CURP1,nombre)
	
	si CURP1 = "CACA" o CURP1="PEDO"o CURP1="BACA"o CURP1="BAKA"o CURP1="BUEI"o CURP1="BUEY"o CURP1="CACO"o CURP1="CAGA"o CURP1="CAGO"o CURP1="CAKA"o CURP1="CAKO"o CURP1="COGE"o CURP1="COGI"o CURP1="COJA"o CURP1="COJE"o CURP1="COJI"o CURP1="COJO"o CURP1="COLA"o CURP1="CULO" Entonces
		CURP1<- Concatenar(Concatenar(Subcadena(CURP1,1,1),"X"),Subcadena(CURP1,3,4))
	FinSi
FinSubProceso

//***************************************************************************************
//Este subproceso recibe el año, mes, día y el sexo, los primeros 3 como números y se convierten a texto. Da los caracteres 5-11.
SubProceso CURP2<-Cumple(anio,mes,dia,sexo)
	Definir CURP2,anio2,mes2,dia2 Como Caracter
	Definir i,ultimos2 Como Entero
	//Año*****************************************
	//Se convierte al año en texto, después se evalúa cuantos caracteres tiene y después toma los últimos 2 dígitos y se guardan en una cadena de caracteres.
	anio2<-ConvertirATexto(anio)
	
	Para i<-1 Hasta Longitud(anio2) Con Paso 1 Hacer
		ultimos2<-i
	Fin Para
	anio2<-Subcadena(anio2,ultimos2-1,ultimos2)
	
	//mes****************************************************
	//Se comprueba si el mes es menor o igual a 9, si lo es, convierte al mes en texto, luego se le concatena un cero y el número a una variable de cadena de caracteres.
	si mes<=9 Entonces
		mes2<-ConvertirATexto(mes)
		mes2<-Concatenar("0",mes2)
	SiNo
		//Si es mayor a 9 simplemente se convierte a texto  y se concatena junto con el año.
		mes2<-ConvertirATexto(mes)
	FinSi
	//Se concatenan los últimos dígitos del año y los dígitos del mes.
	CURP2<- Concatenar(anio2,mes2)
	//Día******************************************************************
	//Se hace lo mismo que el mes pero con el día.
	si dia<=9 Entonces
		dia2<-ConvertirATexto(dia)
		dia2<-Concatenar("0",dia2)
	SiNo
		dia2<-ConvertirATexto(dia)
	FinSi
	//Se le hace subcadena la primera letra del sexo y luego se asigno como nuevo valor a la cadena de caracteres de "sexo".
	sexo<-Subcadena(sexo,1,1)
	//Se concatenan a la CURP2 las cadenas de día y de sexo.
	CURP2<- Concatenar(Concatenar(CURP2,dia2),sexo)
FinSubProceso

//Entidad federativa*****************************************************************************************************
//Este subproceso recibe a la entidad federativa y da los caracteres 12-13.
SubProceso CURP3<-lugar(estado)
	Definir CURP3,consonante Como Caracter
	Definir consonanteSi, estadoCompuesto Como Logico
	Definir i, espacio Como Entero
	// En caso de ser extranjero se pone "EN".
	si estado= "EXTRANJERO" Entonces
		CURP3<-"EN" 
	Sino
		//Se habla al SubProceso que nos dice si hay 2 dos palabras en la cadena estado.
		estadoCompuesto<-separacion2(estado)
		si estadoCompuesto= Falso Entonces
			consonanteSi<- falso
			//Si hay solo una palabra se calcula la última consonante, empezando desde la última letra hasta encontrar la consonante.
			Para i<-Longitud(estado) Hasta 1 con paso -1 Hacer
				si ConsonanteSi <> Verdadero Entonces
					si Subcadena(estado,i,i)<>"A" y Subcadena(estado,i,i)<>"E" y Subcadena(estado,i,i)<>"I" y Subcadena(estado,i,i)<>"O" y Subcadena(estado,i,i)<>"U" Entonces
						consonante <- Subcadena(estado,i,i)
						consonanteSi<-Verdadero
					FinSi
				FinSi
			FinPara
			//Se concatena la primera letra y la última consonante, que es la que acabamos de calcular.
			CURP3<-Concatenar(Subcadena(estado,1,1),consonante)
		SiNo
			//En caso de que haya 2 palabras, se agarra la primera letra de cada palabra.
			si estado<>"BAJA CALIFORNIA SUR" y estado<>"SAN LUIS POTOSÍ"  Entonces
				espacio<-separacion(estado)
				CURP3<- Concatenar(subcadena(estado,1,1),subcadena(estado, espacio+1,espacio+1))
				
			SiNo
				//Con Baja California Sur y San Luis Potosí se hace agarra la primera letra de la primera y tercera palabra.
				si estado="SAN LUIS POTOSÍ" Entonces
					CURP3<- Concatenar(Subcadena(estado,1,1), Subcadena(estado,10,10))
				SiNo
					
					CURP3<- Concatenar(subcadena(estado,1,1), Subcadena(estado,17,17))
					
				FinSi
			FinSi
			
		FinSi
	FinSi
FinSubProceso
//**************************************************************************************************************************
//Este subproceso recibe el nombre completo y da los últimos 3 dígitos (14-16).
SubProceso CURP4<-consonantesdenombres(nombre,apellidoP,apellidoS)
	Definir CURP4, consonanteP,consonanteS,consonanteN, nombreS Como Caracter
	Definir espacioN como entero
	Definir consonanteSi, nombrecompuesto Como Logico
	//Se llama al subproceso para encontrar la primera consonante interna del primer apellido.
	consonanteP<-buscarConsonante(apellidoP)
	//En caso de ser una "ñ" se reemplaza por "x".
	si consonanteP="Ñ" Entonces
		consonanteP<-"X"
	FinSi
	// Se busca la consonante del segundo apellido, si hay alguna excepción como ñ o de no haber consonante, se pone x.
	consonanteS<-buscarConsonante(apellidoS)
	si consonanteS="Ñ" o consonanteS="" Entonces
		consonanteS<-"X"
	FinSi
	//Se concatenan las consonantes de los apellidos.
	CURP4<-Concatenar(consonanteP, consonanteS)
	//Se busca si hay nombre compuesto.
	nombrecompuesto<-separacion2(nombre)
	si nombreCompuesto = Falso Entonces
		//Se busca la consonante del nombre, en caso de haber una excepción, se pone x.
		consonanteN<-buscarConsonante(nombre)
		si consonanteN="Ñ" o consonanteN="/" o consonanteN="-" o consonanteN="."Entonces
			consonanteN<- "X"
		FinSi
	//Nombre compuesto.
	SiNo
		//Se busca dónde estpa la separación del nombre y la consonante del nombre.
		espacioN<-separacion(nombre)
		consonanteN<-buscarConsonante(nombre)
		si Subcadena(nombre,1,espacioN-1)<>"MARIA" y Subcadena(nombre,1,espacioN-1)<>"MA" y Subcadena(nombre,1,espacioN-1)<>"MA." y Subcadena(nombre,1,espacioN-1)<>"JOSE" y Subcadena(nombre,1,espacioN-1)<>"J" y Subcadena(nombre,1,espacioN-1)<>"J."  Entonces
			si consonanteN="Ñ" o consonanteN="/" o consonanteN="-" o consonanteN="." Entonces
				consonanteN<-"X"
			FinSi
		SiNo
			//En caso de ser el primer nombre una excepción, se agarra el segundo, en caso de haber una excepción se pone x.
			nombreS<-Subcadena(nombre,espacioN+1,Longitud(nombre))
			consonanteN<-buscarConsonante(nombreS)
			si consonanteN="Ñ" o consonanteN="/" o consonanteN="-" o consonanteN="." Entonces
				consonanteN<- "X"
			FinSi
		FinSi
	FinSi
	// Se concatena la consonante del nombre junto a la de los apellidos.
	CURP4<-Concatenar(CURP4, consonanteN)
FinSubProceso
//********************************************************************************
//Este subproceso recibe todos los datos del usuario, llama a los demás subprocesos y expulsa una cadena de 16 dígitos, la cuál es la CURP.
SubProceso CURP<-ensamblaje(nombre,apellidoP,ApellidoS,sexo,estado,anio,mes,dia)
	Definir CURP,CURP1,CURP2,CURP3,CURP4 Como Caracter
	CURP1<-cuatrodigitos(nombre,apellidoP,apellidoS)
	CURP2<-Cumple(anio,mes,dia,sexo)
	CURP3<-lugar(estado)
	CURP4<-consonantesdenombres(nombre,apellidoP, apellidoS)
	CURP<-Concatenar(CURP1,CURP2)
	CURP<-Concatenar(CURP,CURP3)
	CURP<-Concatenar(CURP,CURP4)
FinSubProceso
//********************************************************************
Proceso CURP16
	Definir nombre, apellidoP, apellidoS,sexo,estado,CURP, CURP1,CURP2,CURP3,CURP4 Como caracter
	Definir anio,mes,dia Como Entero
	Escribir "Algoritmo que saca los primeros 16 dígitos de la CURP con los datos del usuario."
	//Se piden y validan todos los datos del usario, en caso de poner un dato inválido, se le pide de nuevo al usuario.
	Escribir Sin Saltar "Introduzca su nombre:"
	leer nombre
	nombre <- Mayusculas(nombre)
	Escribir Sin Saltar "Introduzca su primer apellido:"
	Leer apellidoP
	apellidoP <- Mayusculas(apellidoP)
	Escribir Sin Saltar"Introduzca su segundo apellido:"
	leer apellidoS
	apellidoS <- Mayusculas(apellidoS)
	Escribir Sin Saltar "Año de nacimiento: "
	leer anio
	Mientras anio<1920 Hacer
		Escribir Sin Saltar "Año no válido, por favor, introduzca un año mayor a 1919: "
		leer anio
	Fin Mientras
	
	Escribir Sin Saltar "Mes de nacimiento (en número del 1 al 12): "
	leer mes
	
	Mientras mes>12 o mes<1 Hacer
		Escribir Sin Saltar "Número de mes incorrecto, por favor ingrese un mes del 1 al 12: "
		leer mes
	Fin Mientras
	Escribir Sin Saltar "Día de nacimiento (en número del 1 al 31): "
	leer dia
	Mientras dia>31 o dia<1 Hacer
		Escribir "Día incorrecto, por favor, seleccione del 1 al 31:"
		Leer dia
	Fin Mientras
	Escribir Sin Saltar "Sexo de nacimiento (mujer u hombre): "
	leer sexo
	sexo<-Mayusculas(sexo)
	Mientras sexo<>"MUJER" y sexo<>"HOMBRE" Hacer
		Escribir "Respuesta no válida, por favor, escriba hombre o mujer"
		leer sexo
		sexo<-Mayusculas(sexo)
	Fin Mientras
	
	Escribir Sin Saltar "Estado donde nació: "
	Leer estado
	estado<-Mayusculas(estado)
	Mientras estado<>"AGUASCALIENTES" y estado<>"BAJA CALIFORNIA" y estado<>"BAJA CALIFORNIA SUR" y estado<>"CAMPECHE" y estado<>"COAHUILA" y estado<>"COLIMA" y estado<>"CHIAPAS" y estado<>"CHIHUAHUA" y estado<>"DISTRITO FEDERAL" y estado<>"DURANGO" y estado<>"GUANAJUATO" y estado<>"GUERRERO" y estado<>"HIDALGO" y estado<>"JALISCO" y estado<>"MÉXICO" y estado<>"MICHOACÁN" y estado<>"MORELOS" y estado<>"NAYARIT" y estado<>"NUEVO LEÓN" y estado<>"OAXACA" y estado<>"PUEBLA" y estado<>"QUERÉTARO" y estado<>"QUINTANA ROO" y estado<>"SAN LUIS POTOSÍ" y estado<>"SINALOA" y estado<>"SONORA" y estado<>"TABASCO" y estado<>"TAMAULIPAS" y estado<>"TLAXCALA" y estado<>"VERACRUZ" y estado<>"YUCATÁN" y estado<>"ZACATECAS" y estado<>"EXTRANJERO"  Hacer
		Escribir "Respuesta no válida, por favor, escriba una de las 32 entidades federativas de México."
		Escribir "En caso de ser de otra parte, escriba ","extranjero",": " 
		Leer estado
		estado<- Mayusculas(estado)
	Fin Mientras
	//Se llama al subproceso, se generan y se escriben los 16 primeros dígitos de la CURP.
	CURP<-ensamblaje(nombre,apellidoP,ApellidoS,sexo,estado,anio,mes,dia)
	Escribir Sin Saltar "Esta es su CURP: "
	Escribir CURP
	FinProceso
