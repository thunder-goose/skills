# Discovery Index Template

Filename: `DISCOVERY-INDEX-<slug>.md`

```md
# Solution Discovery: <Initiative>

**Slug:** <slug>
**Started:** <YYYY-MM-DD>
**Last updated:** <YYYY-MM-DD>
**Business owner:** <name, role, or Unassigned>
**Facilitator:** <name, role, or AI-assisted>
**Overall status:** Not started | In progress | Ready for review | Reviewed | Blocked

## Purpose
<One sentence describing the business outcome this discovery package supports.>

## Current session
- **Goal:** <what the stakeholder wants to accomplish in this session>
- **Current phase:** Agree the need | Shape the experience | Package review
- **Next conversation:** <the next unanswered business question or review action>

## Phase status
| Phase | Status | Checkpoint | Blockers | Next action |
|---|---|---|---|---|
| Agree the need | Not started | Business agreement | None recorded | Start BRS interview |
| Shape the experience | Not started | Experience agreement | None recorded | Decide whether screens are needed |

## Artifact map
| Artifact | Purpose | Status | Last updated |
|---|---|---|---|
| [BRS-<slug>.md](BRS-<slug>.md) | Business need and build-handoff detail | Not started | Not created |
| [SCREEN-FLOW-<slug>.md](SCREEN-FLOW-<slug>.md) | User journeys and transitions | Not started | Not created |
| [SCREEN-CATALOG-<slug>.md](SCREEN-CATALOG-<slug>.md) | Screens, states, actions, and wireframes | Not started | Not created |
| [FIELD-CATALOG-<slug>.md](FIELD-CATALOG-<slug>.md) | Displayed and captured information | Not started | Not created |

Remove links to files that have not been created when the Markdown renderer treats missing links as misleading. Keep the planned artifact name as plain text instead.

## Business agreement
- **Reviewed by:** Not reviewed
- **Reviewed on:** Not reviewed
- **Outcome:** Pending

## Experience agreement
- **Screens appropriate:** Undecided
- **Rationale:** Not recorded
- **Reviewed by:** Not reviewed
- **Reviewed on:** Not reviewed
- **Outcome:** Pending

## Blockers and open decisions
| ID | Issue or decision | Impact | Owner | Needed by | Status |
|---|---|---|---|---|---|
| OQ-001 | <question> | <impact> | Unassigned | Not set | Open |

Reference detailed questions in source artifacts instead of duplicating their full history.

## Decision log
| Date | Decision | Reason | Decided by | Affected artifacts |
|---|---|---|---|---|
| <YYYY-MM-DD> | <decision> | <reason> | <name or role> | <files or IDs> |

## Handoff
- **Package readiness:** Not assessed
- **Recommended next activity:** Not decided
- **Next owner:** Unassigned
- **What remains:** <open questions, assumptions, reviews, or None>
```

## Update Rules

- Update `Last updated`, current phase, phase status, artifact status, blockers, and next conversation before ending each session.
- Use relative Markdown links because the artifacts are stored together.
- Keep detailed requirement and screen content in the source artifacts.
- Preserve historical decisions; append corrections rather than deleting consequential decisions without explanation.
