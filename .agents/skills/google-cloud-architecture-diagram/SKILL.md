---
name: google-cloud-architecture-diagram
description: Generates publication-quality, standard-compliant Google Cloud architecture diagrams (SVG, HTML, DOT, Mermaid, or PNG) grounded in official Google Cloud Architecture Center standards (docs.cloud.google.com/architecture). Enforces multi-project, multi-VPC, regional zone, and VPC-SC perimeter nesting matching multi-tenant-agentic-ai-system.svg.
argument-hint: "[describe architecture or say 'analyze' to scan codebase]"
---

# Google Cloud Architecture Diagram Skill

Generates publication-quality Google Cloud architecture diagrams complying strictly with official [Google Cloud Architecture Center](https://docs.cloud.google.com/architecture) publications (specifically [`multi-tenant-agentic-ai-system.svg`](https://docs.cloud.google.com/static/architecture/images/multi-tenant-agentic-ai-system.svg) and [`rag-capable-gen-ai-app-gemini-enterprise-vertexai-detail.png`](https://docs.cloud.google.com/static/architecture/images/rag-capable-gen-ai-app-gemini-enterprise-vertexai-detail.png)). See [AGENTS.md](../../../AGENTS.md) for master repo guidelines and eval frameworks.

## 1. When NOT to Use This Skill (Negative Controls)
- Do NOT trigger for generic programming code fixes (e.g. fixing Python syntax, writing unit tests).
- Do NOT trigger for non-GCP cloud providers (e.g. AWS S3/DynamoDB or Azure infrastructure).
- Do NOT trigger for pure text conceptual questions where no visual architecture diagram is requested.

## 2. Mandatory Multi-Tier Container Hierarchy (100% GCP Center Baseline)

Every generated diagram MUST render the full 5-level nested GCP container hierarchy:
1. **Google Cloud Header Block**: Google Blue (`#1A73E8`) top title band (`height="40"`).
2. **GCP Project Containers**: Isolated GCP Projects (`#F6F6F6` fill, `#BDBDBD` stroke, `rx="8"`) representing **Routing Hub Project**, **Tenant Spoke Projects**, and **Central Governance Hub Project**.
3. **Regional VPC Networks**: Regional VPC containers (`#ECEFF1` fill, `#90A4AE` stroke, `rx="6"`) with region labels (e.g., `REGION: us-central1 (VPC Network)`).
4. **VPC Subnet Isolation Zones**: Subnet containers (`#EDE7F6` fill, `#5E35B1` stroke, `rx="4"`) with zone labels (e.g., `VPC Subnet: Compute Sandbox Zone`).
5. **VPC Service Controls (VPC-SC) Perimeters**: Red dashed perimeters (`#FCE8E6` fill, `#EA4335` stroke, `stroke-dasharray="5,3"`) enfolding tenant data & compute workloads.

## 3. Operating Modes & Grounding

### Mode A: Codebase Infrastructure Analysis ("scan", "analyze", "from code")
1. Search codebase for Terraform (`*.tf`), K8s manifests, Cloud Run (`service.yaml`), or Helm. See [export-and-codebase-parser.md](references/export-and-codebase-parser.md).
2. Extract project boundaries, subnets, database connections, and IAM roles.
3. Map resources into Hub-and-Spoke GCP Project containers using official category tokens.

### Mode B: Interactive Design & Brainstorming
1. Query `google-developer-knowledge` MCP server (`search_documents`) for relevant GCP Architecture Center topologies (`multi-tenant-agentic-ai-system`, `rag-capable-gen-ai-app-gemini-enterprise-vertexai-detail`, `security-foundations`).
2. Propose multi-tenant Hub-and-Spoke project layout, PEP/PDP enforcement points, and datastore isolation strategy.

## 4. Color Tokens & Line Semantics

- **Product Category Tokens**:
  - Compute / Serverless: Fill `#FFFFFF`, Stroke `#4284F3` (Google Blue).
  - Databases / Storage: Fill `#FFFFFF`, Stroke `#34A853` (Google Green).
  - Security / WAF / Gateway: Fill `#FCE8E6`, Stroke `#EA4335` (Google Red).
  - KMS / Identity / PAB: Fill `#FEF7E0`, Stroke `#F9AB00` (Google Yellow). See [gcp-product-icons-and-colors.md](references/gcp-product-icons-and-colors.md).
- **Flow Line Semantics**:
  - PEP Data Flows: Solid `#4285F4` arrows.
  - PDP Policy Calls: Dashed `#7986CB` arrows (`stroke-dasharray="4,3"`).
  - Sequence Badges: Circular numbered badges (`1`, `2`, `3`...) attached to every connection line. See [containment-and-layout-rules.md](references/containment-and-layout-rules.md) and [security-and-compliance-rules.md](references/security-and-compliance-rules.md).

## 5. Output Deliverables
- Standalone valid SVG (`viewBox="0 0 1280 820"`).
- Interactive HTML in `index.html`.
- High-definition PNGs generated via `generate_image` anchored by local assets in `assets/category-icons/`.
