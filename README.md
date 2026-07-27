# Google Cloud Architecture Diagram Skill for Antigravity

[![Google Cloud Architecture Center](https://img.shields.io/badge/GCP-Architecture%20Center-4285F4?logo=google-cloud&logoColor=white)](https://docs.cloud.google.com/architecture)
[![Google Antigravity](https://img.shields.io/badge/Antigravity-2.0%20%26%20CLI%20Compatible-1A73E8)](https://antigravity.google)

This repository contains official, standard-compliant skills, reference specifications, product category icons, and automated evaluation frameworks for generating, auditing, and optimizing publication-quality **Google Cloud Architecture Diagrams** grounded in official [Google Cloud Architecture Center](https://docs.cloud.google.com/architecture) standards.

---

## 🚀 Quick Start: 1-Click Automated Installer

Install this skill across all Antigravity platforms (**Antigravity 2.0 Desktop App**, **Antigravity IDE**, and the **`agy` CLI**) in under 10 seconds:

```bash
git clone https://github.com/your-org/gcp-architecture-diagram-skills.multiagent-ai-system.git
cd gcp-architecture-diagram-skills
./install.sh
```

> **What `./install.sh` does**: It automatically detects your global Antigravity directories (`~/.gemini/config/skills/`, `~/.gemini/antigravity/skills/`, `~/.gemini/antigravity-cli/skills/`) and creates symlinks so that the skill is available globally across **all** your projects without copying files.

---

## 🖥️ Surface-Specific Setup & Usage Instructions

### 1. Antigravity 2.0 (Desktop Application & Antigravity IDE)

#### Installation:
Run `./install.sh` from your terminal. The script registers the skill at `~/.gemini/antigravity/skills/google-cloud-architecture-diagram`.

#### How to Use in Antigravity 2.0 UI:
1. Open **Antigravity 2.0** or **Antigravity IDE**.
2. Open the AI Chat Sidebar or launch a conversation turn.
3. Simply ask Antigravity in plain English:
   > *"Draw a publication-quality GCP architecture diagram for my multi-tenant agentic AI system with Cloud Run and AlloyDB."*
4. Or explicitly invoke the skill using the dollar sign:
   > *"$google-cloud-architecture-diagram draw a hub-and-spoke VPC network on Google Cloud"*
5. **View Results**: Antigravity will generate the diagram and display the interactive HTML canvas directly inside the **HTML Auxiliary Pane** / **Artifact Viewer**.

---

### 2. Antigravity CLI (`agy` Terminal)

#### Installation:
Run `./install.sh` in your terminal. The script registers the skill at `~/.gemini/antigravity-cli/skills/google-cloud-architecture-diagram`.

#### How to Use in the Terminal (`agy`):

##### Interactive TUI Mode:
1. Launch the CLI:
   ```bash
   agy
   ```
2. Check loaded skills in the TUI:
   ```text
   agy> /skills
   ```
3. Request a diagram:
   ```text
   agy> Draw a zero-trust GCP architecture diagram with Cloud Armor, Cloud Run gVisor sandboxes, and a VPC Service Controls perimeter.
   ```

##### One-Shot Command Line Execution:
Generate diagrams directly from single shell commands:

```bash
# Generate architecture from prompt
agy "Draw a GCP RAG pipeline diagram with Vertex AI Vector Search and BigQuery"

# Auto-scan infrastructure code in current repo
agy "$google-cloud-architecture-diagram analyze terraform files in ./infra"
```

---

### 3. Project-Local Usage (Zero-Config)

If you prefer installing the skill strictly inside a single codebase rather than globally:

1. Copy or clone `.agents/skills/google-cloud-architecture-diagram` into your project's `.agents/skills/` directory:
   ```bash
   mkdir -p /path/to/my-project/.agents/skills
   cp -R .agents/skills/google-cloud-architecture-diagram /path/to/my-project/.agents/skills/
   ```
2. Open `/path/to/my-project` in Antigravity or launch `agy` inside that directory. Antigravity auto-discovers workspace skills automatically.

---

## 🧰 Installer Commands Reference (`install.sh`)

| Command | Action |
| :--- | :--- |
| `./install.sh` | **(Default)** Symlinks skill globally across Antigravity 2.0, IDE, and `agy` CLI |
| `./install.sh --copy` | Copies skill files globally instead of symlinking |
| `./install.sh -w /path/to/project` | Installs skill locally into a specific project workspace |
| `./install.sh --uninstall` | Removes the skill from global Antigravity directories |
| `./install.sh --help` | Displays help options |

---

## 🛠️ Operating Modes & Key Capabilities

### Mode A: Infrastructure Auto-Scanning ("scan", "analyze", "from code")
Point Antigravity at your Terraform (`*.tf`), Kubernetes manifests (`*.yaml`), or Cloud Run specs to extract topology and render a grounded diagram:

```bash
agy "Analyze terraform files in ./terraform and generate a Google Cloud architecture diagram"
```

### Mode B: Interactive Architectural Design & Brainstorming
Brainstorm topologies, zero-trust perimeters, and PEP/PDP data paths interactively with Antigravity:

```bash
agy "Draw a zero-trust Generative AI RAG architecture on GCP featuring Vertex AI, Vector Search, Cloud Armor, and a VPC Service Controls perimeter."
```

---

## 📊 Automated Evaluation & Quality Assurance Framework

This repository includes an automated 12-scenario benchmark suite and SVG assertion validator (`validate_eval.py`) that checks generated diagrams against 10 strict GCP design rules (5-tier container hierarchy, color tokens, PEP/PDP arrow semantics, sequence badges, and VPC-SC perimeters).

To run the automated validator:

```bash
python3 .agents/skills/google-cloud-architecture-diagram/evals/scripts/validate_eval.py <eval_id> <output_directory>
```

Example:
```bash
python3 .agents/skills/google-cloud-architecture-diagram/evals/scripts/validate_eval.py eval-01-explicit-agentic ./evals/files
```

---

## 📖 Architecture Reference Documentation

For detailed information on the design standards enforced by this skill, refer to:
- [AGENTS.md](AGENTS.md) — Primary operational guide and skill optimization engine for AI agents.
- [SKILL.md](.agents/skills/google-cloud-architecture-diagram/SKILL.md) — Main skill definition file.
- [Containment & Layout Rules](.agents/skills/google-cloud-architecture-diagram/references/containment-and-layout-rules.md)
- [GCP Product Icons & Colors](.agents/skills/google-cloud-architecture-diagram/references/gcp-product-icons-and-colors.md)
- [Security & Compliance Rules](.agents/skills/google-cloud-architecture-diagram/references/security-and-compliance-rules.md)
