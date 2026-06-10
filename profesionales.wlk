class Profesional {
    var universidad

    method estudioEn(unaUniversidad) {
        universidad = unaUniversidad
    }

    method puedeTrabajarEn(provincia) {
        self.provincias().contains(provincia)
    }

    method honorarios()
    method provincias()
    method cobrar(monto)
}

class Universidad {
    var provincia
    var honorariosRecomendados

   // method honorariosRecomendados() = honorariosRecomendados

}

class ProfesionalVinculado inherits Profesional {

    override method honorarios() {
        universidad.honorariosRecomendados()
    }

    override method provincias() {
        #{universidad.provincia()}
    }

    override method cobrar
}