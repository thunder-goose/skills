---
name: brs-session
description: Run a plain-language interview to create or resume a Business Requirements Specification (BRS) for one business process, need, or initiative. Capture the business outcome, current situation, solution-neutral requirements, stakeholders, constraints, scope, success measures, and open questions in a slug-named BRS Markdown file. When a build-ready handoff is requested, also capture traceable business scenarios, rules, information needs, and operational qualities. Use before functional specification, screen design, technical design, or delivery. Do not use for system behavior, architecture, implementation planning, or code.
---

# BRS Session

Create a concise, defensible record of **what the business needs and why**. Do not design the solution.

## Working Rules

- Keep one bounded business need per BRS.
- Ask at most one unanswered primary question per turn unless the user requests a batch interview.
- Capture all useful information the user volunteers; do not ask for it again.
- Update the BRS after every substantive answer so the session can be resumed safely.
- Use plain language and preserve the user's terminology.
- Do not invent facts, decisions, owners, priorities, measures, or solution behavior.
- Keep IDs stable after assignment. Add new IDs; never renumber existing ones.
- When a matching `DISCOVERY-INDEX-<slug>.md` exists, update its BRS status, blockers, and next action before ending the session.
- Do not modify source code or produce technical designs.

Classify solution-related details carefully:

- Record a non-negotiable external rule under **Constraints** when the user identifies its source or business reason.
- Record a proposed tool, screen, UI, platform, API, or implementation approach under **Notes / solution preferences**.
- Do not ask follow-up questions about architecture or implementation.

## Workflow

1. **Choose start or resume.**
   - When a topic is supplied, use it and ask only for missing information.
   - When no topic is supplied, ask what business need or process to document.
   - For a resume request, open the named BRS. If none is named, find main BRS files by the `# BRS:` heading and `**Slug:**` field; resume the only match or ask which one when several match.
2. **Bound the scope.**
   - Confirm only when the topic contains multiple independent needs or its boundary is unclear.
   - Park separate needs under **Notes / deferred topics / solution preferences** and continue with the selected one.
3. **Choose the file.**
   - Derive a lowercase kebab-case slug under 40 characters and use `BRS-<slug>.md`.
   - State the filename before writing. Ask for confirmation only when the slug is ambiguous.
   - If the file exists and this is not a resume, ask whether to continue it or create the next unused `BRS-<slug>-vN.md`. Never overwrite silently.
4. **Initialize the BRS.**
   - Write the full template below with `Draft` status and placeholders.
   - Use the current date. Record the stakeholder's name or role when known; otherwise use `Not provided`.
5. **Capture the core BRS.**
   - Work through the seven core capture areas below.
   - Ask the first unanswered primary question, then use brief follow-ups only for material ambiguity.
   - Turn distinct business needs into `BR-###` entries. Add priority only when known.
   - Record unresolved decisions as `OQ-###`; use a role as owner when known, otherwise `Unassigned`.
6. **Add build-handoff detail when needed.**
   - Run the build-handoff extension when the user asks for build-ready artifacts, screen or flow design, functional specification, or delivery intake.
   - Otherwise offer the extension after the core BRS is reviewed; do not force it for early discovery.
   - Link each `SCN-###`, `RULE-###`, `INFO-###`, and `QUAL-###` item to related `BR-###` IDs when known.
7. **Review.**
   - Replace every placeholder with captured content, `Not applicable` plus a reason, or `Not requested` for the optional extension.
   - Give a concise plain-language recap and ask whether it is accurate.
   - Apply corrections immediately. Set status to `Reviewed` only after explicit confirmation and to `Approved` only when the user explicitly approves it.
8. **Close and hand off.**
   - Assess handoff readiness using the checklist below.
   - State whether the BRS is ready for stakeholder review, build discovery, or blocked by material open questions.
   - Name material open-question IDs and owners.
   - Update the matching discovery index when present; do not duplicate detailed BRS content there.
   - Recommend `screen-spec-session` when user-facing screens and flows are the next artifact. Recommend functional specification when broader system behavior must be defined.

## Core Capture Areas

Reword these for the user's domain. Treat the examples as prompts, not a script.

