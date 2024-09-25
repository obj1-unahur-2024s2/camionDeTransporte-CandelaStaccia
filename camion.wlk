import cosas.*

object camion {
    const property cosas = []

    method cargar(unaCosa) {
        cosas.add(unaCosa)
        unaCosa.consecuencia()
    }

    method descargar(unaCosa) {
        cosas.remove(unaCosa)
    }

    method peso() = 1000 + cosas.sum({c => c.peso()})

    method lasCosasSonImpares() = cosas.all({c => c.peso().odd()}) //not cosas.any({c => c.peso().even()})

    method algoPesa(unValor) = cosas.any({c => c.peso() == unValor}) // not cosas.all({c => c.peso() != unValor})

    method cosaConPeligrosidad(unValor) = cosas.find({c => c.peligrosidad() == unValor})

    method cosasQueSuperanPeligrosidad(unValor) = cosas.filter({c => c.peligrosidad() > unValor})

    method cosasQueSuperanNivelDe(unaCosa) = self.cosasQueSuperanPeligrosidad(unaCosa.peligrosidad()) 
    //cosas.filter({c => c.peligrosidad() > unaCosa.peligrosidad()}) <-- asi hice yo
    //self.cosasQueSuperanPeligrosidad(unaCosa.peligrosidad()) <-- BIEN

    method estaExcedido() = self.peso() > 2500

    method puedeCircular(unNivelPeligrosidad) {
        return not self.estaExcedido() 
        and self.todasSonMenosPeligrosas(unNivelPeligrosidad)
    }

    method todasSonMenosPeligrosas(unNivelPeligrosidad) {
        return cosas.all({c => c.peligrosidad() < unNivelPeligrosidad})
    }

    method bultos() = cosas.sum({c => c.bultos()})
}