## ✈️ Sistema de Gestión de Packs de Viajes

La agencia de turismo **“Viajes sin Fronteras”** busca modernizar su sistema de gestión de packs de viajes. Con destinos en todo el mundo y una clientela muy variada, quieren desarrollar un sistema que les permita organizar, personalizar y mejorar sus servicios.

Por el momento, ofrecen dos tipos de packs: **nacionales** e **internacionales**. No se debe permitir crear un pack si no es de alguno de estos dos tipos.
De cada pack nos interesa saber la duración en días, precio base, todos sus beneficios especiales y su coordinador a cargo.

#### Packs Nacionales

Además, en los packs nacionales nos interesa saber la provincia destino, una lista de actividades incluídas. Cada actividad se representará con su nombre en formato de texto.

#### Packs Internacionales

Por otro lado, en los packs internacionales queremos también conocer el país de destino, la cantidad de escalas que se harán para llegar y si es un lugar de interés o no. 

---

## 👥 Coordinadores

Cada pack tiene un **coordinador**, quien se encarga de asistir al grupo durante el viaje. De cada coordinador nos interesa saber la cantidad de viajes realizados, si está motivado o no, los años de experiencia y su rol, que puede ser:  
  - 🧭 Guía  
  - 🧳 Asistente logístico  
  - 🤝 Acompañante

Cada coordinador puede cambiar de rol si la agencia lo solicita. En caso de que se quiera asignar un rol que no es uno de estos, el programa debe lanzar una excepción.

---

## 🎁 Beneficios especiales

Algunos packs cuentan con **beneficios opcionales**, como por ejemplo:

- Traslados privados
- Acceso a salas VIP
- Seguros adicionales

De cada beneficio nos interesa:

- Tipo, como los mencionados arriba, definidos como texto.
- Costo
- Si está vigente

---

## 📌 Requerimientos

---

### 1. Calcular el valor final de un pack

El valor final del pack se calcula a partir de su **precio base**. Luego se **suman los costos** de los beneficios vigentes. Si el pack es **internacional**, se aplica un **recargo del 20%** sobre el total final.

#### 🧪 Tests sugeridos

- Un pack nacional sin beneficios vigentes devuelve el mismo precio base.
- Un pack nacional con 2 beneficios vigentes suma correctamente sus costos al precio base.
- Un pack internacional sin beneficios vigentes calcula correctamente el total con el 20% de recargo.

---

### 2. Determinar si un coordinador está altamente calificado

Un coordinador es **altamente calificado** si:

- Tiene más de **20 viajes realizados**
- Y cumple según su rol:
  - **Guía**: tiene que estar motivado
  - **Asistente logístico**: tener al menos 3 años de experiencia
  - **Acompañante**: no tiene condiciones adicionales

#### 🧪 Tests sugeridos

- Un guía motivado con 21 viajes realizados es considerado altamente calificado.
- Un asistente logístico con menos de 3 años de experiencia no es calificado, aunque tenga muchos viajes.
- Un acompañante con cualquier cantidad de viajes es siempre calificado si supera los 20.

---

### 3. Packs premiums

Queremos saber si un pack es **premium**. Las condiciones van a depender de cada tipo de pack.

Si el pack es nacional, las condiciones son:
- Tiene más de **10 días de duración**
- Su coordinador es **altamente calificado**

Si el pack es interancional, las condiciones son:
- Que sea un **lugar de interés**
- Tiene más de **20 días de duración**
- No tiene **ninguna escala**

#### 🧪 Tests

- Testear las nuevas funcionalidades agregadas

---

### 4. Packs provinciales

Queremos agregar además los **packs provinciales**. Estos son un nuevo **sub-tipo de packs nacionales**. Estos tendrán como dato adicional la cantidad de ciudades a visitar.

#### Modificaciones en los requerimientos

**Packs premium**
- Para este tipo de packs, la condición cambia. Deben tener al menos 4 actividades para hacer, visitar más de 5 ciudades y tener al menos 3 beneficios vigentes.

**Precio**
- Se le agrega un 5% al precio final si el pack es premium.

#### 🧪 Tests

- Testear las nuevas funcionalidades agregadas