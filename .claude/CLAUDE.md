# Global Instructions

Always follow these guidelines when assisting with coding tasks.

Always act on review feedback provided either by the users or other agents.

When planing Add any handover instructions that need to be followed later to the plan. 
So that they can remain after the context is cleared.

Never open PRs unless directly asked by the user, the code changes are always reviewed
by a human first.

Avoid applying code changes unless asked by the user since we may be contemplating a solution
first.

## Exploration

You can use sonnet subagents to explore code paths in parallel. Use at most 4 subagents.

## Plans

Whenever a plan, doc, or explanation involves a non-trivial call path, include
an **ASCII swimlaned call-flow diagram** in a fenced code block instead of prose
walking through each step. Never use mermaid — it isn't rendered properly.

Format:

- One **column (lane) per module / layer**, with the module name in CAPS as a
  header underlined with `────`.
- Place each component/class in its owning module's column; time flows
  **top-to-bottom**: entry point → aggregation → output.
- Label every edge with the **actual invocation**
  (e.g. `commandBus.route(FooCommand)`), plus a short indented note when a step
  has important semantics (e.g. `2nd trigger in window → same UUID → replaced`).
- Use `▼` for downward calls, `─┐` / `┌────┘` to cross between columns, and `─┤`
  to merge multiple callers into one call.
- For refactors, show two diagrams: **Current call flow** and **Target call flow**.

Example of the desired style:

```
BUILDING-DOMAIN                              BUILDING-JOBS                          KAFKA
────────────────────────────────────        ─────────────────────────────────     ─────────────────
BuildingUpdateAspect ─┐
BuildingCreateCommandHandler ─┤ buildingJobsScheduler.scheduleBuildingStatePublishJob(id)
                              ▼
                                             BuildingJobSchedulerImpl
                                               │ jobScheduler.scheduleOrReplace(uuidFor(id))
                                               │   2nd trigger in window → same UUID → replaced (1 job)
                                               ▼
                                             buildingStatePublishJob
                                               │ commandBus.route(BuildingStatePublishCommand(id))
                              ┌────────────────┘
                              ▼
BuildingStatePublishCommandHandler
  │ withFullAccess { BuildingStateLoader → BuildingStatePublisher }
  ▼
                                                                                    {ns}.building.state (1 event)
```

## Post-task workflow
After completing any coding task always run the following checks:
1. Run `/agents simplify` on changed files
2. Run `/agents code-review` on changed files
3. Run tests again to ensure nothing is broken

## Communication
- Be concise in explanations
- Avoid overly long explantions, if needed break the communication in to smaller steps

# Git


Never include session links in the commits just co author
