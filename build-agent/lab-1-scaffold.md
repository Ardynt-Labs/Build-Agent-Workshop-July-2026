# Lab 1 · Scaffold Groundwork

*Goal: a working app with a table, fields, sample data, and navigation.*

Still in your second tab, with the plugin installing in tab one, scaffold the app. Groundwork is a work and service request tracker. Facilities team, campus operations, plant site, school district, jobsite: same shape everywhere, which is the point. You will make it yours over the next four labs.

Here is what one prompt is about to give you, and where the later labs plug in:

```
Lab 1 — Scaffold (this lab)
App Navigator: "Groundwork <YOUR FIRST NAME>"
        │
        ▼
Groundwork Request table (extends Task)
Inherited from Task: Number · Priority · Short description ·
Description · Assignment · Status · Activity history
You add: Requested for · Location · Category · Cost estimate
        │
        ▼
6 sample requests
        │
        ▼
Later labs bolt onto the same Groundwork Request table
  Lab 2 · Catalog item  → fulfillment flow creates records in it
  Lab 4 · Shipped story → adds fields + business logic
  Lab 5 · README + ER diagram → describes it
```

*The solid box is what you build in this lab: a Groundwork Request table that extends Task, inheriting the standard request fields so you add only what is specific to operations. The greyed box is what the later labs add on top.*

Your app needs a unique name. Use "Groundwork" plus your first name, wrapped in quotes. Replace the bracketed placeholder with your actual first name. Without the quotes, Build Agent sometimes drops the suffix and the whole room ends up with identical apps.

### Prompt 1 (swap in your name)

```text
Create a new application called "Groundwork <YOUR FIRST NAME>". It tracks work and service requests for an operations team. Build it by extending the platform's Task record into a new table called Groundwork Request, so it reuses the standard fields we already get: a request number, priority, the short and full description, assignment, status, and activity history. Do not rebuild those. On top of the inherited fields, capture what is specific to us: who the request is for, the location or site, the type of request (General, Equipment Loan, Safety, or Contractor Access), and an estimated cost. Make sure the lifecycle covers Pending, Approved, Rejected, and Closed, starting at Pending. Add a handful of realistic sample requests spread across the categories, and make the Groundwork Request list reachable from the application navigator.
```

*While it builds (about 5 minutes): read Lab 2 so you are ready to build the catalog front door next. Glance at tab one to see how the plugin install is progressing.*

> 🖼️ *Screenshot: Build Agent plan for the Groundwork app, before approval*

## Verify

* Open the app navigator (All), find your Groundwork app, open the Groundwork Request list.
* Check the six sample requests exist. Confirm the fields you added (Requested for, Location, Category, Cost estimate) are present on top of the standard fields inherited from Task (number, priority, description, status).
* Missing a field or two? Do not rebuild. Tell Build Agent: "Also add the Cost estimate field to the Groundwork Request table." That is the iteration loop working.

> 🖼️ *Screenshot: Groundwork Request list with six sample records*

{% hint style="success" %}
**Feature Spotlight: plans before changes.** Notice that Build Agent showed you a plan and waited. Nothing was created until you approved. This approval gate is the core governance pattern: the agent proposes, you dispose.
{% endhint %}
