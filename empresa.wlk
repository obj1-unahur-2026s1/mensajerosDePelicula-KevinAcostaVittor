import destinos.*
import mensajeros.*
import paquetes.*

object mensajeria{
    const mensajeros = []
    const paquetesPendientes = []
    const paquetesEnviados = []

    method mensajeros() = mensajeros

    method contratarMensajero(mensajero) = if (!mensajeros.contains(mensajero)) mensajeros.add(mensajero)

    method despedirMensajero(mensajero) = mensajeros.remove(mensajero)

    method despedirTodosMensajeros()= mensajeros.clear()

    method esGrande() = mensajeros.size() > 2

    method primerEmpleadoPuedeEntregar() = if (!mensajeros.isEmpty()) { paquete.puedeSerEntregadoPor(mensajeros.first()) }
    
    method pesoUltimoMensajero() = if (!mensajeros.isEmpty()) { mensajeros.last().peso() }

    // Parte 3

    method paquetesPendientes() = paquetesPendientes

    method agregarPaquetePendiente(paquete) = paquetesPendientes.add(paquete)

    method quitarPaquetePendiente(paquete) = if (paquetesPendientes.contains(paquete)) paquetesPendientes.remove(paquete)

    method paquetesEnviados() = paquetesEnviados

    method algunMensajeroPuedeEntregar(paquete) = mensajeros.any( {m => paquete.puedeSerEntregadoPor(m)} )

    method mensajerosQuePuedenEntregar(paquete) = mensajeros.filter( {m => paquete.puedeSerEntregadoPor(m)} )

    method tieneSobrepeso() = self.pesoPromedio() > 500

    method pesoPromedio() = mensajeros.sum({m => m.peso()}) / mensajeros.size()

    method enviarPaquete(paquete) {
        const aptos = self.mensajerosQuePuedenEntregar(paquete)

        if (aptos.isEmpty()){
            self.agregarPaquetePendiente(paquete)
        } else {
            aptos.anyOne()
            paquetesEnviados.add(paquete)

            self.quitarPaquetePendiente(paquete)
            // De paquetePendiente pasa a ser paqueteEnviado en caso de enviarse
        }
    }

    method facturacion() = paquetesEnviados.sum( {p => p.precio()} )

    method enviarPaquetes(paquetes) { paquetes.forEach( {p => self.enviarPaquete(p)} ) }

    method enviarPaquetePendienteMasCaro() { self.enviarPaquete(self.paquetePendienteMasCaro()) }

    method paquetePendienteMasCaro() = paquetesPendientes.max( {p => p.precio()} )
}