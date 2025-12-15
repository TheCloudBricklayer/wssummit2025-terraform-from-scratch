# Terraform From Scratch - Workshop Summit 2025

Este repositorio contiene los materiales y ejemplos para el taller de Terraform desde cero presentado en el Workshop Summit 2025.

## 📋 Tabla de Contenidos

- [Requisitos Previos](#requisitos-previos)
- [Instalación](#instalación)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Primeros Pasos](#primeros-pasos)
- [Flujo de Trabajo Básico](#flujo-de-trabajo-básico)
- [Comandos Esenciales](#comandos-esenciales)
- [Mejores Prácticas](#mejores-prácticas)
- [Solución de Problemas](#solución-de-problemas)
- [Recursos Adicionales](#recursos-adicionales)

## 🔧 Requisitos Previos

Antes de comenzar con este demo, asegúrate de tener instalado:

- **Terraform** (versión 1.0 o superior)
  - [Descargar Terraform](https://www.terraform.io/downloads.html)
- **Git** para clonar este repositorio
- **Cuenta de Cloud Provider** (AWS, Azure, GCP, etc.) según el ejemplo que vayas a ejecutar
- **Credenciales configuradas** para tu proveedor de nube
- **Editor de texto** (VS Code, Vim, etc.)

## 📥 Instalación

### 1. Instalar Terraform

**macOS (usando Homebrew):**
```bash
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

**Linux (Ubuntu/Debian):**
```bash
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

**Windows (usando Chocolatey):**
```powershell
choco install terraform
```

### 2. Verificar la Instalación

```bash
terraform version
```

### 3. Clonar este Repositorio

```bash
git clone https://github.com/TheCloudBricklayer/wssummit2025-terraform-from-scratch.git
cd wssummit2025-terraform-from-scratch
```

## 📁 Estructura del Proyecto

```
wssummit2025-terraform-from-scratch/
├── README.md                 # Este archivo
├── .gitignore               # Archivos ignorados por Git
├── main.tf                  # Configuración principal de Terraform
├── variables.tf             # Definición de variables
├── outputs.tf               # Definición de outputs
├── terraform.tfvars.example # Ejemplo de variables (renombrar a terraform.tfvars)
└── providers.tf             # Configuración de proveedores
```

## 🚀 Primeros Pasos

### Paso 1: Configurar Variables

Si existe un archivo `terraform.tfvars.example`, cópialo y configúralo:

```bash
cp terraform.tfvars.example terraform.tfvars
```

Edita `terraform.tfvars` con tus valores específicos:

```hcl
# Ejemplo
region = "us-east-1"
environment = "dev"
project_name = "wssummit-demo"
```

### Paso 2: Configurar Credenciales del Proveedor de Nube

**Para AWS:**
```bash
export AWS_ACCESS_KEY_ID="tu-access-key"
export AWS_SECRET_ACCESS_KEY="tu-secret-key"
export AWS_DEFAULT_REGION="us-east-1"
```

**Para Azure:**
```bash
az login
```

**Para GCP:**
```bash
gcloud auth application-default login
```

## 🔄 Flujo de Trabajo Básico

### 1. Inicializar Terraform

Este comando descarga los proveedores necesarios y prepara el directorio de trabajo:

```bash
terraform init
```

**Salida esperada:**
- Descarga de plugins de proveedores
- Inicialización del backend
- Mensaje de éxito

### 2. Validar la Configuración

Verifica que la sintaxis de tus archivos `.tf` sea correcta:

```bash
terraform validate
```

### 3. Formatear el Código

Aplica el formato estándar de Terraform a tus archivos:

```bash
terraform fmt
```

### 4. Planificar los Cambios

Revisa qué recursos se crearán, modificarán o destruirán:

```bash
terraform plan
```

**Opcional:** Guarda el plan para aplicarlo posteriormente:

```bash
terraform plan -out=tfplan
```

### 5. Aplicar los Cambios

Crea o modifica la infraestructura según la configuración:

```bash
terraform apply
```

O aplica un plan guardado:

```bash
terraform apply tfplan
```

**Nota:** Terraform pedirá confirmación. Escribe `yes` para continuar, o usa `-auto-approve` para omitir la confirmación (no recomendado en producción).

### 6. Verificar los Outputs

Después de aplicar, revisa los outputs definidos:

```bash
terraform output
```

### 7. Destruir la Infraestructura

Cuando termines, elimina todos los recursos creados:

```bash
terraform destroy
```

**⚠️ Advertencia:** Este comando eliminará TODOS los recursos gestionados por Terraform. Úsalo con precaución.

## 📝 Comandos Esenciales

| Comando | Descripción |
|---------|-------------|
| `terraform init` | Inicializa el directorio de trabajo |
| `terraform validate` | Valida la configuración |
| `terraform fmt` | Formatea los archivos de configuración |
| `terraform plan` | Muestra los cambios que se aplicarán |
| `terraform apply` | Aplica los cambios para crear/actualizar infraestructura |
| `terraform destroy` | Destruye la infraestructura gestionada |
| `terraform show` | Muestra el estado actual |
| `terraform output` | Muestra los valores de output |
| `terraform state list` | Lista todos los recursos en el estado |
| `terraform state show <recurso>` | Muestra detalles de un recurso específico |
| `terraform refresh` | Actualiza el estado con la infraestructura real |
| `terraform graph` | Genera un gráfico de dependencias |

## ✅ Mejores Prácticas

1. **Usa control de versiones:** Siempre versiona tus archivos `.tf` en Git
2. **No versiones archivos sensibles:** Los archivos `.tfstate`, `.tfvars` y credenciales NO deben estar en el repositorio
3. **Backend remoto:** Usa un backend remoto (S3, Azure Blob, etc.) para compartir el estado en equipo
4. **Modulariza tu código:** Divide configuraciones grandes en módulos reutilizables
5. **Usa variables:** Define valores configurables como variables en lugar de hardcodearlos
6. **Documenta tu código:** Añade comentarios y descripciones a tus recursos y variables
7. **Planifica siempre:** Ejecuta `terraform plan` antes de `terraform apply`
8. **Workspace separation:** Usa workspaces para separar entornos (dev, staging, prod)
9. **Lock your state:** Usa state locking para prevenir cambios concurrentes
10. **Versionado de proveedores:** Especifica versiones de proveedores para reproducibilidad

## 🔍 Solución de Problemas

### Error: "No configuration files"

**Problema:** Terraform no encuentra archivos `.tf`

**Solución:** Asegúrate de estar en el directorio correcto que contiene tus archivos de configuración.

### Error: "Provider configuration not present"

**Problema:** El proveedor no está configurado correctamente

**Solución:** 
1. Ejecuta `terraform init` para descargar el proveedor
2. Verifica que el bloque `provider` esté configurado en tus archivos `.tf`

### Error: "Error acquiring the state lock"

**Problema:** Otra operación de Terraform está en progreso o quedó bloqueada

**Solución:**
```bash
terraform force-unlock <LOCK_ID>
```

### Error: "Authentication error"

**Problema:** Las credenciales del proveedor de nube no son válidas o no están configuradas

**Solución:** Verifica que tus credenciales estén configuradas correctamente según las instrucciones de tu proveedor.

### State out of sync

**Problema:** El estado de Terraform no coincide con la infraestructura real

**Solución:**
```bash
terraform refresh
```

## 📚 Recursos Adicionales

### Documentación Oficial
- [Documentación de Terraform](https://www.terraform.io/docs)
- [Terraform Registry](https://registry.terraform.io/)
- [Tutoriales de HashiCorp Learn](https://learn.hashicorp.com/terraform)

### Comunidad
- [Foro de Terraform](https://discuss.hashicorp.com/c/terraform-core)
- [Terraform en GitHub](https://github.com/hashicorp/terraform)

### Cursos y Guías
- [Terraform Associate Certification](https://www.hashicorp.com/certification/terraform-associate)
- [AWS + Terraform Workshop](https://tf-workshop.aws.awsworkshop.io/)
- [Azure + Terraform Quickstarts](https://learn.microsoft.com/en-us/azure/developer/terraform/)

## 🤝 Contribuir

Si encuentras errores o quieres mejorar este demo:

1. Haz fork del repositorio
2. Crea una rama para tu feature (`git checkout -b feature/mejora`)
3. Commit tus cambios (`git commit -am 'Añadir nueva característica'`)
4. Push a la rama (`git push origin feature/mejora`)
5. Crea un Pull Request

## 📄 Licencia

Este proyecto es parte del Workshop Summit 2025 y está disponible con fines educativos.

## 👨‍💻 Autor

**The Cloud Bricklayer**

---

**¡Feliz aprendizaje de Terraform!** 🚀