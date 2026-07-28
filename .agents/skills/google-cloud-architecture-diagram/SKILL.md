---
name: google-cloud-architecture-diagram
description: Generates publication-quality, standard-compliant Google Cloud architecture diagram image artifacts via mandatory 4-stage deep architectural reasoning and generate_image tool call (powered by Gemini Pro / Imagen 3) grounded in official Google Cloud Architecture Center standards (docs.cloud.google.com/architecture).
argument-hint: "[describe any GCP architecture or say 'analyze' to scan codebase]"
---

# Google Cloud Architecture Diagram Skill — Universal GCP Engine

Generates publication-quality Google Cloud architecture diagrams complying strictly with official [Google Cloud Architecture Center](https://docs.cloud.google.com/architecture) guidelines across **all** product domains and deployment patterns (AI & Agentic Systems, GenAI RAG, Data Analytics & Mesh, Serverless Application Modernization, Zero Trust & Security Foundations, Hub-and-Spoke Networking, and Multi-Tenant SaaS). See [AGENTS.md](../../../AGENTS.md) for master repo guidelines and evaluation benchmark frameworks.

## 1. When NOT to Use This Skill (Negative Controls)
- Do NOT trigger for generic programming code fixes (e.g., fixing Python syntax, writing unit tests).
- Do NOT trigger for non-GCP cloud providers (e.g., AWS S3/DynamoDB or Azure infrastructure).
- Do NOT trigger for pure text conceptual questions where no visual architecture diagram is requested.

## 2. Mandatory 4-Stage Deep Architectural Execution Protocol

To eliminate superficial diagrams and enforce publication-quality technical accuracy for unseen or complex architectures, the agent MUST execute the following 4 stages sequentially:

---

### STAGE 1: Domain Grounding & Topology Research
1. Query `google-developer-knowledge` MCP server (`search_documents`) for the target domain (e.g. multi-tenant SaaS control/compute/data plane, agentic AI, zero-trust perimeters).
2. Identify official GCP product recommendations, security boundary patterns, and networking connectors (e.g. Private Service Connect, ALB, IAP, gVisor, CMEK Key Rings, VPC-SC).

---

### STAGE 2: Deep Architecture Thinking & Visual Layout Blueprint (REQUIRED REASONING STEP)
Before calling any image generation tools, the agent **MUST** explicitly formulate and write out a **Structured Visual Layout Specification**:
1. **Multi-Project Hub-and-Spoke Boundaries**: Define exact GCP Project boundaries (e.g., `proj-control-plane-prod`, `proj-shared-compute-prod`, `proj-shared-data-prod`).
2. **Network & Subnet Topology**: Map regional VPC networks, subnets, and private connectivity (PSC endpoints, Workload Identity Federation, Egress Proxies).
3. **5-Level Nested Containment Tree**: Detail parent-child hierarchy (Brand Header $\rightarrow$ Projects $\rightarrow$ Regional VPCs $\rightarrow$ Subnets $\rightarrow$ VPC-SC Perimeters).
4. **Complete Node Inventory**: List EVERY product node with:
   - Product Name (e.g., `AlloyDB for PostgreSQL`, `Vertex AI Agent Builder`, `Cloud Armor WAF`).
   - Category Color Token (`Compute=#4284F3`, `DB/Analytics=#34A853`, `Security=#EA4335`, `KMS/Identity=#F9AB00`).
   - Subtitle Role (e.g., `Primary Policy Enforcement Point`, `HSM CMEK Key Enforcer`).
   - Parameter Pill Badge (e.g., `ROW LEVEL SECURITY`, `GVISOR MICROVM`, `TENANT JWT CLAIMS`).
   - Grid Tier Position (`Tier 1: Access` $\rightarrow$ `Tier 2: Edge` $\rightarrow$ `Tier 3: Ingress` $\rightarrow$ `Tier 4: Compute` $\rightarrow$ `Tier 5: Egress` $\rightarrow$ `Tier 6: Datastore`).
5. **Transaction Lifelines & Sequence Badges**: Map step-by-step transaction flows (`1`, `2`, `3`...) indicating PEP data paths (solid blue `#4285F4`), PDP policy calls (dashed indigo `#7986CB`), and payload labels (`Tenant JWT Token`, `CMEK Lookup`).

---

### STAGE 3: Hyper-Detailed Image Generation (`generate_image` Tool Call)
1. **MANDATORY TOOL CALL**: Pass the Stage 2 Visual Layout Blueprint as a comprehensive, multi-paragraph 500+ word prompt to `generate_image`.
2. **Anchor with Product Icons**: Pass absolute paths to local GCP product category icons in `ImagePaths` (from `assets/category-icons/Category Icons/`) so the Gemini Pro / Imagen 3 model anchors to official Google Cloud visual identity.
3. **Style Mandates**: Prompt MUST mandate:
   - High-resolution publication diagram (1280x820 or 16:9 aspect ratio).
   - Crisp Google Blue (`#1A73E8`) header title band.
   - Distinct project containers (`#F6F6F6` fill, `#BDBDBD` stroke, `rx="8"`).
   - Regional VPCs (`#ECEFF1` fill, `#90A4AE` stroke, `rx="6"`).
   - Subnet zones (`#EDE7F6` fill, `#5E35B1` stroke, `rx="4"`).
   - Red dashed VPC-SC perimeters (`#FCE8E6` fill, `#EA4335` stroke).
   - Structured product cards with white fill, category-colored top accent bars, parameter pills, rounded corners, and clear connection arrows with numbered circle badges.

---

### STAGE 4: Interactive HTML Presentation Canvas
1. Save the generated high-definition PNG image artifact as `diagram.png`.
2. Create an `index.html` presentation canvas embedding `<img src="diagram.png">` inside a responsive, zoomable preview container.

---

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
- **Outer Card Frame**: White background with 1.5pt category stroke and rounded corners (`rx="4"`).
- **Card Accent Header**: Category-colored top accent bar.
- **Category Icon / Symbol**: Official GCP Product Category Icon from `assets/category-icons/`.
- **Product Title**: Bold text in category dark shade (Compute: `#1A56C4`, DB/Analytics: `#1E7B34`, Security: `#C5221F`, KMS/Identity: `#B06000`).
- **Subtitle / Role**: Details component responsibility.
- **Parameter Pill Badge**: Parameter pill with uppercase text (e.g., `GVISOR MICROVM`, `ROW ISOLATION`, `CMEK KEY RING`, `PSC ENDPOINT`).

## 6. Product Category Tokens & Line Semantics

- **Product Category Tokens**:
  - Compute / Serverless: Fill `#FFFFFF`, Stroke `#4284F3` (Google Blue).
  - Databases / Storage / Analytics: Fill `#FFFFFF`, Stroke `#34A853` (Google Green).
  - Security / WAF / Network Security: Fill `#FCE8E6`, Stroke `#EA4335` (Google Red).
  - KMS / Identity / IAM: Fill `#FEF7E0`, Stroke `#F9AB00` (Google Yellow). See [gcp-product-icons-and-colors.md](references/gcp-product-icons-and-colors.md).
- **Flow Line Semantics**:
  - PEP Primary Data Flows: Solid `#4285F4` arrows with solid arrowhead.
  - PDP Policy Calls: Dashed `#7986CB` arrows (`stroke-dasharray="4,3"`).
  - Sequence Badges: Circular numbered badges (`1`, `2`, `3`...) attached to every connection line. See [containment-and-layout-rules.md](references/containment-and-layout-rules.md) and [security-and-compliance-rules.md](references/security-and-compliance-rules.md).

## 7. Output Deliverables
- **High-Definition PNG Graphic (`diagram.png`)**: Generated via mandatory `generate_image` tool call following the 4-stage deep architecture execution protocol.
- **Presentation Workspace (`index.html`)**: HTML wrapper displaying `diagram.png` in a responsive viewer.
