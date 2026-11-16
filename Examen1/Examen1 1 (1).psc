//Nombre del archivo: Examen1.psc
//Descripción: Algoritmo que le dice al usario el día de la semana respecto a una fecha.
//Autor:Juan Pablo Salcido Valenzuela.
//Fecha: 03/09/26.
Proceso Examen1
	Definir dia,mes,anio,a,b,c, indicador,indicadorMod7 Como Entero
	Definir indicador2 Como Caracter
	Escribir "Algoritmo que te dice el día, mes y año"
	Escribir Sin Saltar "Introduzca un año: "
	leer anio
	si anio>=1582 Entonces
		Escribir Sin Saltar "Introduzca el mes: "
		leer mes
		si mes>=1 y mes<=12 Entonces
			Escribir Sin Saltar "Ingrese día: "
			leer dia
			si dia>=1 y dia<=31 Entonces
				a<-trunc((14-mes)/12)
				b<-anio-a
				c<-mes+12*(a)-2
				indicadorMod7<- trunc(dia + b + (b/4)-(b/100)+(b/400)+(31*c)/12)
				indicador<-indicadorMod7 Mod 7
				Segun indicador Hacer
					0:
						indicador2<-"domingo"
					1:
						indicador2<- "lunes"
					2:
						indicador2<- "martes"
					3:
						indicador2<- "miércoles"
					4:
						indicador2<- "jueves"
					5:
						indicador2<- "viernes"
					6:
						indicador2<- "sábado"
				Fin Segun
				Segun mes Hacer
					1:
						Escribir  "El ", dia," de enero de ",anio,",fue/es/será" indicador2
					2:si dia=29 Entonces
						Si anio MOD 400 = 0 o anio MOD 4 = 0 y anio MOD 100 <> 0 Entonces
							Escribir "El ", dia," de Febrero de ",anio,",fue/es/será ", indicador2
							sino
								Escribir "No es año bisiesto, Febrero tiene 28 días."
							FinSi
							
					SiNo
						Escribir "Febrero no tiene más de 29 días"
					FinSi
					si dia<=28 Entonces
						escribir "El ", dia," de Febrero de ",anio,",fue/es/será ", indicador2
						si dia>28 Entonces
							Escribir "Valor no apto."
						FinSi
					FinSi
					3:
						Escribir "El ", dia," de Marzo de ",anio,",fue ", indicador2,"."
					4: si dia<=30 Entonces
							
							Escribir "El ", dia," de Abril de ",anio,",fue ", indicador2,"."
						sino 
							Escribir "Abril solo tiene 30 días."
						FinSi
					5:
						Escribir "El ", dia," de Mayo de ",anio,",fue ",indicador2,"."
					6: si dia<=30
							Escribir "El ", dia," de Junio de ",anio,",fue ", indicador2,"."
						SiNo
							Escribir "Junio solo tiene 30 días."
						FinSi
					7:
						Escribir "El ", dia," de Julio de ",anio,",fue ", indicador2,"."
					8:
						Escribir "El ", dia," de Agosto de ",anio,",fue ", indicador2,"."
					9:si dia<=30 Entonces
						Escribir "El ", dia," de Septiembre de ",anio,",fue ", indicador2,"."
					sino
						Escribir "Septiembre solo tiene 30 días."
					FinSi
					10:
						Escribir "El ", dia," de Octubre de ",anio,",fue ", indicador2, "."
					11:si dia<=30 Entonces
						Escribir "El ", dia," de Noviembre de ",anio,",fue ",indicador2,"."
					SiNo
						Escribir "Noviembre solo tiene 30 días."
					FinSi
					12:
						Escribir "El ", dia," de Diciembre de ",anio,",fue ", indicador2,"."
				Fin Segun
			SiNo
				Escribir "Valor de día no válido."
			FinSi
		SiNo
			Escribir "Valor de mes no válido."
		FinSi
		
	sino
		Escribir "Valor de año no válido."
	FinSi
FinProceso
