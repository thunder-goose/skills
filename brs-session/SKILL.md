---
name: brs-session
description: Interview a business stakeholder in plain language to capture a Business Requirements Specification (BRS) for a process, need, or initiative. Produces a BRS-<slug>.md file plus any supporting files needed to make the BRS self-contained (glossary, stakeholders, scenarios, open questions). Use when a non-technical user says "I need to write up the business requirements", "let's capture the BRS for X", "I want to document what the business needs before anything technical", or describes a business problem they want pinned down before it goes to a delivery team. Purely business-facing — never asks technical or implementation questions and never writes code.
---

<what-to-do>

You are running a BRS capture session for a business user. The artifact you produce is a Business Requirements Specification — *what the business needs and why*, not *how the system will deliver it*. Never drift into implementation.

If the user volunteers implementation detail ("it should use a spreadsheet", "make it call our API"), acknowledge it, park it in `NOTES.md` as a preference, and pivot back to the business question.

Run the session in this order. Never skip a step. Confirm before moving on.

1. **Preflight.** Ask: *"What's the business need, process, or initiative we're documenting today?"* Confirm the scope is bounded enough for one BRS — if the answer covers multiple distinct needs, ask which to tackle first and park the rest.
2. **Pick a slug.** From the topic, derive a short kebab-case slug. E.g. *"Refund eligibility for digital goods"* → `refund-eligibility-digital`. Propose it and let the user tweak. The slug names the main file: `BRS-<slug>.md`.
3. **Create the file.** Write `BRS-<slug>.md` in the current working directory using the template in the supporting section. Fill in only the header (slug, captured date, captured-with) at this stage.
4. **Interview.** Walk through the eight BRS questions below, **one at a time**. Wait for the answer before asking the next. Update `BRS-<slug>.md` immediately after each answer — do not batch.
5. **Offer supporting files.** As the interview surfaces them, propose creating supporting files alongside the BRS (see "Supporting files" in the supporting section). Common ones: `GLOSSARY.md`, `STAKEHOLDERS.md`, `SCENARIOS.md`, `OPEN-QUESTIONS.md`, `OUT-OF-SCOPE.md`. Only create a file if the BRS actually needs it — don't manufacture files for completeness.
6. **Read back.** When all eight questions are answered, read the full BRS back to the user in plain English: *"Here's what I captured — did I get it right?"* Edit on the spot if not.
7. **Declare done-when.** State explicitly: *"The BRS is in a defensible state for <topic>. Open questions still parked: OQ-001, OQ-002, ..."* If anything material is unresolved, name it and the owner.
8. **Suggest next step.** Offer one of: (a) take the BRS to delivery as-is, (b) escalate to a Functional Requirements Specification using `/frs-session` because the system behaviour now needs to be pinned down, or (c) stop here and share the BRS with another stakeholder for review.

## The eight BRS questions

Ask these one at a time, in order, in plain language. Re-word for the user's domain — don't read them robotically.

1. **Goal** — *"What's the business outcome we want? In one sentence, what does success look like?"*
2. **Trigger** — *"When does this situation come up? What kicks it off?"*
3. **Current pain** — *"How is this handled today? Where does it hurt, slow down, or break?"*
4. **Desired outcome** — *"After this is in place, what's different? What do we want to be true that isn't true today?"*
5. **Stakeholders + roles** — *"Who's involved? Who requests, reviews, approves, gets notified, or is affected?"*
6. **Constraints** — *"What rules, policies, deadlines, or compliance points must this respect?"*
7. **Out of scope** — *"What should this NOT cover? Where should the work stop?"*
8. **Success measure** — *"How will we know in a month or a quarter that this is working?"*

## Hard rules

- **Never** ask technical or architecture questions. No databases, APIs, frameworks, file formats, UI specifics, programming languages.
- **One question at a time.** Wait for the answer.
- **Capture inline.** Update `BRS-<slug>.md` after every answered question. Don't batch.
- **Park, don't resolve.** Anything that needs Legal / Finance / Product input goes to `OPEN-QUESTIONS.md` as `OQ-###` with a named owner. Move on; do not invent answers.
- **One BRS per session.** If the conversation reveals two distinct needs, stop and ask which to tackle first.
- **No skill generation, no code, no system design.** This skill produces a business artifact. The next step (skill, FRS, implementation) is someone else's call.

</what-to-do>

<supporting-info>

## BRS file template (`BRS-<slug>.md`)

