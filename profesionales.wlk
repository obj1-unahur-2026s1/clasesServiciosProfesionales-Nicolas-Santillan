class Profesional {
    
    var universidad

    method universidad() = universidad

    method universidad(unaUniversidad){
        universidad = unaUniversidad
    }
    method estudioEn(unaUniversidad) {
        return universidad == unaUniversidad
    }
    method honorarioPorHora()
    method provinciasHabilitadas()
    method cobrar(unImporte)
}

class Universidad {
    const provincia
    const honorariosRecomendados
    var donacionesRecibidas = 0

    method provincia() = provincia
    method honorariosRecomendados() = honorariosRecomendados
    method recibirDonacion(unImporte) {
        donacionesRecibidas += unImporte
    }
}

class ProfesionalVinculado inherits Profesional {
    override method provinciasHabilitadas() {
      [universidad.provincia()]
    }

    override method honorarioPorHora() {
        return universidad.honorariosRecomendados()
    }

    override method cobrar(unImporte) {
        universidad.recibirDonacion(unImporte / 2)
    }
}

class ProfesionalAsociado inherits Profesional {
    override method provinciasHabilitadas() {
        ["Entre Rios" , "Santa Fe" , "Corrientes"]
    }

    override method honorarioPorHora() = 3000

    override method cobrar(unImporte) {
        asociacion.sumarRecaudacion(unImporte)
    }
}

class ProfesionalLibre inherits Profesional {
    const honorario
    const provincias = []
    var totalRecaudado = 0

    override method provinciasHabilitadas() = provincias

    override method honorarioPorHora() = honorario

    override method cobrar(unImporte) {
      totalRecaudado += unImporte
    }

    method pasarDinero(unImporte, unProfesional) {
        totalRecaudado -= unImporte
        unProfesional.cobrar(unImporte)
    }
}

class Empresa {
    var property profesionales = []
    const honorarioReferencia

    method profesionalesQueEstudiaronEn(unaUniversidad) {
        return profesionales.count({p => p.estudioEn(unaUniversidad)})
    }
    method profesionalesCaros() {
        return profesionales.filter({p => p.honorarioPorHora() > honorarioReferencia})
    }
    method universidadesFormadoras() {
        return profesionales.map({p => p.universidad()}).asSet()
    }
    method profesionalMasBarato() {
        return profesionales.min({p => p.honorarioPorHora()})
    }
    method esDeGenteAcotada() {
        return profesionales.all({p => p.provinciasHabilitadas() <= 3})
    }
    method puedeSatisfacerA(unSolicitante) {
        return unSolicitante.puedeSerAtendidoPor(profesionales)
    }
}

object asociacion {
    var totalRecaudado = 0

    method sumarRecaudacion(unImporte) {
        totalRecaudado += unImporte
    }
}