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

    method algunMensajeroPuedeEntregar(paquete) = mensajeros.any( {m => paquete.puedeSerEntregadoPor(m)} )

    method mensajerosQuePuedenEntregar(paquete) = mensajeros.filter( {m => paquete.puedeSerEntregadoPor(m)} )

    method tieneSobrepeso() = self.pesoPromedio() > 500

    method pesoPromedio() = mensajeros.sum({m => m.peso()}) / mensajeros.size()

    method enviarPaquete(paquete) {
        const aptos = self.mensajerosQuePuedenEntregar(paquete)

        if (!aptos.isEmpty()){
            const mensajeroElegido = aptos.anyOne()
            
            paquetesEnviados.add(paquete)
        } else {
            paquetesPendientes.add(paquete)
        }
    }
    method facturacion() = paquetesEnviados.sum({p => p.precio()})
}