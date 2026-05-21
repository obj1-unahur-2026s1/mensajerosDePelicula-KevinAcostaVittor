import destinos.*

object roberto{
    var vehiculo = bicicleta
    var property pesoPropio = 90

    method peso() = pesoPropio + vehiculo.peso()
    
    method cambiarVehiculo(nuevoVehiculo){ vehiculo = nuevoVehiculo }

    method puedeLlamar() = false
}

object bicicleta{
    method peso() = 5
}

object camion{
    var acoplados = 1

    method peso() = acoplados * 500

    method cambiarCantidadAcoplados(nuevaCantidad){ acoplados = nuevaCantidad }
}

object chuckNorris{
    method peso() = 80

    method puedeLlamar() = true
}

object neo{
    var tieneCredito = true

    method peso() = 0

    method puedeLlamar(){ return tieneCredito }

    method cargarCredito(){ tieneCredito = true }

    method gastarCredito(){ tieneCredito = false }
}