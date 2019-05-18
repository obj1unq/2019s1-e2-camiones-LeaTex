object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bultos() { return 1 }
	method reaccionar() { /* do nothing */}
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	method bultos() { return 2 }
	method reaccionar() { if (transformadoEnAuto) self.transformar() }
}

object paqueteDeLadrillos {
	var cantidadLadrillos = 0
	method cantidadLadrillos(cantidad) {cantidadLadrillos = cantidad}
	method peso() { return 2 * cantidadLadrillos}
	method nivelPeligrosidad() { return 2 }
	method bultos() { return if (cantidadLadrillos <= 100) { 1 }
			else if (cantidadLadrillos.between(101, 300)) { 2 }
			else { 3 }
	}
	method reaccionar() { cantidadLadrillos += 12 }
}

object arenaAGranel {
	var peso = 0
	method peso(cantidad) {peso = cantidad}
	method peso() { return peso }
	method nivelPeligrosidad() { return 1 }
	method bultos() { return 1 }
	method reaccionar() { peso += 20 }
}

object bateriaAntiaerea {
	var tieneMisiles = false

	method peso() { return if (tieneMisiles) { 300 } else { 200 } }
	method nivelPeligrosidad() { return if (tieneMisiles) { 100 } else { 0 } }
	
	method lanzarMisiles() { tieneMisiles = false }
	method cargarMisiles() { tieneMisiles = true }
	
	method bultos() { return if (tieneMisiles) { 2 } else { 1 } }
	method reaccionar() { self.cargarMisiles() }
}

object contenedorPortuario {
	var cosas = []

	method peso() { return 100 + cosas.sum({cosa => cosa.peso() })}
	method nivelPeligrosidad() { return 
			if (cosas.isEmpty()) { 0 }
			else { cosas.map({ cosa => cosa.nivelPeligrosidad() }).max() }
	}
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}
	method bultos() { return 1 + cosas.sum({cosa => cosa.bultos() }) }
	method reaccionar() { cosas.forEach({ cosa => cosa.reaccionar() }) }
}

object residuosRadioactivos {
	var peso = 0
	method peso(cantidad) {peso = cantidad}
	method peso() { return peso }
	method nivelPeligrosidad() { return 200 }
	method bultos() { return 1 }
	method reaccionar() { peso += 15 }
}

object embalajeDeSeguridad {
	var cosaEmbalada
	
	method embalar(unaCosa) { cosaEmbalada = unaCosa }
	method peso() { return cosaEmbalada.peso() }
	method nivelPeligrosidad() { return cosaEmbalada.nivelPeligrosidad() / 2 }
	method bultos() { return 2 }
	method reaccionar() { /* do nothing */}
}