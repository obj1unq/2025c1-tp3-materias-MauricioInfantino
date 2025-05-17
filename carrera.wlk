class Carrera{
    
    var property nombre
    const property materias = #{}

    method agregarMaterias(_materias) {
        self.validarMaterias(_materias)    
        materias.addAll(_materias)
    }

    method validarMaterias(_materias) {
        _materias.forEach({materia => self.perteneceACarrera(materia)})
    }

    method perteneceACarrera(materia) {
        if(materia.carrera() != self){
            self.error("La materia "+ materia.nombre() + "no pertenece a la carrera "+ self.nombre())
        }
    }

}