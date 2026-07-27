#!/usr/bin/env python3
"""
GCP Architecture Diagram Skill Eval Validator
Validates SVG and HTML diagram outputs against official Google Cloud Architecture Center standards:
https://docs.cloud.google.com/static/architecture/images/multi-tenant-agentic-ai-system.svg
https://docs.cloud.google.com/static/architecture/images/rag-capable-gen-ai-app-gemini-enterprise-vertexai-detail.png
"""

import sys
import os
import json
import re
from xml.etree import ElementTree as ET

def validate_svg_file(svg_path):
    results = []
    if not os.path.exists(svg_path):
        return [{"id": "svg_exists", "pass": False, "evidence": f"File {svg_path} not found"}]
    
    with open(svg_path, 'r', encoding='utf-8') as f:
        content = f.read()

    # Check 1: Valid SVG XML
    try:
        root = ET.fromstring(content)
        is_svg = root.tag.endswith('svg')
        results.append({
            "id": "valid_svg_xml",
            "pass": is_svg,
            "evidence": "Successfully parsed SVG XML structure" if is_svg else "Root tag is not <svg>"
        })
    except Exception as e:
        results.append({"id": "valid_svg_xml", "pass": False, "evidence": f"XML parse error: {str(e)}"})

    # Check 2: viewBox attribute
    has_viewbox = 'viewBox=' in content or 'viewbox=' in content
    results.append({
        "id": "has_viewbox",
        "pass": has_viewbox,
        "evidence": "found viewBox attribute" if has_viewbox else "missing viewBox attribute"
    })

    # Check 3: Google Brand Header Block (#1A73E8)
    has_header = ('#1a73e8' in content.lower() and ('google' in content.lower() or 'architecture' in content.lower()))
    results.append({
        "id": "gcp_brand_header",
        "pass": has_header,
        "evidence": "Found Google Cloud header band with #1A73E8 title" if has_header else "Missing Google Cloud header band"
    })

    # Check 4: Multi-Project Container Nesting (#F6F6F6 fill, #BDBDBD stroke, rx="8")
    has_projects = '#f6f6f6' in content.lower() and '#bdbdbd' in content.lower() and 'rx="8"' in content.lower()
    results.append({
        "id": "gcp_project_containers",
        "pass": has_projects,
        "evidence": "Found isolated GCP Project containers (#F6F6F6 / #BDBDBD / rx=8)" if has_projects else "Missing GCP Project containers"
    })

    # Check 5: Regional VPC Network Containers (#ECEFF1 fill, #90A4AE stroke, rx="6")
    has_vpcs = '#eceff1' in content.lower() and '#90a4ae' in content.lower() and 'rx="6"' in content.lower()
    results.append({
        "id": "regional_vpc_containers",
        "pass": has_vpcs,
        "evidence": "Found Regional VPC Network containers (#ECEFF1 / #90A4AE / rx=6)" if has_vpcs else "Missing Regional VPC Network containers"
    })

    # Check 6: Subnet Isolation Zones (#EDE7F6 fill, #5E35B1 stroke, rx="4")
    has_subnets = '#ede7f6' in content.lower() and '#5e35b1' in content.lower() and 'rx="4"' in content.lower()
    results.append({
        "id": "subnet_isolation_zones",
        "pass": has_subnets,
        "evidence": "Found Subnet Isolation Zones (#EDE7F6 / #5E35B1 / rx=4)" if has_subnets else "Missing Subnet Isolation Zones"
    })

    # Check 7: Color Tokens (Compute, DB, Security, KMS)
    tokens_found = []
    if '#4284f3' in content.lower() or '#4285f4' in content.lower() or '#1a73e8' in content.lower():
        tokens_found.append("Compute (Google Blue)")
    if '#34a853' in content.lower():
        tokens_found.append("Database (Google Green)")
    if '#ea4335' in content.lower():
        tokens_found.append("Security (Google Red)")
    if '#f9ab00' in content.lower() or '#fef7e0' in content.lower() or '#b06000' in content.lower():
        tokens_found.append("KMS/Identity (Google Yellow)")

    results.append({
        "id": "gcp_color_tokens",
        "pass": len(tokens_found) >= 3,
        "evidence": f"Tokens present: {', '.join(tokens_found)}"
    })

    # Check 8: PEP / PDP Arrow semantics
    has_pep_blue = bool(re.search(r'stroke="#(4285F4|4284F3|1A73E8)"', content, re.I))
    has_pdp_dashed = 'stroke-dasharray' in content and '7986cb' in content.lower()
    results.append({
        "id": "pep_pdp_semantics",
        "pass": has_pep_blue and has_pdp_dashed,
        "evidence": f"PEP solid blue: {has_pep_blue}, PDP dashed indigo: {has_pdp_dashed}"
    })

    # Check 9: Numbered Sequence Badges
    has_badges = bool(re.search(r'<circle[^>]*r="[678910]"', content)) or ('badge' in content.lower())
    results.append({
        "id": "sequence_badges",
        "pass": has_badges,
        "evidence": "Found numbered sequence badges on lifelines" if has_badges else "No sequence badges found"
    })

    # Check 10: VPC-SC Security Perimeter
    has_perimeter = ('fce8e6' in content.lower() and 'ea4335' in content.lower()) and ('dash' in content.lower() or 'perimeter' in content.lower())
    results.append({
        "id": "vpc_sc_perimeter",
        "pass": has_perimeter,
        "evidence": "VPC-SC perimeter formatted with dashed red border" if has_perimeter else "No VPC-SC perimeter found"
    })

    # Check 11: Structured Product Cards (rx="4" or rx="3" cards with headers or badges)
    has_structured_cards = ('rx="4"' in content.lower() or 'rx="3"' in content.lower()) and ('fill="#ffffff"' in content.lower() or 'fill="#fff"' in content.lower())
    results.append({
        "id": "structured_product_cards",
        "pass": has_structured_cards,
        "evidence": "Found structured product cards with rounded corners and white fill" if has_structured_cards else "Missing structured product cards"
    })

    # Check 12: Standard Canvas Aspect Ratio / ViewBox Width (>= 1200)
    vb_match = re.search(r'viewBox=["\']0\s+0\s+(\d+)\s+(\d+)["\']', content, re.I)
    valid_canvas = bool(vb_match and int(vb_match.group(1)) >= 1200)
    results.append({
        "id": "canvas_aspect_ratio",
        "pass": valid_canvas,
        "evidence": f"Canvas width is {vb_match.group(1)}px (>= 1200px)" if vb_match else "ViewBox missing or width < 1200px"
    })

    return results


