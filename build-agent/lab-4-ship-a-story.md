# Lab 4 · Ship a Story

*Goal: pick one story from the backlog and take it to done, driven by its acceptance criteria.*

This is the lab that looks most like a normal work day: you pull a story off the backlog and take it to done. Not a demo trick, not a from-scratch build, just the ordinary work of picking up an assigned story and finishing it, with an agent as your pair.

Pick the story closest to your world: safety escalation if you run a plant, equipment loans if you run a campus, auto-approval if you just want the classic. Points are honest: 2s are quick, the 8 is a commitment.

## Step 1 · Have Build Agent sharpen the story first

Before you build anything, put the story under review. Real acceptance criteria are often vague, incomplete, or missing an edge case, and an agent will happily build exactly what a weak story says. Ask first:

### Prompt 4a (swap in your story number)

```text
Read the story in the rm_story table whose short description starts with GW-003. Do not build anything yet. Review its acceptance criteria: are they testable, complete, and unambiguous? Point out any gaps, edge cases, or missing conditions I should decide on before implementation, and suggest sharper wording.
```

Read the response. Decide which suggestions you accept. This is the requirements-quality lesson from Lab 2, now applied to a story you are about to ship.

> 🖼️ *Screenshot: Build Agent's critique of the story's acceptance criteria*

## Step 2 · Implement against the (refined) criteria

### Prompt 4b (swap in your story number)

```text
Now implement GW-003 in this Groundwork application, using the acceptance criteria including the refinements we just agreed. Show me the plan before building, and tell me which acceptance criterion each part of the plan satisfies.
```

Read the plan properly. This is the skill. Does every acceptance criterion appear? Is it creating things you did not ask for? Push back before approving: "Skip the extra dashboard, just satisfy the three criteria."

> 🖼️ *Screenshot: Plan mapped to acceptance criteria for the chosen story*

## Verify

Test against the acceptance criteria, not vibes. GW-003 example: create a Safety request, confirm Severity appears and is mandatory, set it High, confirm priority flips to Critical.

When it passes, tell Build Agent: "The story is implemented and verified. Update the story state to reflect that." Then go look at the story record.

> 🖼️ *Screenshot: Verified behavior in the app, e.g. High severity flipping priority to Critical*

{% hint style="success" %}
**Feature Spotlight: checkpoints and the change log.** Open the conversation change log tab in Studio. Every change Build Agent made is tracked there, grouped by conversation, with checkpoints you can roll back to. This is your safety net at work: if an approved plan turns out wrong, you revert to the checkpoint instead of hand-unpicking metadata. Changes are also captured in update sets automatically.
{% endhint %}

*Fast finisher? Take a second story. GW-008 will keep you humble.*
