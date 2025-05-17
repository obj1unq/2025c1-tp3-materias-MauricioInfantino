class Criterio{

    method estaHabilitado(estudiante, materia) 
} 



object porCorrelativas inherits Criterio {

    override method estaHabilitado(estudiante, materia) {
        return estudiante.cumpleRequisitos(materia)
    }
}

object porCreditos inherits Criterio {
  
    override method estaHabilitado(estudiante, materia) {
        materia.tieneCreditosSuficientes(estudiante)
    }
}

object porAño inherits Criterio {

    override method estaHabilitado(estudiante, materia) {
        return estudiante.aproboTodasLasMateriasDelAñoAnterior(materia.año())
    }
}

object libre inherits Criterio {

    override method estaHabilitado(estudiante, materia) {
        return true
    }
  
}