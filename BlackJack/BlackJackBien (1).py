# Nombre del archivo: BlackJackBien.py
# Grupo: 6
# Descripción: Simulación del juego de cartas BlackJack con interfaz gráfica en Tkinter.
# Autores: Eduardo Emiliano Aguirre Toledo y Juan Pablo Salcido Valenzuela.
# Fecha: 10/11/2026.
import random
import tkinter as tk

###################################################################
# CONFIGURACIÓN (puede cambiar los colores aquí.)
###################################################################
COLOR_FONDO = "#0b6b34"        # Verde del "tapete".
COLOR_TEXTO = "white"
COLOR_BOTON = "#f4d03f"
COLOR_CARTA = "white"
COLOR_REVERSO = "#1f3a93"
ANCHO_CARTA = 100
ALTO_CARTA = 140
PALOS = ('♥', '♦', '♣', '♠')
DENOMINACIONES = ('A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K')


###################################################################
# LÓGICA DEL JUEGO.
###################################################################
def Barajar(palos, denominaciones) -> list:
    """
    Crea una baraja de 52 cartas (tuplas denominación, palo) y la revuelve.
    Retorna: lista de 52 tuplas.
    """
    baraja = [(d, p) for p in palos for d in denominaciones]
    random.shuffle(baraja)
    return baraja


def Puntuación(mano: list) -> int:
    """
    Calcula los puntos de una mano. Los ases valen 11, pero se reducen
    a 1 las veces que haga falta para no pasarse de 21.
    """
    puntos = 0
    ases = 0
    for denominacion, _ in mano:
        if denominacion == 'A':
            puntos += 11
            ases += 1
        elif denominacion in ('J', 'Q', 'K'):
            puntos += 10
        else:
            puntos += int(denominacion)
    while puntos > 21 and ases > 0:
        puntos -= 10
        ases -= 1
    return puntos


def EsBlackjack(mano: list) -> bool:
    """Un blackjack natural son exactamente 2 cartas que suman 21."""
    return len(mano) == 2 and Puntuación(mano) == 21


