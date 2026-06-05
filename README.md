# OT Vulnerability Assessment Lab

A self-contained, single-file interactive web app for **OT/ICS vulnerability assessment** — built in the spirit of the Breakwater discovery console. Demonstrates the Chapter 3 (Phase 3) workflow: CPE→CVE association, CVSS interpretation, scanner adapters, risk prioritization, evidence discipline, framework mapping, and remediation tracking.

**Live demo:** open `index.html` — no build step, no dependencies, no network calls.

## Workspaces

- **Overview** — real-time command center: KPI cards, Purdue-zoned network map, discovery ring, protocol donut, attack path, risk gauge
- **CVE / NVD Lookup** — CPE→CVE with cache + rate-limit backoff
- **CVSS Interpreter** — live vector parsing, severity bands, CWE
- **Scanner Adapters** — OpenVAS/GMP lifecycle + Nuclei JSONL
- **Default Credentials** — multi-protocol checks with guardrails
- **Risk Prioritization** — severity + EPSS + KEV + exposure + role
- **Evidence & Validation** — candidate vs confirmed, suppression
- **Coverage & Provenance** — per-method status and gaps
- **Frameworks & Controls** — NIST CSF 2.0, SP 800-53, IEC 62443, MITRE ATT&CK for ICS
- **Live Data & Forwarders** — feeds (NVD/KEV/EPSS) + Syslog/Splunk/Sentinel forwarders
- **Remediation Tracker** — kanban workflow with owners, SLA, backlinks
- **AI / MCP Guide**, **Topology**, **Safety Posture**, **Inventory**

## Features

- Light / dark theme (persisted) · plain-English explainer on every page
- Three-level drill-down drawer (asset → CVE → CVSS interpreter)
- ⌘K / Ctrl+K command palette · toast feedback · responsive
- Hardened: Content-Security-Policy, XSS-escaped inputs, no network egress

## Tech

Pure HTML + CSS + vanilla JS in one file. Inline SVG for all data-viz. Zero external dependencies.

> Educational / training fixture. The simulator data is synthetic; no live network is scanned.
