# ReclamacionesSeguros
Proyecto académico desarrollado para la materia de **Bases de Datos (2024-10)**.  
El sistema modela el proceso de **reclamaciones de seguros médicos**, integrando entidades como pacientes, personal médico, citas, pólizas y aseguradoras.  
Incluye el modelo entidad–relación, el diseño relacional final y los scripts SQL necesarios para la creación, carga y consulta de la base de datos en Oracle.

---

## 📌 Objetivo del proyecto

Construir y analizar un modelo relacional normalizado que permita gestionar:

- Registro de pacientes y personal médico.
- Control de citas médicas y motivos asociados.
- Registro de pólizas y compañías aseguradoras.
- Administración de reclamaciones (fechas, montos, estados).
- Consultas analíticas y reportes derivados del sistema.

Este proyecto representa un entorno realista utilizado por entidades de salud y aseguradoras.

---

## 🛠️ Tecnologías utilizadas

- **Oracle SQL / PL-SQL**
- Oracle Live SQL, Oracle SQL Developer u Oracle XE
- Git + GitHub para control de versiones
  
---

## 📂 Estructura del proyecto

```plaintext
Proyecto2_ReclamacionesSeguros/
├── Entidad-Relacion.jpg        # Diagrama E-R del sistema
├── Relacional.jpg              # Modelo relacional normalizado
├── Scripts/
│   ├── DDL.sql                 # Definición de tablas, PK/FK, restricciones
│   ├── DML.sql                 # Inserción de datos iniciales
│   └── Consultas.sql           # Consultas y reportes del sistema
├── .gitignore
└── README.md
```
---

## Modelo de datos

El diseño del sistema se basa en varias entidades interconectadas:

👤 Paciente

  └── Almacena datos personales, dirección, sexo, fecha de nacimiento, alergias y familiares relacionados.

🩺 Personal

  └── Registra al personal médico que atiende citas y gestiona reclamaciones.
      Incluye cargo, especialidad y títulos asociados.

📅 Cita

  └── Registra citas médicas programadas y realizadas.
      Cada cita está asociada a un motivo, una fecha y al personal encargado.

📝 Reclamación

  -Representa una solicitud de reembolso y contiene:

  -Fechas de acción, presentación y pago

  -Montos reclamado y pagado

  -Relación con la póliza

  -Compañía aseguradora responsable

🛡️ Póliza

   └── Incluye número, tipo de cobertura y valor máximo asegurado para el paciente.

🏢 Aseguradora

   └── Entidad encargada de la cobertura y gestión de reembolsos.
      Incluye NIT, dirección y contacto.

---

📊 Consultas incluidas

El archivo **Consultas.sql** contiene reportes como:

- Reclamaciones por paciente.

- Diferencias entre monto reclamado y pagado.

- Personal médico involucrado en cada reclamación.

- Reclamaciones agrupadas por póliza y aseguradora.

- Pacientes con citas atendidas por determinado profesional.

- Estados y etapas actuales de cada reclamación.
  
---

📊 Estado del proyecto

Este proyecto se revisó y reorganizó para su publicación en GitHub con fines académicos y de portafolio personal.
Los scripts fueron probados en OracleXE y Oracle Live y funcionan de forma independiente.

---

## 🚀 Cómo ejecutar los scripts

⭐Opción 1 **Oracle Live SQL**:
```bash
1. Ingresa a https://livesql.oracle.com

2. Abre SQL Worksheet.

3. Ejecuta los archivos en este orden:

    a. DDL.sql
    b. DML.sql
    c. Consultas.sql

   ```
⭐Opción 2 **Oracle SQL Developer o XE**:
   ```bash
1.Crea una conexión con:

    Usuario: system o uno propio

    Host: localhost

    Puerto: 1521

   SID: XE

Ejecuta los scripts en el mismo orden anterior.
```

---
   
>  Nota: Por razones de derechos académicos, el enunciado original del proyecto **no será publicado en este repositorio**.
