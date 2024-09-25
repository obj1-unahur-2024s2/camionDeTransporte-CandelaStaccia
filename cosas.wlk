object knightRider {
    method peso() = 500
    method peligrosidad() = 10
    method bultos() = 1
    method consecuencia() {}
}

object bumblebee {
  var estado = auto

  method transformate(unEstado) {
    estado = unEstado
  } 

  method peso() = 800

  method peligrosidad() = estado.peligrosidad()

  method bultos() = 2

  method consecuencia() {
    estado = robot
  }
}

object auto {
  method peligrosidad() = 15
}

object robot {
  method peligrosidad() = 30
}

object paqueteLadrillos {
  var property cantidadLadrillos = 0

  method peso() = cantidadLadrillos * 2

  method peligrosidad() = 2 

  method bultos() {
    if(cantidadLadrillos.between(0, 100)) return 1
    if(cantidadLadrillos.between(101, 300)) return 2
    return 3
  }

  method consecuencia() {
    cantidadLadrillos = cantidadLadrillos + 12
  }
}

object arenaAGranel {
  var property peso = 0

  method peligrosidad() = 1 

  method bultos() = 1

  method consecuencia() {
    peso = 0.max(peso - 10)
  }
}

object bateriaAntiaerea {
  var tieneMisiles = false

  method peso() { // = if(tieneMisiles) 300 else 200
    if(tieneMisiles)
        return 300
    else
        return 200
  }

  method peligrosidad() { // = if(tieneMisiles) 100 else 0
    if(tieneMisiles)
        return 100
    else
        return 0
  }

  
  method cargar() {
    tieneMisiles = true
  }

  method descargar() {
    tieneMisiles = false
  }

  method bultos() {
    if(tieneMisiles) return 2
    return 1
  }

  method consecuencia() {
    self.cargar() 
  }
}

object contenedorPortuario {
  const property cosasAdentro = []

  method peso() = 100 + cosasAdentro.sum({c => c.peso()})

  method peligrosidad() {
    if(cosasAdentro.size() > 0) // not cosasAdentro.isEmpty()
        return cosasAdentro.max({c => c.peligrosidad()}).peligrosidad()
    else
        return 0
  }

/*
    if(cosasAdentro.isEmpty()) return 0
    return cosasAdentro.max({c => c.peligrosidad()}).peligrosidad()
*/

  method agregar(unaCosa) {
    cosasAdentro.add(unaCosa)
  }

  method bultos() {
    return 1 + cosasAdentro.sum({c => c.bultos()})
  }

  method consecuencia() {
    cosasAdentro.forEach({c => c.consecuencia()})
  }

}

object residuosRadioactivos {
  var property peso = 0

  method peligrosidad() = 200 

  method bultos() = 1

  method consecuencia() {
    peso = peso + 15
  }
}

object embalajeDeSeguridad {
  var property cosaEnvuelta = cosaNull // o uno random

  method peso() = cosaEnvuelta.peso()

  method peligrosidad() = cosaEnvuelta.peligrosidad() / 2  

  method bultos() = 2

  method consecuencia() {}

}

object cosaNull {
  method peso() = 0
  method peligrosidad() = 0
}