def main():
    if len(sys.argv) < 3:
        print("Usage: validate_eval.py <eval_id> <output_dir>")
        sys.exit(1)

    eval_id = sys.argv[1]
    output_dir = sys.argv[2]

    # Negative control checks
    if "neg" in eval_id:
        svg_files = [f for f in os.listdir(output_dir) if f.endswith('.svg')] if os.path.exists(output_dir) else []
        passed = len(svg_files) == 0
        res = [{
            "id": "negative_control_passed",
            "pass": passed,
            "evidence": f"Zero SVG diagrams generated (correct behavior for negative control)" if passed else f"Unexpectedly generated {svg_files}"
        }]
    else:
        svg_file = os.path.join(output_dir, "diagram.svg")
        if not os.path.exists(svg_file):
            svg_files = [os.path.join(output_dir, f) for f in os.listdir(output_dir) if f.endswith('.svg')] if os.path.exists(output_dir) else []
            svg_file = svg_files[0] if svg_files else svg_file

        res = validate_svg_file(svg_file)

    passed_count = sum(1 for r in res if r["pass"])
    total_count = len(res)
    pass_rate = round(passed_count / total_count, 2) if total_count > 0 else 0.0

    summary = {
        "eval_id": eval_id,
        "passed": passed_count,
        "total": total_count,
        "pass_rate": pass_rate,
        "checks": res
    }

    print(json.dumps(summary, indent=2))

if __name__ == "__main__":
    main()
