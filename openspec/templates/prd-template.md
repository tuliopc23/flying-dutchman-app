# Product Requirements Document Template

Use this template when creating a new capability or significant feature for Flying Dutchman.

## Problem Statement

**What problem are we solving?**
- [Clear, concise description of the problem]

**Who is affected?**
- [Target users or use cases]

**Why is this important now?**
- [Context, urgency, business/technical rationale]

## User Stories

### Primary User Story
- **As a** [user type]
- **I want** [goal]
- **So that** [benefit]

### Additional User Stories
- [List other relevant user stories]

## Success Metrics

**How will we measure success?**
- [Quantifiable metric 1]: [target value]
- [Quantifiable metric 2]: [target value]
- [Qualitative metric]: [description]

**Definition of Done**:
- [ ] [Criterion 1]
- [ ] [Criterion 2]
- [ ] [Criterion 3]

## Technical Constraints

**Platform Requirements**:
- macOS 26.0+ (Tahoe) - NON-NEGOTIABLE
- Apple Silicon (arm64) only - NON-NEGOTIABLE
- Swift 6.2 with strict concurrency

**Architecture Constraints**:
- Must align with three-layer architecture (App, Engine, CLI)
- Native-first: Prefer Apple frameworks
- Local-first: Optimize for single-developer workflows

**Performance Targets**:
- [Specific performance requirement]: [target]

## Design Decisions

**Key Technical Decisions**:
- [Decision 1]: [Rationale]
- [Decision 2]: [Rationale]

**Alternatives Considered**:
- [Alternative 1]: [Why rejected]
- [Alternative 2]: [Why rejected]

## Open Questions

- [ ] [Question 1]
- [ ] [Question 2]

## Dependencies

**Requires**:
- [Dependency 1]
- [Dependency 2]

**Blocks**:
- [Blocked feature 1]
- [Blocked feature 2]

## Implementation Notes

**Related Specs**:
- `openspec/specs/[capability]/spec.md`

**Related Changes**:
- `openspec/changes/[change-id]/`

**Estimated Effort**:
- [X] focused sessions

