# Lab 2 · The Front Door: A Catalog Item

*Goal: a catalog item in Employee Center that creates Groundwork requests, and a lesson about requirements on the way.*

You have a table and some data. Now give people a way to file a request without touching the backend. Doing this before you ship a story is deliberate: building the catalog item teaches you how much the quality of your ask shapes what the agent produces, and that lesson pays off when you drive a real story in Lab 4.

## Round 1: the vague ask

This is the requirement as it usually arrives in your inbox: underspecified, and technically enough to start.

### Prompt 2a

```text
In this Groundwork application, create a catalog item in Employee Center so employees can request work. Give it a sensible name and let people submit a basic request.
```

Approve it. Look at what you get. It will be generic, and that is the point: vague in, vague out. Note what is missing (which fields? where do submissions go? any approval? how would anyone even find it?) before moving on.

> 🖼️ *Screenshot: Generic catalog item from the vague prompt*

## Round 2: the real requirements

Now the BA has done their job. Send this as a revision, not a fresh start:

### Prompt 2b

```text
Create an updated catalog item using these requirements: Name: Submit a Groundwork Request Extended. Category: visible in Employee Center. Variables: Requested for (reference to user, mandatory), Location (single-line text, mandatory), Category (choice matching the Request table categories, mandatory), Cost estimate (decimal), Description (multi-line, mandatory). Fulfillment: on submission, if the cost estimate is under 500, create a record in the Groundwork Request table mapping each variable to the matching field with status Pending; if the cost estimate is 500 or more, require approval from the requester's manager first, create the record on approval, and on rejection add a work note explaining the outcome instead of creating the record. If the user has no manager, then send the approval directly to me (admin). Discoverability: Connect this Catalog Item to an existing topic under the Employee taxonomy. Generate an ATF test that validates a submission creates a Request record.
```

{% hint style="success" %}
**Why 2b is the better prompt.** 2a described what you wanted; 2b describes what "done" looks like. Six things make it buildable: a concrete name; every variable typed and marked mandatory or not; fulfillment spelled out (which table, how each variable maps to a field, the starting status, and the approval branch); an approval rule with an explicit threshold; a discoverability path so people can actually find it; and a test the agent can run to prove the item works. That is the same shape as good acceptance criteria: specific, testable, unambiguous. The agent's output quality tracks your input precision, so the skill you are practicing here is requirement writing, not prompt cleverness.
{% endhint %}

{% hint style="info" %}
**Prefer not to type all that?** You do not have to hand Build Agent a long typed prompt. You can paste the same requirements as CSV, or attach a screenshot of the requirements doc and ask the agent to implement what it reads. Attach and prompt in the same message, and confirm the attachment chip appears before you send. Same result, whichever input you choose.
{% endhint %}

*This build runs a little longer than the others because it also stands up the taxonomy topic. The plugin still installing in tab one covers the wait; carry on reading while it works.*

## Verify

Open Employee Center and search for "Submit a Groundwork Request" (browsing to it comes in Round 3). Submit one, then open your Request list and confirm the record landed with your values. Compare round 1 and round 2: same agent, same platform, different requirements.

> 🖼️ *Screenshot: Submit a Groundwork Request item live in Employee Center*

{% hint style="info" %}
**Optional: run the ATF test.** Build Agent generated an automated test alongside the item. To run it, open **All > Automated Test Framework > Tests**, open "Submit a Groundwork Request creates a Request record," and click Run Test. It spins up a throwaway user, orders the item, and confirms a Request record was created with the right field mappings. Running tests depends on the ATF test-execution property being enabled; your lab instance already has it on. Back home, enable test execution in sub-production only. (Confidence: medium — confirm the exact property name and Studio run path on the instance during the dry run.)
{% endhint %}

## Round 3: make it discoverable (one manual step)

Build Agent created the Workplace services topic, but it cannot finish the link on its own. The catalog item lives in your application scope; the taxonomy topic is a global Employee Center record. The record that connects the two is cross-scope, and the platform will not let an agent create it for you. You wire it up once by hand, which is also a good excuse to meet the scope selector.

* **Set your session scope.** In the header, open the application scope selector and switch from Global to "Groundwork `<YOUR FIRST NAME>`". The link record must be created in your app scope, not global.
* Navigate to **Service Catalog > Catalog Definitions > Maintain Items**.
* Open **Submit a Groundwork Request**.
* In the **Topics (Connected Content)** related list, click **New**, select the Workplace services topic, and save.
* Open Employee Center, browse to the Workplace services topic, and confirm the item now appears there, not just in search.

> 🖼️ *Screenshot: Topics related list on the catalog item, Workplace services linked*

{% hint style="success" %}
**Feature Spotlight: scope is the guardrail.** The friction you just felt is deliberate. Scope is the boundary that stops one application (or an agent working inside it) from silently reaching into another. The same boundary is what lets update sets travel cleanly and what makes safe promotion between instances possible. When an agent says it cannot do something across scopes, that is the platform protecting you, not failing you.
{% endhint %}

{% hint style="success" %}
**Feature Spotlight: update sets, automatically.** Everything Build Agent changed today has been tracked in update sets without you doing anything. In Studio you can review them, revert pieces, and deploy through your normal release process. Agentic development still travels through the governance you already have.
{% endhint %}
