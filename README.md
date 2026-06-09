# Agent Skills

Reusable agent skills for business requirements discovery, screen
specification, and source-code research.

Each skill is stored in its own directory with a `SKILL.md` definition and any
supporting scripts, references, or agent metadata it needs.

## Available Skills

| Skill | Purpose |
| --- | --- |
| [`brs-session`](brs-session/) | Interview stakeholders and create or resume a solution-neutral Business Requirements Specification (BRS). |
| [`screen-spec-session`](screen-spec-session/) | Turn reviewed requirements into traceable screen flows, screen specifications, wireframes, and field catalogs. |
| [`solution-discovery-session`](solution-discovery-session/) | Guide a complete discovery process by coordinating the BRS and screen-specification skills. |
| [`rtfm`](rtfm/) | Answer questions using evidence from real source code, tests, examples, and documentation. |

## Installation with skills.sh

The [skills.sh](https://skills.sh/) CLI can run through `npx`, so Node.js and
npm are required. You do not need to install the CLI separately.

List the skills in this repository without installing them:

```bash
npx --yes skills@latest add thunder-goose/skills --list
```

The commands below install skills globally for Codex. Remove `--global` for a
project-local installation, or change `--agent codex` to target another
supported agent.

### Install all skills

```bash
npx --yes skills@latest add thunder-goose/skills \
  --skill '*' \
  --agent codex \
  --global \
  --yes
```

### Install `brs-session`

```bash
npx --yes skills@latest add thunder-goose/skills \
  --skill brs-session \
  --agent codex \
  --global \
  --yes
```

Use this skill when the business need must be understood and documented before
screen design, technical design, or implementation.

### Install `screen-spec-session`

```bash
npx --yes skills@latest add thunder-goose/skills \
  --skill screen-spec-session \
  --agent codex \
  --global \
  --yes
```

Use this skill after a BRS or equivalent requirements artifact has been
reviewed and user-facing flows and screens need to be specified.

### Install `solution-discovery-session`

This skill orchestrates `brs-session` and `screen-spec-session`. Install all
three together:

```bash
npx --yes skills@latest add thunder-goose/skills \
  --skill solution-discovery-session brs-session screen-spec-session \
  --agent codex \
  --global \
  --yes
```

Use it as the main entry point when stakeholders need one guided workflow from
an initial business idea through a build-ready requirements and screen package.

### Install `rtfm`

```bash
npx --yes skills@latest add thunder-goose/skills \
  --skill rtfm \
  --agent codex \
  --global \
  --yes
```

Use this skill to investigate one or more local Git repositories and answer
questions with file and line references.

## Repository Layout

```text
.
├── brs-session/
├── rtfm/
├── screen-spec-session/
└── solution-discovery-session/
```

Supporting files remain inside their skill directory so they are included when
the skill is installed.

## Security

Agent skills can contain instructions and executable scripts that run with the
agent's permissions. Review a skill's `SKILL.md` and supporting files before
installing or invoking it.
