# AGENTS.md - GCP Architecture Diagram Skills & Evals Operating Guide

> **Repository Mission**: This repository houses official, standard-compliant skills, reference documentation, icon assets, and automated evaluation frameworks for generating, auditing, and optimizing publication-quality **Google Cloud Architecture Diagrams** grounded in official [Google Cloud Architecture Center](https://docs.cloud.google.com/architecture) guidelines.

---

## 1. Executive Summary & Repository Map

AI Agents operating in this codebase or utilizing these skills MUST follow the rules, color schemes, containment geometry, and evaluation protocols defined herein.

```
/Users/nrcheruku/sourcecode/work/gcp-architectrure-diagram-skills/
├── AGENTS.md                                                  # [This File] Primary operational guide for AI agents
├── README.md                                                  # User documentation & installation guide
├── install.sh                                                 # 1-Click Antigravity installer script
├── evals/                                                     # Benchmark Evaluation & Validation Framework
│   ├── evals.json                                             # 12 Benchmark Scenarios (Explicit, Implicit, Noisy, Neg)
│   ├── style-rubric.schema.json                               # Schema for Eval Assertions
│   ├── resources/                                             # Benchmark Reference Images (Agentic AI, RAG)
│   │   ├── multiagent-ai-system-architecture.png
│   │   └── gen-ai-rag-vertex-ai-vector-search-detailed-architecture.png
│   ├── scripts/
│   │   └── validate_eval.py                                   # Automated 12-Check SVG Assertion Validator
│   └── files/
│       └── terraform/main.tf                                  # Terraform sample for IaC auto-scan testing
└── .agents/
    └── skills/
        └── google-cloud-architecture-diagram/                 # Runtime Skill Package (Universal & Self-Contained)
            ├── SKILL.md                                       # Universal Skill Definition & Trigger Instructions
            ├── references/                                    # Grounded Technical Reference Specifications
            │   ├── containment-and-layout-rules.md           # 5-Tier Hierarchy, Geometry Math, Line Semantics
            │   ├── gcp-product-icons-and-colors.md           # Official GCP Color Tokens, Fonts, Cards
            │   ├── security-and-compliance-rules.md          # Zero-Trust, VPC-SC, PEP/PDP, Sequence Badges
            │   └── export-and-codebase-parser.md             # IaC Scanner (TF/K8s/Run) & Multi-Format Exporters
            ├── resources/                                     # Grounding Technical Specifications & PDFs
            │   └── ArchitectureDS.pdf                         # Google Cloud Diagram Style Guide V2.5 Specification
            └── assets/                                        # Official GCP Product Category Icons
                └── category-icons/                            # 26 Product Category Icons (SVG & 512x512 PNG)
```


---

## 2. GCP Branding & Architecture Grounding Baseline

All generated diagrams MUST adhere to official Google Cloud Architecture Center design standards (V2.5 Style Guide). Agents MUST enforce the following core baseline:

### A. 5-Level Mandatory Container Hierarchy
Every diagram must build a 5-level nested parent-child visual hierarchy:

| Level | Container Name | Fill Color | Stroke Color | Stroke Style | Corner Radius | Heading Style |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Layer 1** | **Google Cloud Header Band** | `#1A73E8` | None | Solid Band (`h=40`) | Square | White 14pt Bold |
| **Layer 2** | **GCP Project Container** | `#F6F6F6` | `#BDBDBD` | Solid `1.5pt` | `8px` (`rx="8"`) | `#5F6368` 10pt Uppercase Bold |
| **Layer 3** | **Regional VPC Network** | `#ECEFF1` | `#90A4AE` | Solid `1pt` | `6px` (`rx="6"`) | `#202124` 12pt Normal |
| **Layer 4** | **Subnet Isolation Zone** | `#EDE7F6` | `#5E35B1` | Solid `1pt` | `4px` (`rx="4"`) | `#5E35B1` 11pt Bold |
| **Layer 5** | **VPC-SC Perimeter** | `#FCE8E6` | `#EA4335` | Dashed `stroke-dasharray="5,3"` | `4px` (`rx="4"`) | `#EA4335` 9pt Uppercase Bold |

### B. Product Category Color Tokens
Every product node or card MUST use its official GCP category stroke and fill token:

* **Compute & Serverless** (Cloud Run, GKE, Functions): Fill `#FFFFFF`, Stroke `#4284F3` (Google Blue), Text `#1A56C4`.
* **Databases & Storage** (AlloyDB, BigQuery, Cloud SQL, Spanner): Fill `#FFFFFF`, Stroke `#34A853` (Google Green), Text `#1E7B34`.
* **Security & Network Security** (Cloud Armor, Model Armor, WAF, IAP): Fill `#FCE8E6`, Stroke `#EA4335` (Google Red), Text `#C5221F`.
* **Security / KMS / Identity** (Cloud KMS CMEK, IAM, Secret Manager): Fill `#FEF7E0`, Stroke `#F9AB00` (Google Yellow), Text `#B06000`.
* **AI & Agent Platform** (Vertex AI, Agent Runtime, Gemini API): Fill `#FFFFFF`, Stroke `#1A73E8` (Google Dark Blue).

### C. Line Semantics & Transaction Lifelines
* **PEP (Policy Enforcement Point) Primary Data Path**: Solid `#4285F4` (2pt width) with solid blue arrowhead (`#4285F4`).
* **PDP (Policy Decision Point) Policy Call**: Dashed `#7986CB` (1.5pt width, `stroke-dasharray="4,3"`) with indigo arrowhead (`#7986CB`).
* **Numbered Sequence Badges**: Every flow arrow MUST feature a numbered circular badge (`<circle r="8">`, fill matching arrow color, white 8pt bold centered number) indicating execution step order (`1`, `2`, `3`...).

---

## 3. Skill Execution Protocols & Modes

Agents invoking or maintaining `google-cloud-architecture-diagram` must support two operational execution modes:

### Mode A: Infrastructure Auto-Scanning ("scan", "analyze", "from code")
1. Search target repository for IaC assets in priority order:
   - **Terraform** (`*.tf`): Extract `google_compute_*`, `google_sql_*`, `google_cloud_run_*`, `google_container_cluster`, `google_kms_*`.
   - **Kubernetes Manifests / Helm** (`*.yaml`): Extract deployments, gVisor runtime classes, network policies.
   - **Serverless Specs** (`service.yaml`): Extract Cloud Run services, IAM invokers, VPC access connectors.
2. Infer parent containment (Project ID $\rightarrow$ VPC $\rightarrow$ Subnet $\rightarrow$ VPC-SC).
3. Generate grounded SVG and interactive HTML canvas reflecting extracted architecture.

### Mode B: Interactive Design & Architectural Brainstorming
1. Query `google-developer-knowledge` MCP server (`search_documents`) for relevant GCP Architecture Center topologies.
2. Propose multi-project Hub-and-Spoke layout (Routing Hub Project, Tenant Spoke Projects, Governance Hub Project).
3. Render SVG/HTML diagram grounded in zero-trust PEP/PDP transaction lifelines.

---

## 4. Evaluation Framework & Skill Optimization Engine

This repository provides an automated benchmark evaluation engine to continuously test and optimize GCP architecture diagram skills.

### A. Eval Benchmark Suite (`evals/evals.json`)
The evaluation suite contains 12 scenario benchmarks covering 4 distinct typologies:

1. **Explicit Invocation** (e.g. `eval-01-explicit-agentic`, `eval-02-explicit-autoscan`): Explicitly mentions `$google-cloud-architecture-diagram` or `analyze`.
2. **Implicit Trigger** (e.g. `eval-03-implicit-zerotrust` through `eval-07-implicit-secfoundations`): Natural language architectural requests that must trigger the skill.
3. **Contextual Noisy** (e.g. `eval-08-noisy-agentic`, `eval-09-noisy-terraform`): Messy, unstructured user notes containing technical GCP specs.
4. **Negative Controls** (e.g. `eval-10-neg-codefix`, `eval-11-neg-aws`, `eval-12-neg-concept`): Technical prompts that MUST NOT trigger the GCP diagram skill (e.g., Python code fixes, AWS infrastructure, text explanations).

### B. Automated Assertion Validator (`evals/scripts/validate_eval.py`)
Run the automated validator on generated output directories:

```bash
python3 evals/scripts/validate_eval.py <eval_id> <output_dir>
```

#### The 14 Automated Assertion Checks:
1. `valid_svg_xml`: Valid XML structure and `<svg>` root tag.
2. `has_viewbox`: Contains explicit `viewBox` attribute (e.g., `viewBox="0 0 1280 820"`).
3. `gcp_brand_header`: Includes Google Blue (`#1A73E8`) header title band.
4. `gcp_project_containers`: Contains GCP Project containers (`#F6F6F6` fill, `#BDBDBD` stroke, `rx="8"`).
5. `regional_vpc_containers`: Contains Regional VPC containers (`#ECEFF1` fill, `#90A4AE` stroke, `rx="6"`).
6. `subnet_isolation_zones`: Contains Subnet zones (`#EDE7F6` fill, `#5E35B1` stroke, `rx="4"`).
7. `gcp_color_tokens`: Uses at least 3 distinct GCP product category color families.
8. `pep_pdp_semantics`: Uses solid blue `#4285F4` for PEP flows and dashed indigo `#7986CB` for PDP policy calls.
9. `sequence_badges`: Contains numbered sequence badges on interaction arrows.
10. `vpc_sc_perimeter`: Contains VPC Service Controls red dashed perimeter (`#EA4335` / `#FCE8E6`).
11. `structured_product_cards`: Uses structured publication cards with white fill and rounded corners (`rx="4"`/`rx="3"`).
12. `canvas_aspect_ratio`: Enforces full-resolution canvas viewBox width ($\ge 1200\text{px}$).
13. `gemini_pro_image_artifact`: Generates high-definition PNG image artifact via `generate_image` tool (Gemini Pro / Imagen 3).
14. `html_presentation_canvas`: Generates interactive `index.html` presentation canvas.



### C. Skill Optimization Lifecycle for Agents
When modifying or adding GCP architecture diagram skills:

```
┌─────────────────────────────────────────────────────────┐
│ 1. Formulate / Update Prompt Rules in SKILL.md           │
└───────────────────────────┬─────────────────────────────┘
                            │
                            ▼
┌─────────────────────────────────────────────────────────┐
│ 2. Run Eval Suite Scenarios                             │
└───────────────────────────┬─────────────────────────────┘
                            │
                            ▼
┌─────────────────────────────────────────────────────────┐
│ 3. Execute validate_eval.py Assertion Checks            │
└───────────────────────────┬─────────────────────────────┘
                            │
            ┌───────────────┴───────────────┐
            │ Pass Rate < 100%?             │
            └───────┬───────────────┬───────┘
                YES │               │ NO
                    ▼               ▼
┌───────────────────────────┐   ┌─────────────────────────┐
│ Inspect Failure Evidence  │   │ Commit Skill & Evals    │
│ Refine SKILL.md / Rules   │   │ Baseline Passed (1.0)   │
└───────────┬───────────────┘   └─────────────────────────┘
            │
            └───────────────────────┘
```

---

## 5. Agent Quality Assurance & Pre-Flight Checklist

Before outputting any SVG, HTML, or updated skill rule, verify:

* [ ] **Containment**: Every child card sits $100\%$ inside its parent Subnet, VPC, and Project container bounds.
* [ ] **Header Band**: `<rect x="0" y="0" width="1280" height="40" fill="#1A73E8"/>` is present with white Google Cloud title.
* [ ] **Color Accuracy**: Compute = Blue `#4284F3`, DB = Green `#34A853`, Security = Red `#EA4335`, KMS = Yellow `#F9AB00`.
* [ ] **Line Distinction**: Solid blue arrows for PEP data path; dashed indigo arrows (`stroke-dasharray="4,3"`) for PDP policy calls.
* [ ] **Sequence Badges**: Every arrow has a numbered circle badge.
* [ ] **Perimeter**: Red dashed box (`#EA4335`, `stroke-dasharray="5,3"`) surrounds VPC-SC workloads.
* [ ] **Eval Verification**: Run `validate_eval.py` to confirm $100\%$ pass rate across all checks.
