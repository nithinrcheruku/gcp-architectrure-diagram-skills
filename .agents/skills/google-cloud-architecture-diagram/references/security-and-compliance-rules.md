# Security, Privacy & Compliance (SPC) Diagram Protocol

This reference provides a zero-trust, security-first audit framework for Google Cloud architecture diagrams ([SKILL.md](../SKILL.md) & [AGENTS.md](../../../../AGENTS.md)).

---

## 1. Zero-Trust Security Checklist for Architecture Diagrams

Every architecture diagram produced by agents must be evaluated against the following SPC checklist:

### A. Trust Boundaries & Perimeters
* [ ] **Internet Ingress Perimeter**: External Application Load Balancers, Cloud Armor WAF, Model Armor.
* [ ] **VPC Service Controls (VPC-SC)**: Explicit perimeter line (`stroke="#EA4335"`, `stroke-dasharray="5,3"`).
* [ ] **Principal Access Boundary (PAB)**: Identity boundary restricting agent execution service accounts.
* [ ] **Compute Sandboxing**: MicroVM / gVisor sandbox boundary around agent runtimes.

### B. Path Semantics & Policy Enforcement
* [ ] **PEP (Policy Enforcement Point) Primary Data Flow**:
  * Style: Solid 2pt line, `#4285F4` (Google Blue) or `#202124`.
  * Meaning: Direct data execution path subject to inline enforcement.
* [ ] **PDP (Policy Decision Point) Policy Verification**:
  * Style: Dashed 1.5pt line (`stroke-dasharray="4,3"`), `#7986CB` (Indigo).
  * Meaning: Asynchronous or out-of-band policy lookup to Agent Registry / IAM.
* [ ] **Default-Deny Egress Path**:
  * Style: Solid 2pt line through Egress Gateway PEP proxy before hitting external tool endpoints.

---

## 2. Multi-Tenant Isolation Architectural Standards

When diagramming multi-tenant architectures (Bridge, Pooled, or Silo patterns):

1. **Control Plane vs. Data Plane Separation**:
   * Control Plane services (Agent Registry, AgentOps, Billing) MUST reside in an ISV Administrative GCP Project.
   * Data Plane runtimes MUST execute in isolated Compute Spokes or tenant-specific sandboxes.
2. **Tenant Data Isolation**:
   * Row-level security / tenant-key CMEK encryption explicitly indicated on datastores.
   * KMS CMEK Key Rings drawn with Google Yellow token (`fill="#FEF7E0"`, `stroke="#F9AB00"`).

---

## 3. Sequential Transaction Lifeline Badges

To prevent ambiguity in complex branching flows, every connection arrow MUST feature a numbered sequence badge:

```xml
<!-- Badge Definition -->
<circle cx="315" cy="134" r="8" fill="#4285F4"/>
<text x="315" y="137" font-size="8" font-weight="700" fill="#FFFFFF" text-anchor="middle">1</text>
```

* **Sequence Sequence**:
  1. Client $\rightarrow$ Cloud Armor / ALB (Authentication & Ingress WAF)
  2. ALB $\rightarrow$ Ingress Agent Gateway PEP (Default-Deny Ingress Proxy)
  3. Ingress PEP $\rightarrow$ Agent Registry PDP (Policy & Token Verification)
  4. Ingress PEP $\rightarrow$ Compute Spoke / GKE MicroVM Sandbox (Agent Runtime)
  5. Agent Runtime $\rightarrow$ Egress Agent Gateway PEP (Tool Call Inspection)
  6. Egress PEP $\rightarrow$ MCP Tool Server / External API
  7. Agent Runtime $\rightarrow$ Datastore (Tenant CMEK Encrypted Query)
