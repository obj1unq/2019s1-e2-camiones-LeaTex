import cosas.*

object camion {
	const property cosas = []
	const tara = 1000
	const pesoMaximo = 2500
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
		unaCosa.reaccionar()
	}
	method descargar(unaCosa) {
		cosas.remove(unaCosa)
	}
	method pesoTotal() {
		return tara + cosas.sum({cosa => cosa.peso() })
	}
	method excedidoDePeso() {
		return self.pesoTotal() > pesoMaximo
	}
	method objetosPeligrosos(nivel) {
		return cosas.filter({cosa => cosa.nivelPeligrosidad() > nivel})
	}
	method objetosMasPeligrososQue(unaCosa) {
		return cosas.filter({cosa => cosa.nivelPeligrosidad() > unaCosa.nivelPeligrosidad() })
	}
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		// return cosas.all({cosa => cosa.nivelPeligrosidad() <= nivelMaximoPeligrosidad})
		return not(cosas.any({cosa => cosa.nivelPeligrosidad() > nivelMaximoPeligrosidad}))
	}
	
	// agregados al camión
	method tieneAlgoQuePesaEntre(min, max) {
		// se supone min <= max
		return cosas.any({ cosa => cosa.peso().between(min, max) })		
	}
	method cosaMasPesada() {
		return if (cosas.isEmpty()) { null } else { cosas.max({ cosa => cosa.peso() }) }
	}
	method totalBultos() {
		return if (cosas.isEmpty()) { 0 } else { cosas.sum({ cosa => cosa.bultos() }) }
	}
	method pesos() {
		return cosas.map({ cosa => cosa.peso() })
	}
}
