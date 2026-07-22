# Appendix A · Copy-Paste Backlog (Lab 3 Fallback)

If the image will not ingest, copy the entire block below and paste it into Build Agent as one message. It carries the prompt and all eight stories together, so it produces the same rm_story records as the image.

Answer "Work in the global scope" if the agent asks. This block is generated from the same story data as the spreadsheet, so the numbers match.

```text
The text below is my product backlog. Create one record in the Story [rm_story] table for each STORY block. Map number to the start of the Short description, then the short label, then Description, Acceptance criteria, and Story points to the matching fields. Work in the global scope. Do not create any tables or application metadata, only the story records.

STORY GW-001 | Short description: Auto-approve low-cost requests | Description: As a site manager, I want requests with a cost estimate under $500 to be approved automatically so that routine purchases are not delayed. | Acceptance criteria: - When a new request is created with cost estimate under 500, its status is set to Approved automatically - Requests with cost estimate of 500 or more remain in Pending status - The requester receives a notification when auto-approval occurs | Story points: 3

STORY GW-002 | Short description: Equipment loan return date and overdue reminder | Description: As a lab coordinator, I want equipment loan requests to capture an expected return date so that borrowed items are tracked and returned on time. | Acceptance criteria: - The request form includes an Expected Return Date field, mandatory when category is Equipment Loan - A daily check identifies loans past their expected return date that are not closed - An overdue reminder notification is sent to the requester | Story points: 5

STORY GW-003 | Short description: Safety severity and escalation | Description: As a safety lead, I want safety-related requests to capture a severity level so that high-severity issues are escalated immediately. | Acceptance criteria: - When category is Safety, a Severity field (Low, Medium, High) is visible and mandatory - When severity is High, the request priority is set to Critical - High severity requests trigger a notification to the Safety Response assignment group | Story points: 5

STORY GW-004 | Short description: Contractor access request with expiry | Description: As a facilities coordinator, I want contractor access requests to include an access expiry date so that temporary access does not remain open indefinitely. | Acceptance criteria: - The form includes Access Start Date and Access Expiry Date fields when category is Contractor Access - Access Expiry Date cannot be earlier than Access Start Date - When the expiry date passes, the request status is set to Expired | Story points: 5

STORY GW-005 | Short description: Status dashboard | Description: As a service owner, I want a dashboard showing request volumes by status so that I can see the health of the queue at a glance. | Acceptance criteria: - A UI page displays count cards for each request status - The page includes a list of the 10 most recently created requests - The dashboard is reachable from the application navigation | Story points: 3

STORY GW-006 | Short description: Justification required for high-cost requests | Description: As a finance partner, I want requests over $10,000 to require a justification so that large spend is always explained. | Acceptance criteria: - A Justification field exists on the request form - A request with cost estimate over 10000 cannot be saved with an empty Justification - The user sees a clear message explaining why the save was blocked | Story points: 2

STORY GW-007 | Short description: Requester status notifications | Description: As a requester, I want to be notified when my request is approved or rejected so that I do not have to check the system manually. | Acceptance criteria: - A notification is sent to the requester when status changes to Approved - A notification is sent to the requester when status changes to Rejected - The notification includes the request number, short description, and new status | Story points: 2

STORY GW-008 | Short description: Bulk onboarding request template | Description: As a team lead, I want to generate the standard set of onboarding requests for a new starter in one action so that period-start setup is consistent and fast. | Acceptance criteria: - An action or script generates a predefined set of requests (workspace access, equipment, orientation) for a named person - Generated requests are linked by a common reference so they can be tracked as a group - Each generated request follows the normal approval rules | Story points: 8
```
