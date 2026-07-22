# Lab 3 · Load Your Backlog

*Goal: eight user stories in the platform backlog, ready to be worked.*

{% hint style="warning" %}
**Check the plugin first.** This lab writes to the Story [rm_story] table, which the plugin from Lab 0 provides. Switch to tab one and confirm the install has completed before you start. If it is still running, give it a minute; scaffolding and the catalog should have bought enough time.
{% endhint %}

At work, requirements do not arrive as beautiful prompts. They arrive as spreadsheets. So that is exactly what you will hand Build Agent: an image of a spreadsheet of user stories. Build Agent reads the image and creates the records for you.

* Download the stories image from the link on screen (`groundwork-stories-sheet.png`).
* Attach it to the Build Agent chat using the attachment control. Confirm the attachment chip appears before you send.
* Send the attachment together with this prompt, in the same message:

### Prompt 3

```text
The attached image is a spreadsheet of user stories. Create one record in the Story [rm_story] table for each data row, mapping the columns to the matching story fields. Put the number value (GW-001 and so on) at the start of each short description. Do not create any tables or app metadata, only the story records.
```

> 🖼️ *Screenshot: Build Agent chat with the stories image attached, before sending*

{% hint style="warning" %}
**Expect a scope question.** Build Agent will ask which scope to work in. Answer "Work in the global scope." The stories live at the platform level, not inside your app, so global is correct here.
{% endhint %}

> 🖼️ *Screenshot: Build Agent asking the scope question, with the global-scope answer*

## Verify

* Ask Build Agent: "List the stories you just created with their short descriptions." Confirm all eight (GW-001 to GW-008).
* Spot-check one story against the printed list below. Pay attention to numbers: a $500 threshold that became $5,000 matters.

> 🖼️ *Screenshot: rm_story list view showing the eight GW records*

{% hint style="warning" %}
**If the image will not ingest.** Start a fresh chat and try again with attach-plus-prompt in one message. If it still misbehaves, use the copy-paste variant in [Appendix A](appendix-a-paste-fallback.md). Same stories, same result.
{% endhint %}

## The backlog

| # | Story | Flavor | Pts |
|:---:|---|---|:---:|
| GW-001 | Auto-approve requests under $500; others stay Pending | General | 3 |
| GW-002 | Equipment loan return date + overdue reminder | Education | 5 |
| GW-003 | Safety severity field; High escalates to safety group | Energy / utilities | 5 |
| GW-004 | Contractor access request with access expiry | Energy / consulting | 5 |
| GW-005 | Status dashboard with count cards + recent list | Anyone (demo candy) | 3 |
| GW-006 | Block save over $10k without justification | Anyone | 2 |
| GW-007 | Notify requester on Approved / Rejected | Anyone | 2 |
| GW-008 | Bulk onboarding request generator | The ambitious | 8 |
