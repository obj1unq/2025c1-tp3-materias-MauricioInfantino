import estudiante.*

class Materia{
    
    var property nombre
    const property  cupo
    const property carrera
    const inscriptos = #{}
    const listaDeEspera = #{}
    const property requisitos
    const property creditosOtorgados
    const property creditosNecesarios
    const property año
    const property criterio
    const property estrategia

    method inscriptos() = inscriptos

    method listaDeEspera() = listaDeEspera

    method hayCupoDisponible() {
      return inscriptos.size() < cupo
    }

    method inscribir(estudiante) {
        self.validarInscripcion(estudiante)
        if(self.hayCupoDisponible()){
            inscriptos.add(estudiante)
        }
        else{
            listaDeEspera.add(estudiante)
        }
    }

    method validarInscripcion(estudiante) {
        if(not self.puedeInscribirse(estudiante)){
            self.error("El estudiante no puede inscribirse a la materia")
        }
    }

    method puedeInscribirse(estudiante) {
        return estudiante.estaEnCarrera(self) 
        and not estudiante.tieneAprobada(self) 
        and not self.estaInscripto(estudiante) 
        and criterio.estaHabilitado(estudiante,self)
    }

    method darDeBaja(estudiante) {
        inscriptos.remove(estudiante)
        self.validarListaDeEspera()
        inscriptos.add(listaDeEspera.asList().first())
        listaDeEspera.remove(listaDeEspera.asList().first())
    }

    method validarListaDeEspera() {
      if(listaDeEspera.isEmpty()){
        self.error("No hay alumnos en la lista de espera de "+ self.nombre() )
      }
    }

    method estaInscripto(estudiante) {
        return self.inscriptos().any({inscripto => inscripto == estudiante})
    }

    method enListaDeEspera(estudiante){
        return self.listaDeEspera().any({espera => espera == estudiante})
    } 

    method tieneCreditosSuficientes(estudiante) {
        return estudiante.creditosTotales() >= creditosNecesarios
    }

    method creditosOtorgados() {
        return creditosOtorgados
    }
}