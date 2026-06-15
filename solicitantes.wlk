import profesionales.*

class Solicitante {
    method puedeSerAtendidoPor(unProfesional)
}

class Persona inherits Solicitante{
    var provincia

    method provincia() = provincia
    method asignarProvincia(unaProvincia) {
        provincia = unaProvincia
    }
    override method puedeSerAtendidoPor(unProfesional) {
        return unProfesional.provinciasHabilitadas() == provincia
    }

}

class Institucion inherits Solicitante {
    const universidades = []

    override method puedeSerAtendidoPor(unProfesional) {
        return universidades.contains(unProfesional.provinciasHabilitadas())
    }
}

class Club inherits Solicitante {
    const provincias = #{}

    override method puedeSerAtendidoPor(unProfesional) {
        return provincias.contains(unProfesional.provinciasHabilitadas())
    }
}