# GCP Product Icons, Colors, and Typography Reference

This reference grounds Google Cloud architecture diagram styling according to official Google Cloud publications:
- **Official Product Icon Library**: [Google Cloud Product Icons PDF](https://services.google.com/fh/files/misc/google-cloud-product-icons.pdf)
- **Google Cloud Diagram Style Guide V2.5**: [ArchitectureDS.pdf](../resources/ArchitectureDS.pdf)
- **Google Cloud Architecture Center**: [docs.cloud.google.com/architecture](https://docs.cloud.google.com/architecture)

---

## 1. Product Category Color Palette Tokens

Every Google Cloud product and service node must be assigned to exactly one category color family matching the official [Google Cloud Product Icons PDF](https://services.google.com/fh/files/misc/google-cloud-product-icons.pdf):

| Category | Primary Fill | Stroke Color | Text Color | Product Examples |
| :--- | :--- | :--- | :--- | :--- |
| **Compute & Containers** | `#FFFFFF` | `#4284F3` (Blue) | `#1A56C4` | Cloud Run, GKE, Compute Engine, Anthos, Functions |
| **Databases & Analytics** | `#FFFFFF` | `#34A853` (Green) | `#1E7B34` | AlloyDB, Cloud SQL, BigQuery, Spanner, Firestore |
| **Security & Net Security** | `#FCE8E6` | `#EA4335` (Red) | `#C5221F` | Cloud Armor, Model Armor, WAF, Identity Platform |
| **Security / KMS / Identity** | `#FEF7E0` | `#F9AB00` (Yellow) | `#B06000` | Cloud KMS CMEK, Secret Manager, IAM, Key Access Justification |
| **AI / Agent Platform** | `#FFFFFF` | `#1A73E8` (Blue) | `#1A73E8` | Vertex AI, Agent Runtime, Agent Registry, Gemini API |
| **Networking & Hybrid** | `#FFFFFF` | `#4284F3` | `#202124` | Cloud Load Balancing, Cloud NAT, Interconnect, VPC |

---

## 2. Card Composition & Typography Specifications

### A. General Card Specifications
* **Base Height**: 70px minimum recommended height.
* **Border Specs**: Color Google Gray 900 (`#202124`), Weight `2pt`, Radius `6pt` (`rx="6"`).
* **Card Fill**: `#FFFFFF` (White) or light tint (`#FCE8E6` for Security, `#FEF7E0` for KMS).
* **Padding & Spacing**:
  * Internal padding: 15px.
  * Icon size: 35px wide (Priority/Category cards) or 25px wide (Service/User cards).
  * Gutter between icon and label: 10px.
  * Minimum card width: 160px - 180px.

### B. Typography Specifications
* **Primary Text / Caption**:
  * Style: `font-family="Google Sans, Roboto, sans-serif"`, `font-weight="700"`, `font-size="14pt"` (18.66px).
  * Color: Google Gray 900 (`#202124`). Sentence case.
* **Secondary Text / Product Subtext**:
  * Style: `font-size="12pt"` (16px), `font-weight="400"`.
  * Color: Google Gray 900 (`#202124`).
* **Tertiary / Additional Text**:
  * Style: `font-size="12pt"`, `font-weight="700"`.
  * Color: Google Blue 700 (`#1967D2`).
* **Code / Mono Text**:
  * Style: `font-family="Roboto Mono, monospace"`, `font-size="12pt"`, `font-weight="400"`.
  * Color: Google Gray 900 (`#202124`).

---

## 3. Boundary Container Specifications

| Container Level | Fill Color | Stroke Color | Stroke Weight | Corner Radius | Heading Specs |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Google Cloud Area** | `#FFFFFF` | `#1A73E8` | `2pt` | `8px` (`rx="8"`) | Header bar: `#1A73E8` with reverse white text (`#FFFFFF`) |
| **GCP Project Area** | `#F6F6F6` | `#BDBDBD` | `1.5pt` | `8px` (`rx="8"`) | 10pt Bold `#5F6368` uppercase |
| **Region** | `#F1F3F4` | `#DADCE0` | `1pt` | `6px` (`rx="6"`) | 17pt Normal `#202124` |
| **Zone / VPC** | `#ECEFF1` / `#AECBFA` | `#90A4AE` / `#1A73E8` | `1pt` | `6px` (`rx="6"`) | 17pt Normal `#202124` |
| **Subnet Zone** | `#EDE7F6` / `#D2E3FC` | `#5E35B1` / `#1967D2` | `1pt` | `4px` (`rx="4"`) | 12pt Bold `#5E35B1` |
| **VPC-SC Perimeter** | `#FCE8E6` | `#EA4335` | `1.5pt` (dashed `5,3`) | `4px` (`rx="4"`) | 9pt Bold `#C5221F` uppercase |

---

## 4. Local Pre-Packaged Category Icons for AI Image Generation Anchoring

When generating high-definition image assets via `generate_image`, pass up to 3 local category PNG icons in `ImagePaths` to anchor brand styling and colors:

* **Base Path**: `.agents/skills/google-cloud-architecture-diagram/assets/category-icons/Category Icons/`

| Architectural Component | Local Reference Icon Asset Path |
| :--- | :--- |
| **VMs, Compute, MIGs** | `Compute/PNG/Compute-512-color.png` |
| **VPCs, Routers, Interconnect** | `Networking/PNG/Networking-512-color.png` |
| **Cloud SQL, AlloyDB, Spanner** | `Databases/PNG/Databases-512-color.png` |
| **Cloud Armor, IAM, WAF** | `Security Identity/PNG/SecurityIdentity-512-color.png` |
| **GKE, Containers, Pods** | `Containers/PNG/Containers-512-color.png` |
| **Buckets, Cloud Storage, Filestore** | `Storage/PNG/Storage-512-color.png` |
| **Cloud Functions, Cloud Run** | `Serverless Computing/PNG/ServerlessComputing-512-color.png` |
| **Agents, Vertex AI, AI Orchestrator** | `Agents/PNG/Agents-512-color.png` (or `AI _ Machine Learning/PNG/AIMachineLearning-512-color.png`) |
| **Observability, Operations** | `Observability/PNG/Observability-512-color.png` |
| **DevOps, CI/CD Pipelines** | `DevOps/PNG/DevOps-512-color.png` |
