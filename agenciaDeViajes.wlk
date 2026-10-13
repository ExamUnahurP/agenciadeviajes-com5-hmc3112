// ============ Packs ============

class Pack {
  const property duracion
  const property precioBase
  const property beneficios = []
  var property coordinador

  method beneficiosVigentes() = beneficios.filter({ beneficio => beneficio.vigente() })

  method costoBeneficiosVigentes() = self.beneficiosVigentes().sum({ beneficio => beneficio.costo() })

  method subtotal() = precioBase + self.costoBeneficiosVigentes()

  method valorFinal() = self.subtotal() + self.recargo()

  method recargo();

  method esPremium();
}

class PackNacional inherits Pack {
  const property provincia
  const property actividades = []

  override method recargo() = 0

  override method esPremium() = duracion > 10 && coordinador.altamenteCalificado()
}

class PackInternacional inherits Pack {
  const property pais
  const property cantidadEscalas
  const property esLugarDeInteres

  override method recargo() = self.subtotal() * 0.2

  override method esPremium() = esLugarDeInteres && duracion > 20 && cantidadEscalas == 0
}

class PackProvincial inherits PackNacional {
  const property cantidadCiudades

  override method recargo() = if (self.esPremium()) self.subtotal() * 0.05 else 0

  override method esPremium() =
    actividades.size() >= 4 && cantidadCiudades > 5 && self.beneficiosVigentes().size() >= 3
}

// ============ Beneficios ============

class Beneficio {
  const property tipo
  const property costo
  var property vigente = true
}

// ============ Coordinadores ============

class Coordinador {
  var property viajesRealizados
  var property motivado
  var property aniosExperiencia
  var rol

  method initialize() {
    self.validarRol(rol)
  }

  method rol() = rol

  method rol(nuevoRol) {
    self.validarRol(nuevoRol)
    rol = nuevoRol
  }

  method validarRol(unRol) {
    if (!roles.validos().contains(unRol)) {
      throw new DomainException(message = "El rol asignado no es válido")
    }
  }

  method altamenteCalificado() = viajesRealizados > 20 && rol.cumpleCondicion(self)
}

// ============ Roles ============

object roles {
  method validos() = [guia, asistenteLogistico, acompaniante]
}

object guia {
  method cumpleCondicion(coordinador) = coordinador.motivado()
}

object asistenteLogistico {
  method cumpleCondicion(coordinador) = coordinador.aniosExperiencia() >= 3
}

object acompaniante {
  method cumpleCondicion(coordinador) = true
}






