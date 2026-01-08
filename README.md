# 🏗️ GCP Terraform Boilerplate

![Terraform CI](https://github.com/chep88/gcp-terraform-base/actions/workflows/terraform-ci.yml/badge.svg)
[![Security: tfsec](https://img.shields.io/badge/Security-tfsec-blue)](https://github.com/aquasecurity/tfsec)
[![Terraform Version](https://img.shields.io/badge/Terraform-1.5.0-purple)](https://www.terraform.io/)

Una plantilla base de Infraestructura como Código (IaC) modular, segura y escalable para Google Cloud Platform. Diseñada siguiendo las mejores prácticas de **DevSecOps**.

---

## 🚀 Características Principales

* **Arquitectura Modular:** Separación lógica entre Networking (`/modules/network`) y Cómputo (`/modules/compute`).
* **Security First:** Escaneo estático de seguridad integrado con **tfsec**.
* **CI/CD Automatizado:** Pipeline de GitHub Actions para validación de sintaxis (fmt/validate) y seguridad.
* **Gestión de Entornos:** Estructura preparada para múltiples ambientes (`envs/dev`, `envs/prod`).

## 🛠️ Stack Tecnológico

* **IaC:** Terraform
* **Cloud:** Google Cloud Platform (GCP)
* **CI/CD:** GitHub Actions
* **Seguridad:** tfsec (Static Application Security Testing)

## 📂 Estructura del Proyecto

```text
gcp-terraform-base/
├── .github/workflows/   # Definición de Pipelines CI
├── envs/                # Entornos (State isolation)
│   └── dev/             # Entorno de Desarrollo
├── modules/             # Módulos Reutilizables
│   ├── compute/         # VMs y Hardening
│   └── network/         # VPCs y Firewalls
└── README.md            # Documentación
