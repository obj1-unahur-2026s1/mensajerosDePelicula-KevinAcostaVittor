import mensajeros.*

object puenteBrooklyn{
    method dejaEntrar(mensajero) = mensajero.peso() <= 1000
}

object matrix{
    method dejaEntrar(mensajero) = mensajero.puedeLlamar()
}