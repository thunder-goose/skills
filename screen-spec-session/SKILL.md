---
name: screen-spec-session
description: Convert a reviewed BRS or equivalent requirements artifact into traceable Markdown specifications for user-facing screen flows, screen states and actions, low-fidelity wireframes, and fields. Use when stakeholders and delivery teams need to define how people move through screens and what information each screen displays or captures before prototyping or implementation. Produce slug-named screen-flow, screen-catalog, and field-catalog files. Do not use to establish the business case, create pixel-perfect visual design, choose architecture, or write production code.
---

# Screen Spec Session

Define the interaction layer between business requirements and implementation. Keep every design decision traceable to a source requirement or visibly marked as an assumption.

## Outputs

Create these files for the source BRS slug:

- `SCREEN-FLOW-<slug>.md` for journeys, Mermaid flow diagrams, transitions, alternate paths, and failure paths.
- `SCREEN-CATALOG-<slug>.md` for the screen inventory, screen states, content, actions, permissions, and low-fidelity text wireframes.
- `FIELD-CATALOG-<slug>.md` for displayed, captured, selected, and derived information with validation and access rules.

Read [references/artifact-templates.md](references/artifact-templates.md) before creating the files.

## Working Rules

- Treat the BRS as the source of business truth; do not rewrite its outcome or scope.
- Preserve source IDs such as `BR-###`, `SCN-###`, `RULE-###`, `INFO-###`, `QUAL-###`, and `OQ-###`.
- Assign stable design IDs: `FLW-###`, `SCR-###`, `ACT-###`, `TRN-###`, and `FLD-###`. Never renumber existing IDs.
- Trace each flow, screen, action, transition, and field to source IDs where possible.
- Mark unsupported design choices as `ASSUMPTION-###` and ask for confirmation; do not disguise them as requirements.
- Ask at most one unanswered primary question per turn unless the user requests a batch interview.
- Update the artifact files after every substantive answer so the session can be resumed safely.
- When a matching `DISCOVERY-INDEX-<slug>.md` exists, update its screen-phase status, blockers, artifacts, and next action before ending the session.
- Specify behavior and information, not framework, API, database, or component-library implementation.
- Do not force a screen solution when the need is better served by a report, notification, automated process, or policy change.

## Workflow

1. **Select the source.**
   - Open the named BRS or requirements artifact.
   - If none is named, find main BRS files by their `# BRS:` heading and `**Slug:**` field; use the only match or ask which one.
   - Read linked scenario, rule, information, stakeholder, glossary, and open-question files when present.
2. **Assess readiness.**
   - Extract the outcome, scope, roles, `BR-###`, `SCN-###`, `RULE-###`, `INFO-###`, `QUAL-###`, constraints, and open questions.
   - Identify missing detail that would materially change screen boundaries, role access, decisions, or required information.
   - Ask about blocking gaps. Carry non-blocking gaps as open questions or assumptions.
   - Stop and explain when screens are not an appropriate solution.
3. **Establish journeys.**
   - Work one user goal or scenario at a time.
   - Identify actor, trigger, preconditions, successful end state, main path, alternate paths, cancellation, rejection, timeout, and recovery.
   - Create `FLW-###` flows, `SCR-###` screens, and `TRN-###` transitions as they emerge.
4. **Initialize all three artifacts.**
   - Use the templates and the source slug.
   - Record the source file, source status, date, unresolved source questions, and assumptions.
5. **Specify each screen.**
   - Capture purpose, roles, entry conditions, information hierarchy, actions, states, feedback, navigation, and relevant constraints.
   - Cover applicable default, loading, empty, validation-error, system-error, no-access, read-only, confirmation, and success states.
   - Add a low-fidelity text wireframe to communicate hierarchy, not styling.
6. **Specify fields.**
   - Derive fields from `INFO-###`, `RULE-###`, scenarios, and screen actions.
   - Capture business meaning, display/input/derived mode, required condition, format or example, validation, editability, sensitivity, source, and owning screen.
   - Do not infer a database schema from the field catalog.
7. **Check consistency.**
   - Ensure every transition has a from-screen, trigger, condition when applicable, destination or outcome, and failure behavior.
   - Ensure every action appears on a screen and leads to a transition or clearly described local effect.
   - Ensure fields referenced by rules exist and permissions are consistent across artifacts.
   - Flag source requirements or scenarios with no screen coverage; they may be non-UI requirements, but must not disappear silently.
8. **Review and close.**
   - Walk the user through flows first, then screens, then fields.
   - Apply corrections immediately and record unresolved design questions.
   - Update the matching discovery index when present; do not duplicate detailed screen specifications there.
   - State whether the package is ready for low-fidelity prototyping, visual design, or implementation planning.

## Interview Prompts

Reword these for the user's domain and skip what the source already answers:

1. "Which role is trying to achieve what goal, and what starts the journey?"
2. "What is the shortest successful path from start to finish?"
3. "Where can the journey branch, fail, be rejected, be cancelled, or need recovery?"
4. "At each step, what must the person understand, decide, enter, select, or confirm?"
5. "Which actions are available to each role, and when are they unavailable?"
6. "What should people see when there is no data, invalid data, no access, a delay, or a system failure?"
7. "What confirmation, notification, audit evidence, or next step must follow completion?"
8. "Which accessibility, device, language, privacy, audit, retention, volume, or response-time needs affect the experience?"

## Boundary

This skill creates low-fidelity interaction specifications, not production screens. A later prototype or UI implementation skill may consume these artifacts together with the BRS and the organization's design system. Keep that later step separate because it introduces visual, technical, accessibility implementation, and platform decisions that should not be silently folded into business capture.
