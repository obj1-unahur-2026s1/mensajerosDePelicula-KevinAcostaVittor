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
    var acoplados = 0

    method peso() = acoplados * 500

    method cantidadAcoplados() = acoplados
    method agregarAcoplados(cantidad) { acoplados += cantidad }
    method quitarAcoplados(cantidad) { acoplados -= cantidad }
}

object chuckNorris{
    method peso() = 80

    method puedeLlamar() = true
}

object neo{
    var tieneCredito = true

    method peso() = 0

    method puedeLlamar() = tieneCredito

    method cargarCredito(){ tieneCredito = true }

    method gastarCredito(){ tieneCredito = false }
}

object bart{
    var tieneSkate = true

    method peso() = 40 + skate.peso()

    method puedeLlamar() = tieneSkate // Alcanza telefono publico a tiempo usando ruedas

    method recuperarSkate() { tieneSkate = true }

    method perderSkate() { tieneSkate = false }
}

object skate{
    method peso() = 25
}