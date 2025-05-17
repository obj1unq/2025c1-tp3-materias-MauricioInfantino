import materia.*
import aprobada.*

class Estudiante{

    var property nombre
    const carreras = #{}
    const aprobadas = #{}

    method aprobadas() = aprobadas

    method registrarAprobada(materia, nota) {
        self.validarAprobada(materia)
        aprobadas.add(new Aprobada(estudiante = self, materia = materia, nota = nota))
    }   

    method validarAprobada(materia) {
      if(self.tieneAprobada(materia)){
        self.error("El alumno ya tiene aprobada la materia" + materia.nombre())
      }
    }

    method tieneAprobada(materia) {
      return aprobadas.any({aprobada => aprobada.materia() == materia})
    }

    method cantidadAprobadas() {
        return aprobadas.size()
    }

    method promedio() {
        return aprobadas.average({aprobada => aprobada.nota()})
    }

    method materiasDeCarreras() {
        return carreras.flatMap({carrera => carrera.materias()})
    }

    method cumpleRequisitos(materia) {
      return materia.requisitos().all({requisito => self.tieneAprobada(requisito)})
    }

    method estaEnCarrera(materia) {
      return self.materiasDeCarreras().contains(materia)
    }

    method inscribirse(materia) {
        materia.inscribir(self)
    }

    method materiasEnLaQueEstaInscripto(){
        return self.materiasDeCarreras().filter({materia => materia.estaInscripto(self)})
    } 

    method materiasEnLaQueEstaEnListaDeEspera() {
        return self.materiasDeCarreras().filter({materia => materia.enListaDeEspera(self)})
    }

    method materiasEnLasQueSePuedeInscribir(carrera) {
        carrera.materias().filter({materia => materia.puedeInscribirse(self)})
    }

    method creditosTotales() {
        return aprobadas.sum({aprobada => aprobada.materia().creditosOtorgados()})
    }

    method aproboTodasLasMateriasDelAñoAnterior(año) {
        return self.materiasDelAñoAnterior(año).all{ materia => self.tieneAprobada(materia) }
    }

    method materiasDelAñoAnterior(año) {
      return self.materiasDeCarreras().filter({materia => materia.año() == año - 1})
    }

    method cantidadDeAprobadasDeCarrera(carrera) {
        self.materiasAprobadasDeLaCarrera(carrera).size()
    }

    method materiasAprobadasDeLaCarrera(carrera) {
        return carrera.materias().filter({materia => materia.tieneAprobada(materia)})
    }
}