1. **Business outcome**: "What outcome are we trying to achieve, and why does it matter now?"
2. **Current situation**: "What triggers this need, how is it handled today, and where does it fail or create pain?"
3. **Business requirements**: "What must the business be able to do, decide, prevent, or demonstrate for the outcome to be achieved?"
4. **Stakeholders**: "Who requests, performs, decides, approves, receives, or is affected by this process?"
5. **Constraints and dependencies**: "Which policies, laws, deadlines, budgets, commitments, assumptions, or external dependencies must be respected?"
6. **Scope**: "What is included, and what must this effort explicitly not cover?"
7. **Success measures**: "What observable measures would show in a month or quarter that this is working?"

## Build-Handoff Extension

Capture business detail without choosing screens or technical behavior.

1. **Scenarios and exceptions**: "What representative situations must work, including unusual, rejected, cancelled, or failed cases?"
2. **Business rules**: "What decisions, approvals, calculations, thresholds, timings, or prohibitions govern those situations?"
3. **Information needs**: "What information must people provide, see, receive, retain, or report on to perform the work?"
4. **Operational qualities**: "What volume, turnaround, availability, accessibility, privacy, audit, retention, or language expectations matter?"

## BRS Template

```md
# BRS: <Business need or initiative>

**Slug:** <slug>
**Captured:** <YYYY-MM-DD>
**Captured with:** <name, role, or Not provided>
**Status:** Draft

## Business outcome
Not captured yet.

## Current situation
- **Trigger:** Not captured yet.
- **Current handling:** Not captured yet.
- **Pain:** Not captured yet.

## Business requirements
- BR-001 — Not captured yet.

## Stakeholders and responsibilities
- Not captured yet.

## Constraints, assumptions, and dependencies
- Not captured yet.

## Scope
### In scope
- Not captured yet.

### Out of scope
- Not captured yet.

## Success measures
- SM-001 — Not captured yet.

## Build-handoff detail
### Scenarios and exceptions
- SCN-001 — Not captured yet. (Supports: BR-001)

### Business rules
- RULE-001 — Not captured yet. (Supports: BR-001)

### Information needs
- INFO-001 — Not captured yet. (Supports: BR-001)

### Operational qualities
- QUAL-001 — Not captured yet. (Supports: BR-001)

## Open questions
- None recorded.

## Notes / deferred topics / solution preferences
- None recorded.

## Supporting files
- None.
```

Write requirements and rules as short, testable, solution-neutral statements:

- `BR-001 — Refund decisions must be consistent across service teams. (Priority: Must)`
- `RULE-001 — Refunds over $500 require finance approval. (Supports: BR-001)`
- `INFO-001 — Reviewers need the purchase date, amount, and refund reason. (Supports: BR-001)`
- `QUAL-001 — A refund decision must be recorded with the reviewer and decision time. (Supports: BR-001)`

Avoid implementation statements such as `Build a React screen backed by the refunds API`.

## Handoff Readiness

A BRS is ready for downstream screen or functional design when:

- The outcome, scope, roles, and core `BR-###` requirements are stable enough to design against.
- Representative happy-path and exception `SCN-###` scenarios are captured.
- Material decision and approval `RULE-###` rules are captured.
- Necessary business `INFO-###` information is identified without prescribing controls or data models.
- Material `QUAL-###` volume, timing, accessibility, privacy, audit, retention, and availability needs are captured.
- Material open questions have owners, and blockers are clearly identified.
- Solution preferences are distinguishable from mandatory constraints.

The BRS may remain `Draft` during downstream discovery, but the next skill must carry unresolved items and assumptions forward rather than inventing answers.

## Supporting Files

Keep content in the main BRS by default. Split content only when a section becomes hard to scan, then link the file from **Supporting files**.

Use slug-scoped names to avoid collisions:

- `BRS-<slug>-glossary.md` for substantial domain terminology.
- `BRS-<slug>-stakeholders.md` for many roles or detailed responsibilities.
- `BRS-<slug>-scenarios.md` for detailed scenarios and exceptions.
- `BRS-<slug>-rules.md` for decision tables or numerous business rules.
- `BRS-<slug>-information.md` for substantial information or reporting needs.
- `BRS-<slug>-qualities.md` for substantial operational or quality needs.
- `BRS-<slug>-open-questions.md` when open questions need status, dates, or detailed impact.
- `BRS-<slug>-out-of-scope.md` when exclusions need rationale or future ownership.

Preserve IDs and source links when moving content out of the main BRS. Never create support files merely for completeness.
