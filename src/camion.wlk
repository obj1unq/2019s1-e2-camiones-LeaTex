import cosas.*

object camion {
	const property cosas = []
	const tara = 1000
	const pesoMaximo = 2500
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
		unaCosa.reaccionar()
	}
	method descagar(unaCosa) {
		cosas.remove(unaCosa)
	}
	method pesoTotal() {
		return tara + cosas.sum({cosa => cosa.peso() })
	}
	method exedidoDePeos() {
		return self.pesoTotal() > pesoMaximo
	}
	method objetosPeligrosos(nivel) {
		return cosas.filter({cosa => cosa.nivelPeligrosidad() > nivel})
	}
	method objetosMasPeligrososQue(unaCosa) {
		return cosas.filter({cosa => cosa.nivelPeligrosidad() > unaCosa.nivelPeligrosidad() })
	}
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return cosas.all({cosa => cosa.nivelPeligrosidad() <= nivelMaximoPeligrosidad})
		// return not(osas.any({cosa => cosa.nivelPeligrosidad() > nivelMaximoPeligrosidad}))
	}
	
	// agregados al camión
	method tieneAlgoQuePesaEntre(min, max) {
		// se supone min <= max
		return cosas.any({ cosa => cosa.peso().between(min, max) })		
	}
	method cosaMasPesada() {
		return cosas.max({ cosa => cosa.peso() })
	}
	method totalBultos() {
		return cosas.sum({ cosa => cosa.bultos() })
	}
	method pesos() {
		return cosas.map({ cosa => cosa.peso() })
	}
}
