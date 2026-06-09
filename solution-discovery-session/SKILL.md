---
name: solution-discovery-session
description: Guide business stakeholders through one plain-language discovery journey from a business idea to a build-ready requirements and screen-specification package. Orchestrate the brs-session and screen-spec-session phases, create or resume a discovery index, manage review checkpoints, surface blockers, and tell the user what happens next. Use when a business user wants one guided entry point for defining a need and, when appropriate, the screens, flows, states, actions, and fields that support it. Do not use for visual design, architecture, estimation, implementation, or code.
---

# Solution Discovery Session

Present one guided business conversation with two optional phases:

1. **Agree the need**: establish what the business needs and why.
2. **Shape the experience**: establish how people should move through the proposed screens and information.

Do not require the user to know which skill or artifact to choose.

## User Experience

- Start with: "I’ll guide this in two stages: first we agree the business need, then, if screens are appropriate, we map the user experience. I’ll ask one question at a time and keep the documents updated so we can pause or hand over safely."
- Use business language in conversation. Translate artifact IDs into short descriptions when discussing them.
- Explain why a question matters when it is not obvious.
- Do not ask the user to repeat information already captured in an artifact.
- Summarize regularly during long sessions and allow the user to stop after either checkpoint.
- Do not expose internal skill names unless the user asks or needs to invoke a phase directly.
- Never treat silence or continuation as approval. Ask explicitly at each checkpoint.

## Artifacts

Maintain `DISCOVERY-INDEX-<slug>.md` as the front door to the package. Read [references/discovery-index-template.md](references/discovery-index-template.md) before creating it.

The package may contain:

- `BRS-<slug>.md` and its supporting files.
- `SCREEN-FLOW-<slug>.md`.
- `SCREEN-CATALOG-<slug>.md`.
- `FIELD-CATALOG-<slug>.md`.

The index summarizes status and links; it does not duplicate detailed requirements or specifications.

## Workflow

1. **Orient and route.**
   - Ask for the business idea only when none is supplied.
   - Search for an existing discovery index and related BRS or screen artifacts.
   - Resume the next incomplete phase when the route is clear. Ask which initiative only when several packages match.
   - Create the discovery index as soon as the slug is known.
2. **Set expectations.**
   - Explain the two stages in one or two sentences.
   - Ask whether the user wants a focused one-question-at-a-time session or a workshop-style batch. Default to one question at a time.
   - Record the desired outcome for this session in the index.
3. **Phase 1: agree the need.**
   - Use `brs-session` as the authority for the BRS interview, IDs, files, and readiness assessment.
   - When that skill is unavailable, stop and explain that the BRS phase cannot be run reliably; do not recreate a weaker ad hoc BRS.
   - Update the discovery index after material progress and before ending the session.
4. **Checkpoint 1: business agreement.**
   - Recap the outcome, scope, affected roles, top requirements, representative scenarios, material rules, information needs, operational qualities, and blockers.
   - Ask: "Does this accurately describe what the business needs?"
   - After confirmation, ask: "Should we stop with the business brief, send it for wider review, or continue to map the user experience?"
   - Do not proceed to screens when business scope or critical rules remain materially unclear.
5. **Decide whether screens are appropriate.**
   - Continue only when people need to view, enter, select, review, approve, or act on information through a user interface.
   - Skip screen design for work primarily solved by automation, reports, notifications, integration, data migration, policy, or operating-process change.
   - Record the decision and rationale in the index.
6. **Phase 2: shape the experience.**
   - Use `screen-spec-session` as the authority for flow, screen, and field artifacts.
   - Review one user journey at a time.
   - Pause and return to the BRS when a discussion changes business scope, rules, information needs, or operational qualities. Update the BRS first, then resume screen work.
7. **Checkpoint 2: experience agreement.**
   - Review in this order: journeys and exception paths, screen purposes and actions, then fields and validation.
   - Ask: "Can each role complete the important situations we identified, including failures and exceptions?"
   - Confirm assumptions separately; do not fold them into approval.
8. **Close the package.**
   - Update every phase status, artifact link, blocker, owner, and next action in the discovery index.
   - State whether the package is ready for stakeholder review, prototype or visual design, functional specification, or implementation planning.
   - Give the user a concise list of what was created and what still needs a decision.

## Phase Statuses

Use only:

- `Not started`
- `In progress`
- `Ready for review`
- `Reviewed`
- `Blocked`
- `Not needed`

Set `Reviewed` only after explicit stakeholder confirmation. Use `Blocked` only when a named unresolved issue prevents meaningful progress.

## Change Control

- The BRS owns business outcome, scope, requirements, rules, information needs, and operational qualities.
- The screen package owns journeys, screens, states, actions, transitions, and fields.
- When screen discovery reveals a business change, update the BRS and source IDs before relying on it in screen artifacts.
- Preserve IDs and links across revisions. Never silently redefine an existing requirement from a screen artifact.
- Record significant scope, rule, or solution-direction decisions in the discovery index decision log.

## Completion

The discovery package is ready to leave this workflow when:

- Business needs are reviewed or clearly marked with owned blockers.
- Screen design is reviewed or explicitly recorded as not needed.
- Assumptions and open questions remain visible.
- Every artifact is linked from the discovery index.
- The next delivery activity and owner are recorded.
