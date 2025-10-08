---
title: Governance
---

# Governance

## Overview

This document outlines the governance structure for the VTubers.TV project. The platform follows an **Owner-Led Model**, where the founders maintain final authority over all decisions while encouraging community participation and contribution. It defines roles, decision-making processes, and how the community can provide input.

---

## Governance Structure

### Owners

- **Owners**: The project is led by the founders (Lexi and Lmay), who have the final say on all decisions.
- Responsible for setting the vision, making strategic and technical decisions, approving features, and resolving disputes.
- May delegate responsibilities to trusted maintainers or contributors but retain ultimate authority.

### Maintainers & Contributors

- **Maintainers**: Trusted contributors with commit access, selected by the owners based on merit, expertise, and community trust. They review PRs, mentor contributors, and propose features or policies.
- **Contributors**: Anyone who submits PRs, issues, or participates in discussions. Contributions are welcomed and reviewed on merit.

---

## Decision-Making

- Owners have the **final say** on all decisions: technical, strategic, and governance-related.
- **Community input is strongly encouraged**: Major changes (features, policies, governance) are discussed publicly via GitHub, Discord, or RFCs.
- Maintainers provide recommendations and reviews to assist owners.
- Owners consider feedback but are **not bound by votes or consensus**.
- Advisory polls or public discussions may be used for guidance, but owners retain veto power.

---

## Contributor Model

VTubers.TV uses a **meritocratic, owner-led model**:

1. **Contributors**: Anyone can submit PRs/issues or participate in discussions.
2. **Maintainers**: Contributors who demonstrate high-quality, sustained contributions and are granted commit access by the owners.
3. **Owners**: Founders with final authority, who may promote or demote maintainers at their discretion.

---

## Maintainer Promotion Process

- Nominations by owners or existing maintainers, based on merit and community trust.
- Owners review nominations, consider community input, and make the final decision.
- Maintainers are onboarded and mentored by owners and senior maintainers.

---

## Community Participation

- Anyone can submit feature requests, bug reports, or policy suggestions via GitHub or Discord.
- Major initiatives may use **public RFCs** with open discussion and optional advisory polls.
- Community votes and feedback are **advisory only**.
- Communication channels include Discord (announcements, feedback, Q&A), monthly town halls, and documented meeting notes.

---

## Transparency & Accountability

- **Decision Documentation**: Major decisions by owners are documented publicly on Discord and GitHub.
- **Financial Transparency**: Quarterly reports and resource allocation are shared with the community.
- **Governance Updates**: Proposed via RFCs, publicly discussed, and finalized by owners.

---

## Dispute & Conflict Resolution

1. Encourage direct discussion between affected parties first.
2. Owners act as the final arbiters for unresolved issues, issuing documented decisions.
3. Appeals may be submitted to the owners, who may seek advisory input but retain final authority.

---

## Key Principles

- **Owner Leadership**: Decisions guided by vision, fairness, and transparency.
- **Meritocracy**: Contributions valued based on quality and impact.
- **Community Voice**: Feedback is welcomed and considered, though not binding.
- **Transparency**: All major decisions and finances are publicly documented.
- **Mentorship**: Owners and maintainers mentor new contributors.
- **Emergency Flexibility**: Owners can make urgent decisions with post-hoc transparency.

---

## Diagram

```mermaid
flowchart TD
    Owners["Owners (Founders)"]
    Maintainers["Maintainers"]
    Contributors["Contributors"]
    Community["Community Members"]

    Community --> Contributors
    Contributors --> Maintainers
    Maintainers --> Owners
    Owners --> Maintainers
    Maintainers --> Contributors

    %% Decision Flow
    Community -->|Feedback / Advisory Polls| Owners
    Maintainers -->|Recommendations| Owners
    Owners -->|Final Decision| Community

    %% Mentorship
    Owners -->|Mentorship| Maintainers
    Maintainers -->|Mentorship| Contributors

    classDef owners fill:#f9c,stroke:#333,stroke-width:2px;
    classDef maintainer fill:#9cf,stroke:#333,stroke-width:2px;
    classDef contributor fill:#9f9,stroke:#333,stroke-width:2px;
    class Owners owners
    class Maintainers maintainer
    class Contributors contributor
    class Community contributor
