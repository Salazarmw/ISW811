# Workshop de Virtualización y Servidor Web con Vagrant

## Fecha: 28/05/2025

Este taller se centró en la instalación de entornos virtuales utilizando **VirtualBox**, **Vagrant** y la configuración de un servidor web Apache dentro de una máquina virtual Debian.

---

## 🛠️ Instalación Inicial

1. Se instaló **VirtualBox** y **Vagrant** en el sistema.
2. Se verificó desde el *Administrador de tareas* que la virtualización esté habilitada.
3. Se reinició el equipo.
4. Se abrió una terminal (CMD) para comprobar la instalación con el comando:

   ```bash
   vagrant -v
   ```

---

## 🌐 Configuración de Red

1. Desde la terminal virtual se accedió a las configuraciones de red.
2. Se seleccionó la red deseada y se verificaron sus propiedades:

   * Dirección IP: `192.168.56.1`
   * Máscara de red: `255.255.255.0`

---

## 🧽 Comandos Básicos en Git Bash

1. Click derecho en el escritorio → Mostrar más opciones → `Open Git Bash here`
2. Comandos utilizados:

   ```bash
   pwd                   # Ver ruta actual
   mkdir ISW811          # Crear carpeta
   ls                    # Listar contenido
   ls -la                # Listar con detalles
   cd ISW811             # Entrar a carpeta
   cd ..                 # Volver al directorio padre
   cd                    # Ir al home
   mv archivo1 archivo2  # Renombrar/mover archivos
   ```

---

## 📦 Creación del Entorno Virtual con Vagrant

1. Dentro del directorio `webservice`, se ejecutó:

   ```bash
   vagrant init debian/bookworm64
   ```
2. Se creó el archivo `Vagrantfile` y se abrió con:

   ```bash
   code Vagrantfile
   ```
3. Se realizaron los siguientes cambios:

   * Se descomentó la línea 35 (`config.vm.network "private_network", ip: "..."`)
   * Se cambió la IP por `192.168.56.10`
4. Verificación del cambio:

   ```bash
   cat Vagrantfile | grep private_network
   ```

---

## 🚀 Levantar y Acceder a la Máquina Virtual

1. Se inició la máquina virtual con:

   ```bash
   vagrant up
   ```
2. Para conectarse a la máquina:

   ```bash
   vagrant ssh
   ```
3. Dentro de la VM:

   * Ver versión del sistema:

     ```bash
     uname -a
     ```
   * Actualizar dependencias:

     ```bash
     sudo apt-get update
     ```

---

## 🌐 Instalación de Apache2

1. Instalación del servidor Apache:

   ```bash
   sudo apt-get install apache2
   ```
2. Verificación desde el navegador:

   * Ingresar a la URL: [https://192.168.56.10/](https://192.168.56.10/)

---

## ✅ Resultado

El servidor web Apache fue instalado correctamente en una máquina virtual Debian gestionada con Vagrant, accesible mediante la IP privada configurada.
