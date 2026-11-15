#Grupo: 6.
#Nombre del archivo: GenioyFigura.py
#descripción: Algoritmo que imprime dferentes figuras con dimensiones personalizadas y con símbolos proporcionados.
#Autor: Eduardo Emiliano Aguirre Toledo y Juan Pablo Salcido Valenzuela.
#Fecha: 04/11/26.

#Función que dibuja el reloj de arena.
def Reloj(Dimensión:int,simbolo:str):
    """Dibuja un reloj de arena con la dimensión y símbolo proporcionados.

    Parámetros:
    
        Dimensión: Entero que dará altura y ancho al reloj de arena.
        
        Símbolo: Un símbolo que proporcionará el usuario y con el que se dibujará la figura.
        
    No retorna valores.
    
    Ejemplos:
        >>>Reloj (5,*)
        Lleno:
        
        *****
         ***
          *
         ***
        *****
        hueco:
        
        *****
         * *
          *
         * *
        *****
        >>> Reloj (7,*)
        
       *******
        *****
         ***
          *
         ***
        *****
       *******
       
       *******
        *   *
         * *
          *
         * *
        *   *
       *******
       Traceback (most recent call last):
        ...
        ValueError: El argumento Dimensión debe ser entero.
        TypeError: Tiene que ser una cadena de caracteres.
    """
    #Checa que no hayan excepciones y así poder ejecutar la función.
    if not isinstance(Dimensión,int):
        raise ValueError("El argumento altura debe ser entero.")
    
    if not isinstance(simbolo,str):
        raise TypeError("Tiene que ser cadena de caracteres.")
    
    if len(simbolo)!=1:
        raise ValueError("Tiene que ser un caracter.")
    
    if Dimensión<5 or Dimensión>15 or Dimensión%2==0:
        raise ValueError("Valores no aceptables")
    
    print()    
    print("lleno:")
    print()
    #Se calculan los espacios para después imprimir la cantidad de caracteres.
    for i in range(Dimensión//2):
        print(" " * (i) + simbolo * (Dimensión-2*i))
    #Hace lo mismo que lo de arriba pero pero lo hace a la inversa.
    for i in range (Dimensión//2,-1,-1):
        print(" "* (i)+ simbolo * (Dimensión-2*i))
    print()
    print("Hueco:")
    print()
    #Se imprime la "tapa" del reloj de arena
    print(simbolo * Dimensión)
    #Se hace la primera mitad del reloj, se calculan los espacios y además cálcula los huecos dentro del reloj.
    for i in range(Dimensión//2-1):
        print(" " * (i+1) + simbolo + " " * (Dimensión-2-i*2-2) + simbolo)
    #Se hace la segunda mitad del reloj, se calculan los espacios y también cálcula los huecos dentro del reloj, para después, imprimir el fondo del reloj.
    for i in range(Dimensión//2):
        if i==0:
            print(" " * (Dimensión//2) + simbolo)
        else:
            print(" " * (Dimensión//2-i) + simbolo + " " * (i*2-1) + simbolo)
    print(simbolo * Dimensión)
    
    print()
#############################################################################
#Función del rombo.
def Rombo(Dimensión:int, simbolo:str):
    """Dibuja un rombo con la dimensión y símbolo proporcionados.

    Parámetros:
    
        Dimensión: Entero que dará altura y ancho al rombo.
        
        Símbolo: Un símbolo que proporcionará el usuario y con el que se dibujará la figura.
        
    No retorna valores.
    
    Ejemplos:
        >>> Rombo(9,?)
        Lleno:

            ?
           ???
          ?????
         ???????
        ?????????
         ???????
          ?????
           ???
            ?

        Hueco:

            ?
           ? ?
          ?   ?
         ?     ?
        ?       ?
         ?     ?
          ?   ?
           ? ?
            ?
       Traceback (most recent call last):
        ...
        ValueError: El argumento Dimensión debe ser entero.
        TypeError: Tiene que ser una cadena de caracteres. 
    """
    #Revisa que no hayan excepciones y así poder ejecutar la función.
    if not isinstance(Dimensión,int):
        raise ValueError("El argumento altura debe ser entero.")
    
    if not isinstance(simbolo,str):
        raise TypeError("Tiene que ser cadena de caracteres.")
    
    if len(simbolo)!=1:
        raise ValueError("Tiene que ser un caracter.")
    
    if Dimensión<5 or Dimensión>15 or Dimensión%2==0:
        raise ValueError("Valores no aceptables")
    print()
    print("Lleno:")
    print()
    #Se calculan los espacios y después imprime el símbolo de forma impar hacia abajo.
    for i in range(Dimensión//2):
        print(" " * (Dimensión - i - 1) + simbolo * (2*i + 1))
    #Se termina de imprimir la figura, empezando por la mitad, se calculan los espacios y se imprime hasta 1.
    for i in range(Dimensión//2, -1, -1):
        print(" " * (Dimensión - i - 1) + simbolo * (2*i + 1))
    print()
    print("Hueco:")
    print()
    #Similar al anterior, pero primero se imprime la punta de la misma manera que el ciclo pasado, después se imprime los asteriscos junto con los huecos correspondientes, hasta el cero, que se imprime la otra punta calculando los espacios y colocando un símbolo. 
    for i in range(Dimensión//2):
        if i==0:
            print(" " * (Dimensión - i - 1) + simbolo * (2*i + 1))
        else:
            print(" " * (Dimensión - i -1) + simbolo +" "* (2*i-1)+ simbolo)

    
    for i in range(Dimensión//2, -1, -1):
        if i>0:
            print(" " * (Dimensión - i - 1) + simbolo + " " * (2*i -1)+ simbolo)
        else:
            print(" " * (Dimensión - i - 1)+ simbolo )
    print()
##############################################################################
#Función del moño.
def Moño(Dimensión:int,simbolo:str):
    """Dibuja un moño con la dimensión y símbolo proporcionados.

    Parámetros:
    
        Dimensión: Entero que dará altura y ancho al moño.
        
        Símbolo: Un símbolo que proporcionará el usuario y con el que se dibujará la figura.
        
    No retorna valores.
    
    Ejemplos:
        >>>Moño(7,$)
        Lleno:
    
        $     $
        $$   $$
        $$$ $$$
        $$$$$$$
        $$$ $$$
        $$   $$
        $     $

        Hueco:

        $     $
        $$   $$
        $ $ $ $
        $  $  $
        $ $ $ $
        $$   $$
        $     $
        Traceback (most recent call last):
        ...
        ValueError: El argumento Dimensión debe ser entero.
        TypeError: Tiene que ser una cadena de caracteres.
    """
    # Checa que no hayan excepciones y así poder ejecutar la función.
    if not isinstance(Dimensión,int):
        raise ValueError("El argumento altura debe ser entero.")
    
    if not isinstance(simbolo,str):
        raise TypeError("Tiene que ser cadena de caracteres.")
    
    if len(simbolo)!=1:
        raise ValueError("Tiene que ser un caracter.")
    
    if Dimensión<5 or Dimensión>15 or Dimensión%2==0:
        raise ValueError("Valores no aceptables")
    print()
    print("Lleno:")
    print()
    #Primero se imprimirán los símbolos, se darán espacios y se volveran a colocar los símbolos, hasta antes de la mitad.
    for i in range(Dimensión//2):
        print(simbolo * (i+1) + " " * (Dimensión-2-i*2) + simbolo * (i+1))
    #Se imprime la mitad del moño.
    print(simbolo*Dimensión)
    #Se imprime el restante del moño, primero siendo los símbolos, luego espacios y símbolos nuevamente
    for i in range (Dimensión//2):
        print(simbolo*(Dimensión//2-i) + " " *(2*i+1) + simbolo*(Dimensión//2-i))
    print()
    print("Hueco:")
    print()
    #Nuevamente empiezan con el símbolo, pero, la primera línea del moño se imprimirá de la misma forma que el ciclo anterior.
    for i in range(Dimensión//2):
        if i==0:
            print(simbolo * (i+1) + " " * (Dimensión-2-i*2) + simbolo * (i+1))
    #Una vez impresa, se irán intercalando entre, simbolo, hueco, símbolo para imprimir la primera mitad del moño hueco.
        else:
            print(simbolo +" " * (i-1)+ simbolo + " " * (Dimensión-2-i*2) + simbolo +" "*(i-1)+ simbolo)
    #Se imprime la mitad del moño, nuevamente, intercalando el símbolo y el cálculo de los espacios.
    print(simbolo + " "*(Dimensión//2-1)+simbolo+" "*(Dimensión//2-1)+ simbolo)
    #Se imprime la segunda mitad del moño de una manera similar a la primera, pero en la última línea, se imprime el símbolo, sus espacios y el otro símbolo. 
    for i in range (Dimensión//2):
        if i<Dimensión//2-1:
            print(simbolo + " " *(Dimensión//2-i-2)+ simbolo + " " *(2*i+1) + simbolo + " "*(Dimensión//2-i-2)+ simbolo)
        else:
            print(simbolo * (Dimensión//2-i) + " " *(2*i+1) + simbolo *(Dimensión//2-i))
    print()
##############################################################################
#Función de la copa.
def Copa (Dimensión:int,simbolo:str):
    """Dibuja una copa con la dimensión y símbolo proporcionados.

    Parámetros:
    
        Dimensión: Entero que dará altura y ancho a la copa.
        
        Símbolo: Un símbolo que proporcionará el usuario y con el que se dibujará la figura.
        
    No retorna valores.
    
    Ejemplos:
        >>>Copa (5,=)
        
        Llena: 

        =====
         ===
          =
          =
        =====

        Hueca: 

        =====
         = =
          =
          =
        =====
        Traceback (most recent call last):
        ...
        ValueError: El argumento Dimensión debe ser entero.
        TypeError: Tiene que ser una cadena de caracteres.
    """
    #Checa que no hayan excepciones y así poder ejecutar la función.
    if not isinstance(Dimensión,int):
        raise ValueError("El argumento Dimensión debe ser entero.")
    
    if not isinstance(simbolo,str):
        raise TypeError("Tiene que ser cadena de caracteres.")
    
    if len(simbolo)!=1:
        raise ValueError("Tiene que ser un caracter.")
    
    if Dimensión<5 or Dimensión>15 or Dimensión%2==0:
        raise ValueError("Valores no aceptables.")
    
    print()
    print("Llena: ")
    print()
    #Se imprimen los espacios y luego los símbolos de forma decreciente y descendiente.
    for i in range(Dimensión//2):
        print(" " * (i) + simbolo * (Dimensión-2*i))
    #Se imprime el tallo de la copa hasta antes de imprimir la base.
    for i in range (Dimensión//2,0,-1):
        print(" " * (Dimensión//2)+ simbolo)
    #Se imprime la base de la copa con la dimensión proporcionada
    print(simbolo*Dimensión)
    print()
    print("Hueca: ")
    print()
    #Se imprime primero la boquilla de la copa
    print(simbolo * Dimensión)
    #Se imprimen los espacios y el símbolo, se vuelven a imprimir espacios y se imprime el símbolo.
    for i in range(Dimensión//2 - 1):
        print(" " * (i+1) + simbolo + " " * (Dimensión-2-i*2-2) + simbolo)
    #Esta parte es exactamente igual a la parte de abajo de la copa llena.
    for i in range (Dimensión//2,0,-1):
        print(" " * (Dimensión//2)+ simbolo)
    print(simbolo*Dimensión)
    print()
##############################################################################
#Función que llama a las demás.
def Todas(Dimensión:int,simbolo:str):
    """Llama a todas las funciones para imprimir todas las figuras.

    Parámetros:
    
        Dimensión: Entero que dará altura y ancho a la copa.
        
        Símbolo: Un símbolo que proporcionará el usuario y con el que se dibujará la figura.
        
    No retorna valores.
    Traceback (most recent call last):
    ...
    ValueError: El argumento Dimensión debe ser entero.
    TypeError: Tiene que ser una cadena de caracteres.
    """
    #Checa que no hayan excepciones y así poder ejecutar la función.
    if not isinstance(Dimensión,int):
        raise ValueError("El argumento Dimensión debe ser entero.")
    
    if not isinstance(simbolo,str):
        raise TypeError("Tiene que ser cadena de caracteres.")
    
    if len(simbolo)!=1:
        raise ValueError("Tiene que ser un caracter.")
    
    if Dimensión<5 or Dimensión>15 or Dimensión%2==0:
        raise ValueError("Valores no aceptables")
    #Se llaman a todas las funciones.
    Reloj(Dimensión, simbolo)
    Rombo(Dimensión, simbolo)
    Moño(Dimensión, simbolo)
    Copa(Dimensión, simbolo)
    #Al final debería imprimir todas las figuras con su dimensión y símbolo respectivamente.
##############################################################################
print("Algoritmo que imprime dferentes figuras con dimensiones personalizadas y con símbolos proporcionados.")
#Se empieza un ciclo, que no acabará hasta que la "eleccion" sea 0.
while True:
    eleccion= int(input("""Elige del 0 al 5:
0: Para salir del programa.
1: Para dibujar un reloj de arena.
2: Para dibujar un rombo.
3: Para dibujar un moño.
4: Para dibujar una copa.
5: Dibujar todas.
Eleccion: """))
    #Se válida que la respuesta para la elección sea de las disponibles.
    while eleccion<0 or eleccion>5:
        eleccion= int(input("Valor que no se puede tomar, por favor, elija del 0 al 5: "))
    #Si la elección es 0 se acaba el programa.
    if eleccion == 0:
        print("Gracias por usar el programa.")
        break

    #Si la elección es 1, se dibujará un reloj de arena.
    if eleccion==1:
        Dimensión=int(input("seleccione la dimensión de la figura de 5 al 15, impar: "))
    #Se válida que la dimensión no sobrepase los límites    
        while Dimensión<5 or Dimensión >15 or Dimensión%2==0:
            Dimensión=int(input("por favor, elija un número mayor o igual 5 al 15, impar: "))
    #Se toma un símbolo        
        simbolo = input("Coloque un caracter especial: ")
    #Se válida que sea 1 y no varios o ninguno.    
        while len(simbolo)!=1:
            simbolo =input("Por favor coloque solo un caracter: ")
    #Se llama a la función para que dibuje el reloj.     
        Reloj(Dimensión,simbolo)

    # Se dibujará un rombo.    
    if eleccion==2:
        Dimensión=int(input("seleccione la dimensión de la figura del 5 al 15, impar: "))
    #Se válida que la dimensión sea correcta.   
        while Dimensión<5 or Dimensión>15 or Dimensión%2==0:
            Dimensión=int(input("por favor, elija un número mayor o igual a 5 al 15, impar: "))
            
        simbolo = input("Coloque un caracter especial: ")
    #Se válida que sea un símbolo y solo uno.    
        while len(simbolo)!=1:
            simbolo =input("Por favor coloque solo un caracter: ")
    #Se llama a la función para dibujar un rombo        
        Rombo(Dimensión,simbolo)

    #Se imprimirá un moño.    
    if eleccion==3:
        Dimensión=int(input("seleccione la dimensión de la figura de 5 al 15, números impares: "))
    #Se válida que la dimensión sea correcta.    
        while Dimensión<5 or Dimensión>15 or Dimensión%2==0:        
            Dimensión=int(input("por favor, elija un número mayor o igual a 5 al 15, número impar: "))
            
        simbolo = input("Coloque un caracter especial: ")
    #Se válida que solo sea un caracter.    
        while len(simbolo)!=1:
            simbolo = input("Por favor coloque solo un caracter: ")
        Moño(Dimensión,simbolo)

    #Se va a imprimir una copa.    
    if eleccion==4:
        Dimensión=int(input("seleccione la dimensión de la figura del 5 al 15, impar: "))
    #Se válida la Dimensión.    
        while Dimensión<5 or Dimensión>15 or Dimensión%2==0:
            Dimensión=int(input("por favor, elija un número mayor o igual de 5 al 15, impar: "))
            
        simbolo = input("Coloque un caracter especial: ")
    #Se válida la longitud de caracteres.
        while len(simbolo)!=1:
            simbolo =input("Por favor coloque solo un caracter: ")
    #Se llama a la función.        
        Copa(Dimensión, simbolo)
        

    #Se imprimirán todas las figuras.
    if eleccion==5:
        Dimensión=int(input("seleccione la dimensión de la figura del 5 al 15, impar: "))
    #Se válida la dimensión.
        while Dimensión<5 or Dimensión>15 or Dimensión%2==0:
            Dimensión=int(input("por favor, elija un número mayor o igual de 5 al 15, impar: "))
        
        simbolo = input("Coloque un caracter especial: ")
    #Se válida la longitud.
        while len(simbolo)!=1:
            simbolo =input("Por favor coloque solo un caracter: ")
    #Se llama a la función que le llama a las demás funciones.
        Todas(Dimensión,simbolo)



    