import mensajeros.*
import destinos.*

object paquete{
    var estaPago = true
    var destino = puenteBrooklyn

    method puedeSerEntregadoPor(mensajero) = destino.dejaEntrar(mensajero) && estaPago

    method estaPago() = estaPago

    method fuePago() { estaPago = true }

    method noFuePago() { estaPago = false }

    method precio() = 50

    method cambiarDestinoA(nuevoDestino) { destino = nuevoDestino }
}

object paquetito{
    var destino = puenteBrooklyn

    method estaPago() = true // Siempre está pago

    method puedeSerEntregadoPor(mensajero) = self.estaPago()

    method precio() = 0

    method cambiarDestinoA(nuevoDestino) { destino = nuevoDestino }
}

object paquetonViajero{
    var estaPago = true
    const destinos = []
    var montoPago = 0

    method puedeSerEntregadoPor(mensajero) = self.puedePasarTodosDestinos(mensajero) && estaPago

    method puedePasarTodosDestinos(mensajero) = destinos.all( {d => d.dejaEntrar(mensajero)} )

    method estaPago() = montoPago >= self.precio()

    method fuePago() { estaPago = true }

    method noFuePago() { estaPago = false }

    method pagar(cantidad) { montoPago += cantidad }

    method precio() = 100 * destinos.size()

    method agregarDestino(destino) = destinos.add(destino)

    method quitarDestino(destino) = destinos.remove(destino)
}