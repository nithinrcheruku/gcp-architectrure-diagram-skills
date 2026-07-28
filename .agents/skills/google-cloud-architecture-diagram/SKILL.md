---
name: google-cloud-architecture-diagram
description: Generates publication-quality, standard-compliant Google Cloud architecture diagram image artifacts via mandatory generate_image tool call (powered by Gemini Pro / Imagen 3) grounded in official Google Cloud Architecture Center standards (docs.cloud.google.com/architecture).
argument-hint: "[describe any GCP architecture or say 'analyze' to scan codebase]"
---

# Google Cloud Architecture Diagram Skill — Universal GCP Engine

Generates publication-quality Google Cloud architecture diagrams complying strictly with official [Google Cloud Architecture Center](https://docs.cloud.google.com/architecture) guidelines across **all** product domains and deployment patterns (AI & Agentic Systems, GenAI RAG, Data Analytics & Mesh, Serverless Application Modernization, Zero Trust & Security Foundations, Hub-and-Spoke Networking, and Multi-Tenant SaaS). See [AGENTS.md](../../../AGENTS.md) for master repo guidelines and evaluation benchmark frameworks.

## 1. When NOT to Use This Skill (Negative Controls)
- Do NOT trigger for generic programming code fixes (e.g., fixing Python syntax, writing unit tests).
- Do NOT trigger for non-GCP cloud providers (e.g., AWS S3/DynamoDB or Azure infrastructure).
- Do NOT trigger for pure text conceptual questions where no visual architecture diagram is requested.

## 2. Mandatory Execution Protocol (Gemini Pro / Imagen 3 Image Grounding)

To ensure 100% visual consistency and publication quality without crude hand-coded text boxes, the agent MUST generate high-definition image artifacts via Gemini Pro / Imagen 3:

### STEP 1: High-Definition Image Generation (`generate_image` Tool Call)
1. **MANDATORY TOOL CALL**: You MUST call the `generate_image` tool to generate a stunning, publication-grade, high-resolution visual architecture diagram powered by Imagen 3 / Gemini Pro vision models.
2. **Anchor with Product Icons**: Pass absolute paths to local GCP product category icons in `ImagePaths` (from `assets/category-icons/Category Icons/`) so the image generation model anchors to official Google Cloud branding.
3. **Prompt Mandates**: Prompt MUST explicitly detail:
   - Official Google Cloud Architecture Center diagram style guide standards (16:9 or 1280x820 aspect ratio).
   - 5-level container hierarchy (Google Blue title band `#1A73E8`, GCP Projects `#F6F6F6`, Regional VPCs `#ECEFF1`, Subnet isolation zones `#EDE7F6`, VPC-SC dashed red perimeters `#EA4335`).
   - Clean 6-tier horizontal flow, rounded product cards with category color headers, distinct PEP/PDP lifeline arrows, and sequence circle badges.

### STEP 2: HTML Presentation Wrapper
1. Save the generated high-definition PNG image artifact as `diagram.png`.
2. Create an `index.html` presentation canvas that embeds `<img src="diagram.png">` inside a sleek, responsive preview container with zoom, pan, and full-screen controls.

## 3. Universal 5-Level Container Hierarchy (100% GCP Architecture Center Standard)

Every generated diagram MUST reflect the full 5-level nested GCP container hierarchy:
1. **Google Cloud Brand Header Block**: Google Blue (`#1A73E8`) top title band.
2. **GCP Project Containers**: Isolated GCP Projects (`#F6F6F6` fill, `#BDBDBD` stroke, `rx="8"`), such as Routing Hub, Tenant/Workload Spokes, and Central Governance Hub.
3. **Regional VPC Networks**: Regional VPC containers (`#ECEFF1` fill, `#90A4AE` stroke, `rx="6"`) with explicit region labels (e.g., `REGION: us-central1 (VPC Network)`).
4. **VPC Subnet Isolation Zones**: Subnet containers (`#EDE7F6` fill, `#5E35B1` stroke, `rx="4"`) with zone labels (e.g., `VPC Subnet: Ingress / Compute / Datastore`).
5. **VPC Service Controls (VPC-SC) Perimeters**: Red dashed perimeters (`#FCE8E6` fill, `#EA4335` stroke, `stroke-dasharray="5,3"`) enfolding sensitive tenant data, analytics, & compute workloads.

## 4. Universal 6-Tier Functional Grid Alignment

Components across ANY GCP architecture MUST be organized left-to-right or top-to-bottom across 6 functional tiers:
- **Tier 1: Access / Clients**: Users, Mobile/Web Clients, On-Premises Data Centers, External SaaS, Third-Party APIs.
- **Tier 2: Edge Security & LB**: Cloud Armor WAF, Cloud CDN, External Application Load Balancers, IAP, Cloud DNS.
- **Tier 3: Ingress Gateway**: API Gateway, Apigee, Private Service Connect (PSC), Ingress Agent Gateway.
- **Tier 4: Compute & AI Runtime**: Cloud Run, GKE, Compute Engine, Cloud Functions, Dataflow, Vertex AI Pipelines, gVisor Sandboxes.
- **Tier 5: Egress Security Gateway**: Egress NAT, Outbound Proxy, VPC Access Connectors, Workload Identity Federation.
- **Tier 6: Datastore, Analytics & AI Services**: Cloud SQL, AlloyDB, BigQuery, Cloud Storage, Firestore, Spanner, Vertex AI Vector Search, Cloud KMS CMEK Key Rings.

## 5. High-Fidelity Structured Product Card Anatomy

Every GCP product node MUST be rendered as a structured publication card:
- **Outer Card Frame**: `<rect fill="#FFFFFF" stroke="<category-color>" stroke-width="1.5" rx="4"/>`
- **Card Accent Header**: `<rect x="<x>" y="<y>" width="<w>" height="8" rx="4" fill="<category-color>"/>`
- **Category Icon / Symbol**: Official GCP Product Category Icon from `assets/category-icons/`.
- **Product Title**: Bold text in category dark shade (Compute: `#1A56C4`, DB/Analytics: `#1E7B34`, Security: `#C5221F`, KMS/Identity: `#B06000`).
- **Subtitle / Role**: Details component responsibility.
- **Parameter Pill Badge**: Parameter pill with uppercase text (e.g., `GVISOR MICROVM`, `ROW ISOLATION`, `CMEK KEY RING`, `PSC ENDPOINT`).

## 6. Operating Modes & Grounding

### Mode A: Codebase Infrastructure Analysis ("scan", "analyze", "from code")
1. Search codebase for Terraform (`*.tf`), K8s manifests, Cloud Run (`service.yaml`), or Helm. See [export-and-codebase-parser.md](references/export-and-codebase-parser.md).
2. Extract project boundaries, subnets, database connections, and IAM roles.
3. Map extracted resources into Hub-and-Spoke GCP Project containers and generate image via `generate_image`.

### Mode B: Interactive Design & Brainstorming
1. Query `google-developer-knowledge` MCP server (`search_documents`) for relevant GCP Architecture Center topologies matching the prompt domain.
2. Propose multi-project layout, PEP/PDP enforcement points, and datastore isolation strategy, then generate image via `generate_image`.

## 7. Product Category Tokens & Line Semantics

- **Product Category Tokens**:
  - Compute / Serverless: Fill `#FFFFFF`, Stroke `#4284F3` (Google Blue).
  - Databases / Storage / Analytics: Fill `#FFFFFF`, Stroke `#34A853` (Google Green).
  - Security / WAF / Network Security: Fill `#FCE8E6`, Stroke `#EA4335` (Google Red).
  - KMS / Identity / IAM: Fill `#FEF7E0`, Stroke `#F9AB00` (Google Yellow). See [gcp-product-icons-and-colors.md](references/gcp-product-icons-and-colors.md).
- **Flow Line Semantics**:
  - PEP Primary Data Flows: Solid `#4285F4` arrows with solid arrowhead.
  - PDP Policy Calls: Dashed `#7986CB` arrows (`stroke-dasharray="4,3"`).
  - Sequence Badges: Circular numbered badges (`1`, `2`, `3`...) attached to every connection line. See [containment-and-layout-rules.md](references/containment-and-layout-rules.md) and [security-and-compliance-rules.md](references/security-and-compliance-rules.md).

## 8. Output Deliverables
- **High-Definition PNG Graphic (`diagram.png`)**: Generated via mandatory `generate_image` tool call.
- **Presentation Workspace (`index.html`)**: HTML wrapper displaying `diagram.png` in a responsive viewer.