```md
# BRS: <Process / need / initiative name>

**Slug:** <slug>
**Captured:** <YYYY-MM-DD>
**Captured with:** <user name or role>
**Status:** Draft | Reviewed | Approved

## Goal
<one-sentence business outcome>

## Trigger
<what starts this need / where it shows up today>

## Current pain
<what's slow, error-prone, or missing today>

## Desired outcome
<the after-state — what's true once this is delivered>

## Stakeholders + roles
- **<Role>:** <person or team>, <what they do in this process>
- ...

## Constraints
- <rule, policy, deadline, compliance point>
- ...

## Out of scope
- <explicit non-goal>
- ...
(or: see OUT-OF-SCOPE.md if the list grows long)

## Success measure
<how we'll know in a month / quarter that this is working>

## Open questions
- OQ-001 — <question> (owner: <name>)
- ...
(or: see OPEN-QUESTIONS.md if the list grows long)

## Supporting files
- GLOSSARY.md — <if created>
- STAKEHOLDERS.md — <if created>
- SCENARIOS.md — <if created>
- ...

## Notes / preferences
<anything the user volunteered that isn't a hard requirement — implementation hints, past attempts, opinions>
```

## Supporting files

Only create a supporting file when the BRS would be confusing or incomplete without it. Don't add files for the sake of it.

### `GLOSSARY.md`
Create when the topic uses domain terms a reader outside the team wouldn't know.
```md
# Glossary

- **<Term>** — <plain-language definition>. <Optional: where it's used.>
```

### `STAKEHOLDERS.md`
Create when there are more than ~4 roles, or when responsibilities need detail beyond a line each.
```md
# Stakeholders

## <Role name>
- **Who:** <person, team, or function>
- **Interest:** <why they care about this>
- **Responsibility:** <what they do in this process>
- **Sign-off:** <yes / no / informed>
```

### `SCENARIOS.md`
Create when the user describes specific examples ("for instance, last month a customer asked for..."). Capture each as a concrete story.
```md
# Scenarios

## S-001 — <short name>
**Situation:** <one-line setup>
**What happens today:** <current handling>
**What should happen:** <desired handling>
**Why it matters:** <which BRS goal / constraint it tests>
```

### `OPEN-QUESTIONS.md`
Create when more than ~3 open questions accumulate. Move them out of `BRS-<slug>.md` and link from there.
```md
# Open Questions

## OQ-001 — <question>
- **Why it matters:** <impact on the BRS if unresolved>
- **Owner:** <named person>
- **Needed by:** <date or milestone, if known>
- **Status:** Open | Awaiting answer | Resolved → <resolution>
```

### `OUT-OF-SCOPE.md`
Create when the out-of-scope list grows beyond ~5 items or needs reasoning. Helps prevent scope creep later.
```md
# Out of Scope

## OOS-001 — <thing that's out>
- **Why it's out:** <reason>
- **Where it might live instead:** <other initiative, future phase, never>
```

## When to escalate to FRS instead

The BRS captures *what* the business needs. The FRS captures *how the system will behave* to deliver it. Offer to escalate to `/frs-session` (the existing FRS grilling wrapper) if any of these are true:

- The user starts naturally drifting into system behaviour ("when the user clicks submit, the system should...").
- The BRS is approved and the next question is genuinely "now what does the system do?".
- Multiple roles each have their own decision rules that need pinning down.
- Regulated rules (legal, finance, compliance) need rule-by-rule definition.

Phrase it as: *"This BRS looks solid. The next layer — system behaviour rules — belongs in an FRS. Want me to hand you off to `/frs-session`?"*

## Slug derivation rules

- Lowercase, kebab-case. No `BRS-` prefix in the slug itself (that's added in the filename).
- Noun-first when natural: `refund-eligibility`, not `define-refund-eligibility`.
- Drop filler words ("the", "of", "for") unless they disambiguate.
- Keep under ~40 characters.
- If `BRS-<slug>.md` already exists in the working directory, ask the user: continue the existing one, or create `BRS-<slug>-v2.md`?

## What this skill does NOT do

- Write or modify source code.
- Design system behaviour, UI, APIs, or data models.
- Produce a Functional Requirements Specification (use `/frs-session` for that).
- Produce a Claude Code skill, plugin, or any executable artifact.
- Resolve open questions on the user's behalf. If the answer needs Legal / Finance / Product input, park as `OQ-###` and move on.
- Bundle multiple business needs into one BRS. One topic per session.

## When NOT to invoke this skill

- The user wants system-level behaviour rules → `/frs-session`.
- The user wants a skill built → `write-a-skill` (if installed).
- The business need is a one-off ad-hoc decision, not something worth documenting → just help them directly.

## Common invocations

- `/brs-session` — ask *"What's the business need we're documenting?"* first.
- `/brs-session Refund eligibility for digital goods` — start with topic pre-named, still walk the eight questions.
- `/brs-session resume` — re-open the most recent `BRS-*.md` in the working directory and continue from where the answers run out.

</supporting-info>
