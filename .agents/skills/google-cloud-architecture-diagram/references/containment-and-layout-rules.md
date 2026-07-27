# Containment, Dynamic Geometry & Layout Rules

This reference defines the mathematical, tree-based, and spatial layout rules for constructing Google Cloud architecture diagrams matching official Google Cloud Architecture Center standards ([SKILL.md](../SKILL.md)).

---

## 1. Multi-Project Hub-and-Spoke Tree Protocol

Every publication-grade diagram **MUST** construct a 5-level nested parent-child hierarchy tree:

```
Root Canvas (Layer 0: viewBox 0 0 1280 820)
└── Google Cloud Header Band (Layer 1: #1A73E8)
    ├── Routing Hub GCP Project (Layer 2: #F6F6F6 / #BDBDBD)
    │   └── Regional Hub VPC (Layer 3: #ECEFF1 / #90A4AE)
    │       ├── Ingress Edge Subnet (Layer 4: #EDE7F6 / #5E35B1)
    │       │   ├── Cloud Armor WAF Card (#FCE8E6 / #EA4335)
    │       │   └── Identity-Aware Proxy (IAP) Card (#FEF7E0 / #F9AB00)
    │       └── Gateway Routing Subnet (Layer 4: #EDE7F6 / #5E35B1)
    │           └── Ingress Agent Gateway PEP Card (#FFFFFF / #4284F3)
    ├── Tenant Spoke GCP Project A (Layer 2: #F6F6F6 / #BDBDBD)
    │   └── Regional Tenant VPC (Layer 3: #ECEFF1 / #90A4AE)
    │       └── VPC-SC Perimeter Container (Layer 4: #FCE8E6 / #EA4335 dashed)
    │           ├── Compute Sandbox Subnet (Layer 5: #EDE7F6 / #5E35B1)
    │           │   ├── Cloud Run gVisor Sandbox (#FFFFFF / #4284F3)
    │           │   └── Egress Agent Gateway PEP (#FCE8E6 / #EA4335)
    │           └── Tenant Datastore Subnet (Layer 5: #EDE7F6 / #5E35B1)
    │               ├── AlloyDB Row Isolation Node (#FFFFFF / #34A853)
    │               └── BigQuery Vector Search Node (#FFFFFF / #34A853)
    └── Central Governance Hub GCP Project (Layer 2: #F6F6F6 / #BDBDBD)
        └── Regional Management VPC (Layer 3: #ECEFF1 / #90A4AE)
            ├── Security & KMS Subnet (Layer 4: #EDE7F6 / #5E35B1)
            │   ├── Cloud KMS CMEK Key Ring Card (#FEF7E0 / #F9AB00)
            │   └── Security Command Center Premium (#FCE8E6 / #EA4335)
            └── Audit & Analytics Subnet (Layer 4: #EDE7F6 / #5E35B1)
                └── Cloud Logging & Audit Sink (#FFFFFF / #34A853)
```

---

## 2. Containment Rules & Geometry Calculations

1. **100% Visual Containment**: All child cards and subnets **MUST** sit completely inside parent boundaries ($x_{\text{child}} \ge x_{\text{parent}} + \text{margin}$, $x_{\text{child}} + w_{\text{child}} \le x_{\text{parent}} + w_{\text{parent}} - \text{margin}$).
2. **5-Level Layer Invariance**:
   - `Layer 1`: Google Cloud Header (`#1A73E8`)
   - `Layer 2`: GCP Projects (`#F6F6F6` fill, `#BDBDBD` stroke, `rx="8"`)
   - `Layer 3`: Regional VPCs (`#ECEFF1` fill, `#90A4AE` stroke, `rx="6"`)
   - `Layer 4`: Subnet Zones (`#EDE7F6` fill, `#5E35B1` stroke, `rx="4"`)
   - `Layer 5`: VPC-SC Perimeter (`#FCE8E6` fill, `#EA4335` stroke `stroke-dasharray="5,3"`, `rx="6"`)
3. **Dynamic Coordinate Offsets**:
   $$x_{i+1} = x_i + w_i + \text{gap}_x \quad (\text{where } \text{gap}_x \ge 25\text{px})$$
   $$y_{j+1} = y_j + h_j + \text{gap}_y \quad (\text{where } \text{gap}_y \ge 20\text{px})$$
4. **Parent Bounds Bottom-Up Calculation**:
   $$\text{parent\_x} = \min(x_{\text{children}}) - 20\text{px}$$
   $$\text{parent\_y} = \min(y_{\text{children}}) - 35\text{px}$$
   $$\text{parent\_width} = (\max(x_{\text{children}} + w) - \min(x_{\text{children}})) + 40\text{px}$$
   $$\text{parent\_height} = (\max(y_{\text{children}} + h) - \min(y_{\text{children}})) + 55\text{px}$$

---

## 3. Flow Lines, Arrowheads & Numbered Badges

```xml
<defs>
  <!-- PEP Data Flow Arrowhead -->
  <marker id="ar-pep" viewBox="0 0 10 10" refX="8" refY="5" markerWidth="6" markerHeight="6" orient="auto-start-reverse">
    <path d="M0,0 L10,5 L0,10 z" fill="#4285F4"/>
  </marker>
  <!-- PDP Policy Decision Arrowhead -->
  <marker id="ar-pdp" viewBox="0 0 10 10" refX="8" refY="5" markerWidth="6" markerHeight="6" orient="auto-start-reverse">
    <path d="M0,0 L10,5 L0,10 z" fill="#7986CB"/>
  </marker>
</defs>

<!-- PEP Primary Data Path (Solid Blue Line + Sequence Badge 1) -->
<line x1="350" y1="217" x2="350" y2="490" stroke="#4285F4" stroke-width="2" marker-end="url(#ar-pep)"/>
<circle cx="350" cy="380" r="10" fill="#4285F4"/>
<text x="350" y="384" font-size="9" font-weight="700" fill="#FFFFFF" text-anchor="middle">1</text>

<!-- PDP Policy Call Path (Dashed Indigo Line + Sequence Badge 2) -->
<line x1="215" y1="545" x2="215" y2="560" stroke="#7986CB" stroke-width="1.5" stroke-dasharray="4,3" marker-end="url(#ar-pdp)"/>
<circle cx="230" cy="552" r="8" fill="#7986CB"/>
<text x="230" y="555" font-size="8" font-weight="700" fill="#FFFFFF" text-anchor="middle">2</text>
```
