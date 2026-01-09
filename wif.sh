# --- Configuración Limpia (V2) ---
export PROJECT_ID="gcp-devsecops-lab-483718"
export POOL_NAME="github-pool-v2"  # Usamos v2 para evitar conflictos
export PROVIDER_NAME="github-provider"
export REPO="chep88/gcp-terraform-base"
export SA_NAME="github-ci-sa"

echo "🚀 Iniciando configuración limpia..."

# 1. Crear el Pool V2 (Nuevo y limpio)
gcloud iam workload-identity-pools create "${POOL_NAME}" \
  --project="${PROJECT_ID}" \
  --location="global" \
  --display-name="GitHub Pool v2"

# 2. Crear el Proveedor (Con mapeo básico primero para evitar errores)
gcloud iam workload-identity-pools providers create-oidc "${PROVIDER_NAME}" \
  --project="${PROJECT_ID}" \
  --location="global" \
  --workload-identity-pool="${POOL_NAME}" \
  --display-name="GitHub Provider" \
  --attribute-mapping="google.subject=assertion.sub,attribute.actor=assertion.actor,attribute.repository=assertion.repository" \
  --issuer-uri="https://token.actions.githubusercontent.com"

# 3. Conectar la Service Account (Reutilizamos la SA si ya existe, no hay problema)
export WORKLOAD_IDENTITY_POOL_ID=$(gcloud iam workload-identity-pools describe "${POOL_NAME}" --project="${PROJECT_ID}" --location="global" --format="value(name)")

gcloud iam service-accounts add-iam-policy-binding "${SA_NAME}@${PROJECT_ID}.iam.gserviceaccount.com" \
  --project="${PROJECT_ID}" \
  --role="roles/iam.workloadIdentityUser" \
  --member="principalSet://iam.googleapis.com/${WORKLOAD_IDENTITY_POOL_ID}/attribute.repository/${REPO}"

# 4. Obtener el dato final (El tesoro 🏆)
echo "✅ ¡ÉXITO! Copia la siguiente línea para GitHub:"
gcloud iam workload-identity-pools providers describe "${PROVIDER_NAME}" \
  --project="${PROJECT_ID}" \
  --location="global" \
  --workload-identity-pool="${POOL_NAME}" \
  --format="value(name)"
