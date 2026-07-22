# Build Agent on ServiceNow

### Ship Your Backlog with Enterprise Vibe Coding

*Lab Guide · Morning Session · Ardynt Labs & ServiceNow · Draft v0.5*

This morning you will do the things you actually do at work: scaffold an app, put a front door on it, pull in a backlog, ship a story from it, and document what you built. An AI agent does the heavy lifting while you supervise.

By noon you will have a working application called Groundwork that you scaffolded, exposed through Employee Center, extended from real user stories, and documented — all through conversation with Build Agent.

## What we will accomplish today

Five labs, one continuous app. Each builds on the last, and none of them are toy exercises. By the time you leave you will have done a full slice of platform work with an agent as your pair.

| Lab | What you build | The skill underneath |
|---|---|---|
| 1 · Scaffold | A working app: table, fields, sample data, navigation | Turning one prompt into a running app |
| 2 · Catalog front door | An Employee Center catalog item that creates requests | Why requirements quality beats prompt cleverness |
| 3 · Load backlog | Eight user stories loaded into the platform backlog | Getting messy, real-world input into the platform |
| 4 · Ship a story | One backlog story taken to done against its acceptance criteria | Reviewing an agent's plan and holding the line |
| 5 · Document | A README and architecture diagram generated from the app | Documentation as the zero-risk agent task |

You will finish with an app that is scaffolded, fronted by a catalog item, extended by a story you shipped, and documented — plus a feel for where the human stays in the loop.

## How this lab works

Every prompt you send follows the same loop. Learn the rhythm once and the whole morning makes sense:

1. **Prompt.** Describe what you want in plain language.
2. **Plan.** Build Agent shows you what it intends to create before touching anything. You are the human in the loop.
3. **Approve.** Read the plan, then approve it. Approving does not count as a new prompt.
4. **Verify.** Open what it built. Click around. Check it against what you asked for.
5. **Iterate.** Not quite right? Describe the change. Iterating beats starting over, every time.

Agent builds take three to six minutes. The guide always gives you something useful to do while you wait.

{% hint style="info" %}
**Good to know.** Build Agent currently requires the admin role. Your lab instance gives you admin, which is why everything works today. Back home, plan for who gets access. One well-scoped prompt beats four small ones. Draft longer prompts in a text editor first, then paste.
{% endhint %}

## Working with Build Agent chats

A Build Agent conversation is a working session, not a permanent record. Your changes are saved to the platform (and to update sets) as you approve them; the chat is just the thread that produced them. Treat chats as disposable and you will avoid most of the friction people hit.

Start a fresh chat when:

* **You switch to an unrelated task.** One conversation per logical unit of work keeps the change log grouped cleanly and checkpoints easy to reason about.
* **The agent starts looping, contradicting itself, or dragging.** Long threads accumulate context; a clean chat often fixes a confused agent faster than arguing with it.
* **You reloaded the window and your attachment disappeared.** Uploads live only in the current conversation and do not survive a reload.

When you start fresh, re-ground the agent in one line, for example: `In the Groundwork <YOUR FIRST NAME> application, ...`. The agent does not remember the previous chat, but the app, the records, and the update sets are all still there.

{% hint style="info" %}
**Tip: attach and prompt together.** Whenever a task needs a file, attach it and send your instruction in the same message. If you attach, then reload, then prompt, the agent will not see the file. Confirm the attachment chip appears before you send.
{% endhint %}

## Before you begin

* Reserve your instance using the link and code on screen. Log in with the credentials provided.
* Navigate to **All > App Development > ServiceNow Studio**.
* The Build Agent chat panel opens by default in new Studio sessions. If it is not open, select **Open Build Agent** from the status bar in the lower corner, or the sparkle icon in the banner.
* Raise your hand at any point. Floor support is here for exactly this.

> 🖼️ *Screenshot: Studio landing page with the Build Agent panel open*

Ready? Start with [Lab 0: Setup and a Parallel Start](lab-0-setup.md).
