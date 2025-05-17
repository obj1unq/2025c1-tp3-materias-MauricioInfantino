class Estrategia{

    method seleccionarSiguiente(materia) 
}

object ordenada inherits Estrategia{
  
    override method seleccionarSiguiente(materia) {
        return materia.listaDeEspera().head()
    }
}

object elitista inherits Estrategia{

    override method seleccionarSiguiente(materia) {
        return materia.listaDeEspera().max({estudiante => estudiante.promedio()})
    }
}

object avance inherits Estrategia {

    override method seleccionarSiguiente(materia) {
        return materia.listaDeEspera().max({estudiante => estudiante.cantidadDeAprobadasDeLaCarrera(materia.carrera())})
    }
}