###################################################################
# INTERFAZ GRÁFICA.
###################################################################
class BlackJackApp:
    def __init__(self, root: tk.Tk):
        self.root = root
        self.root.title("BlackJack - Grupo 6")
        self.root.configure(bg=COLOR_FONDO)
        self.root.resizable(False, False)

        self.baraja = []
        self.jugador = []
        self.dealer = []
        self.ronda_terminada = True
        self.ganadas = 0
        self.perdidas = 0
        self.empates = 0

        self._crear_widgets()
        self.nueva_partida()

    # ---------------------------------------------------------------
    def _crear_widgets(self):
        fuente_titulo = ("Arial", 14, "bold")

        tk.Label(self.root, text="BLACKJACK", bg=COLOR_FONDO, fg=COLOR_BOTON,
                 font=("Arial", 22, "bold")).pack(pady=(10, 0))

        self.lbl_marcador = tk.Label(self.root, text="", bg=COLOR_FONDO,
                                     fg=COLOR_TEXTO, font=("Arial", 10))
        self.lbl_marcador.pack()

        # Dealer, texto que le indicará al usuario quién es el contrincante.
        self.lbl_dealer = tk.Label(self.root, text="Dealer", bg=COLOR_FONDO,
                                   fg=COLOR_TEXTO, font=fuente_titulo)
        self.lbl_dealer.pack(pady=(10, 0))
        self.canvas_dealer = tk.Canvas(self.root, width=720, height=ALTO_CARTA + 20,
                                       bg=COLOR_FONDO, highlightthickness=0)
        self.canvas_dealer.pack(padx=20)

        # Mensaje central.
        self.lbl_mensaje = tk.Label(self.root, text="", bg=COLOR_FONDO,
                                    fg=COLOR_BOTON, font=("Arial", 16, "bold"))
        self.lbl_mensaje.pack(pady=8)

        # Jugador, el texto que indicará al usuario quién es.
        self.lbl_jugador = tk.Label(self.root, text="Jugador", bg=COLOR_FONDO,
                                    fg=COLOR_TEXTO, font=fuente_titulo)
        self.lbl_jugador.pack()
        self.canvas_jugador = tk.Canvas(self.root, width=720, height=ALTO_CARTA + 20,
                                        bg=COLOR_FONDO, highlightthickness=0)
        self.canvas_jugador.pack(padx=20)

        # Botones con los que interactuará el usuario.
        marco = tk.Frame(self.root, bg=COLOR_FONDO)
        marco.pack(pady=15)
        estilo = dict(font=("Arial", 12, "bold"), width=14, bg=COLOR_BOTON,
                      activebackground="#d4ac0d", relief="raised", bd=3)
        self.btn_nueva = tk.Button(marco, text="Partida nueva",
                                   command=self.nueva_partida, **estilo)
        self.btn_pedir = tk.Button(marco, text="Pedir carta",
                                   command=self.pedir_carta, **estilo)
        self.btn_plantarse = tk.Button(marco, text="Plantarse",
                                       command=self.plantarse, **estilo)
        self.btn_nueva.grid(row=0, column=0, padx=8)
        self.btn_pedir.grid(row=0, column=1, padx=8)
        self.btn_plantarse.grid(row=0, column=2, padx=8)

    # ---------------------------------------------------------------
    # Dibujo de cartas.
    # ---------------------------------------------------------------
    @staticmethod
    def _rect_redondeado(canvas, x1, y1, x2, y2, r, **kw):
        puntos = [x1 + r, y1, x2 - r, y1, x2, y1, x2, y1 + r,
                  x2, y2 - r, x2, y2, x2 - r, y2, x1 + r, y2,
                  x1, y2, x1, y2 - r, x1, y1 + r, x1, y1]
        return canvas.create_polygon(puntos, smooth=True, **kw)
    #Función que dibujará las cartas con una forma, color y el símbolo que le corresponde.
    def _dibujar_carta(self, canvas, x, y, carta, oculta=False):
        x2, y2 = x + ANCHO_CARTA, y + ALTO_CARTA
        if oculta:
            self._rect_redondeado(canvas, x, y, x2, y2, 12,
                                  fill=COLOR_REVERSO, outline="white", width=3)
            canvas.create_rectangle(x + 10, y + 10, x2 - 10, y2 - 10,
                                    outline="white", width=2)
            for i in range(x + 10, x2 - 10, 10):
                canvas.create_line(i, y + 10, i, y2 - 10, fill="#4a69bd")
            return

        denominacion, palo = carta
        color = "#c0392b" if palo in ('♥', '♦') else "#1c1c1c"
        self._rect_redondeado(canvas, x, y, x2, y2, 12,
                              fill=COLOR_CARTA, outline="#444444", width=2)
        # Esquina superior izquierda.
        canvas.create_text(x + 16, y + 20, text=denominacion, fill=color,
                           font=("Arial", 16, "bold"))
        canvas.create_text(x + 16, y + 40, text=palo, fill=color,
                           font=("Arial", 14))
        # Esquina inferior derecha de la carta.
        canvas.create_text(x2 - 16, y2 - 20, text=denominacion, fill=color,
                           font=("Arial", 16, "bold"))
        canvas.create_text(x2 - 16, y2 - 40, text=palo, fill=color,
                           font=("Arial", 14))
        # Símbolo central de la carta.
        canvas.create_text(x + ANCHO_CARTA // 2, y + ALTO_CARTA // 2, text=palo,
                           fill=color, font=("Arial", 40))

    def _dibujar_mano(self, canvas, mano, ocultar_segunda=False):
        canvas.delete("all")
        n = len(mano)
        ancho_canvas = int(canvas["width"])
        # Si hay muchas cartas, se enciman un poco para que quepan en la pantalla y que no se ve feo.
        separacion = min(ANCHO_CARTA + 12, (ancho_canvas - ANCHO_CARTA - 20) // max(n - 1, 1))
        total = ANCHO_CARTA + separacion * (n - 1)
        x0 = (ancho_canvas - total) // 2
        for i, carta in enumerate(mano):
            self._dibujar_carta(canvas, x0 + i * separacion, 10, carta,
                                oculta=(ocultar_segunda and i == 1))

    # ---------------------------------------------------------------
    # Actualización de la pantalla.
    # ---------------------------------------------------------------
    def _actualizar(self, mostrar_dealer: bool):
        self._dibujar_mano(self.canvas_jugador, self.jugador)
        self._dibujar_mano(self.canvas_dealer, self.dealer,
                           ocultar_segunda=not mostrar_dealer)
        self.lbl_jugador.config(text=f"Jugador: {Puntuación(self.jugador)} puntos")
        if mostrar_dealer:
            self.lbl_dealer.config(text=f"Dealer: {Puntuación(self.dealer)} puntos")
        else:
            self.lbl_dealer.config(text=f"Dealer: {Puntuación(self.dealer[:1])} + ?")
        self.lbl_marcador.config(
            text=f"Ganadas: {self.ganadas}   Perdidas: {self.perdidas}   Empates: {self.empates}")

    def _activar_botones(self, activos: bool):
        estado = "normal" if activos else "disabled"
        self.btn_pedir.config(state=estado)
        self.btn_plantarse.config(state=estado)

    def _terminar(self, mensaje: str, resultado: str):
        """resultado: 'g' ganó, 'p' perdió, 'e' empate."""
        self.ronda_terminada = True
        if resultado == 'g':
            self.ganadas += 1
        elif resultado == 'p':
            self.perdidas += 1
        else:
            self.empates += 1
        self.lbl_mensaje.config(text=mensaje)
        self._activar_botones(False)
        self.btn_nueva.config(state="normal")
        self._actualizar(mostrar_dealer=True)

    # ---------------------------------------------------------------
    # Acciones de los botones
    # ---------------------------------------------------------------
    def nueva_partida(self):
        self.baraja = Barajar(PALOS, DENOMINACIONES)
        self.jugador = [self.baraja.pop(), self.baraja.pop()]
        self.dealer = [self.baraja.pop(), self.baraja.pop()]
        self.ronda_terminada = False
        self.lbl_mensaje.config(text="")
        self._activar_botones(True)
        self._actualizar(mostrar_dealer=False)

        # Blackjack natural (solo en las primeras 2 cartas)
        nat_j, nat_d = EsBlackjack(self.jugador), EsBlackjack(self.dealer)
        if nat_j and nat_d:
            self._terminar("EMPATE, POR NATURAL.", 'e')
        elif nat_d:
            self._terminar("PERDISTE, EL DEALER HIZO BLACKJACK.", 'p')
        elif nat_j:
            self._terminar("¡GANASTE, BLACKJACK NATURAL!", 'g')

    def pedir_carta(self):
        if self.ronda_terminada:
            return
        self.jugador.append(self.baraja.pop())
        puntos = Puntuación(self.jugador)
        self._actualizar(mostrar_dealer=False)
        if puntos > 21:
            self._terminar("Perdiste, te pasaste de 21 puntos.", 'p')
        elif puntos == 21:
            self.plantarse()

    def plantarse(self):
        if self.ronda_terminada:
            return
        self._activar_botones(False)
        self.btn_nueva.config(state="disabled")
        self._actualizar(mostrar_dealer=True)
        self.root.after(700, self._turno_dealer)

    def _turno_dealer(self):
        """El Dealer pide carta (con una pausa) hasta llegar a 17 o más."""
        if Puntuación(self.dealer) < 17:
            self.dealer.append(self.baraja.pop())
            self._actualizar(mostrar_dealer=True)
            self.root.after(700, self._turno_dealer)
        else:
            self._resolver()

    def _resolver(self):
        pj, pd = Puntuación(self.jugador), Puntuación(self.dealer)
        if pd > 21:
            self._terminar("¡Ganaste, el Dealer se pasó de 21!", 'g')
        elif pd > pj:
            self._terminar("Perdiste, el Dealer tiene más puntos.", 'p')
        elif pd < pj:
            self._terminar("¡Ganaste, tienes más puntos que el Dealer!", 'g')
        else:
            self._terminar("Empate, no hubo ganador.", 'e')


###################################################################
if __name__ == "__main__":
    ventana = tk.Tk()
    BlackJackApp(ventana)
    ventana.mainloop()
