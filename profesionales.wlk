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
}

class Universidad {
    const provincia
    const honorariosRecomendados

    method provincia() = provincia
    method honorariosRecomendados() = honorariosRecomendados
}

class ProfesionalVinculado inherits Profesional {
    override method provinciasHabilitadas() {
      [universidad.provincia()]
    }

    override method honorarioPorHora() {
        return universidad.honorariosRecomendados()
    }
}

class ProfesionalAsociado inherits Profesional {
    override method provinciasHabilitadas() {
        ["Entre Rios" , "Santa Fe" , "Corrientes"]
    }

    override method honorarioPorHora() = 3000
}

class ProfesionalLibre inherits Profesional {
    const honorario
    const provincias = []

    override method provinciasHabilitadas() = provincias

    override method honorarioPorHora() = honorario
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
}