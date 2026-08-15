# CLAUDE.md — Ideal Organizing + Design (spoke repo)

This repo holds **build code only**. All company and client knowledge lives in the hub repo: `ApproachableAI/master-knowledge-base`.

## Session start

1. Make sure the hub is cloned as a sibling directory. If `../master-knowledge-base` doesn't exist:
   ```
   git clone https://github.com/ApproachableAI/master-knowledge-base ../master-knowledge-base
   ```
   If it exists, pull latest: `git -C ../master-knowledge-base pull`
2. **Always** read `../master-knowledge-base/clients/ideal-organizing-design/Ideal Organizing + Design.md` — this engagement's source of truth, including its "Code & deploys" section (which points back at this repo). Its builds table links to a note per workflow, and those carry the technical detail.
3. **Scoped reading:** read `../master-knowledge-base/company/MASTER_README.md` only when the task involves business context — scope, pricing, proposals, client communication, or anything the client will read. Pure technical sessions (bug fixes, refactors, build work) skip it.
4. Hub files beat training data and prior conversation memory. If the hub contradicts something Claude "remembers," the hub wins.

## Engagement-specific standing constraints

These are in the engagement note too. They are repeated here because they change what may be built, not just what may be said.

- **The MVP A.I. Portal is not their system.** It is a Darren Hardy, LLC product Ideal Organizing + Design licenses. Never build anything load-bearing that depends on its internals; it can change or lapse without notice and we cannot fix it.
- **Their client documents are sensitive.** IOD handles clients' insurance papers, powers of attorney, medication lists, and estate documents. Anything that would move client documents into a new tool is a stop-and-ask, not a flag-and-proceed, until their boundaries are confirmed in writing.
- **Nothing is signed.** As of August 15, 2026 this is a prospect with no scope, no fee, and no agreement. Check the engagement note before assuming any build is authorized.

## Confidentiality wall

Hub knowledge is context for Claude only. It must never appear in client-facing output — no other clients' names, no internal pricing or margins, no company strategy, in any deliverable, playbook, system prompt, comment, or file the client will see or own. Before shipping anything from this repo, check it against this wall: if a line of it would surprise the client or expose another engagement, it doesn't ship.

## Session end

- **Code changes** commit and push here, in this repo.
- **Knowledge changes** — deal terms, decisions, milestones, architecture choices, hard-won gotchas, corrected assumptions — get written in the hub: update the engagement note and/or Master README there, log decisions in `company/Decisions Log.md`, commit, push. Never leave knowledge only in this repo; a spoke is never a write location for knowledge.
