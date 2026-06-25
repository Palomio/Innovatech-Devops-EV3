# 🚀 Innovatech Chile - Plataforma Backend

Este repositorio contiene la capa de servicios y gestión de datos de la plataforma Innovatech Chile. La solución está desarrollada bajo una arquitectura basada en microservicios desacoplados, permitiendo una alta disponibilidad, escalabilidad y facilidad de mantenimiento en entornos Cloud.

## 🧩 Estructura de la Solución

La aplicación está compuesta por dos servicios principales:

### 📦 Servicio de Despachos (`port: 8081`)

Responsable de la administración logística de los pedidos, incluyendo la asignación de camiones, seguimiento de intentos de entrega y actualización del estado final de las órdenes.

### 🛒 Servicio de Ventas (`port: 8082`)

Encargado del registro y consulta de compras realizadas por los clientes, gestionando el ciclo inicial de las órdenes.

Los servicios se ejecutan en un clúster de AWS EKS y son accesibles mediante balanceadores de carga de AWS. Además, cuentan con escalamiento automático horizontal (HPA), aumentando o reduciendo réplicas según la demanda del sistema cuando el uso de CPU supera el 50%.

## 💻 Puesta en Marcha Local

### Requisitos Previos

* Java JDK 17 o superior
* Apache Maven 3.8+
* MySQL Server (instalación local o contenedor Docker)

### 🗄️ Configuración de la Base de Datos

1. Iniciar el servidor MySQL utilizando el puerto `3306`.
2. Crear la base de datos especificada en el archivo `application.properties` (por ejemplo: `db_desarrollo`).
3. Al iniciar la aplicación, Hibernate generará automáticamente las tablas necesarias (`venta` y `despacho`) según la configuración definida (`update` o `create`). Opcionalmente, se pueden cargar registros iniciales mediante un archivo `data.sql`.

### ▶️ Ejecución del Proyecto

1. Clonar el repositorio:

```bash
git clone https://github.com/DoomedPlayer/DevopsEV3-back.git
```

2. Compilar el proyecto:

```bash
mvn clean package
```

3. Iniciar cada microservicio de forma independiente:

```bash
mvn spring-boot:run
```

## 🔁 Pipeline de Integración y Despliegue

El proyecto incorpora un flujo de automatización mediante GitHub Actions que se ejecuta ante cambios en la rama principal.

### Flujo Automatizado

1. Compilación del código fuente y generación de los archivos `.jar` correspondientes a cada microservicio.

2. Creación de imágenes Docker individuales para los servicios de Ventas y Despachos.

3. Publicación automática de las imágenes en un repositorio privado de Amazon ECR.

4. Actualización del clúster AWS EKS mediante comandos `kubectl`, desplegando las nuevas versiones de los servicios.

5. Gestión segura de credenciales y variables sensibles utilizando GitHub Secrets, evitando almacenar información confidencial dentro del repositorio.
