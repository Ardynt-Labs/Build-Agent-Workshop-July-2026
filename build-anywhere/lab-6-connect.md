# Lab 6 · Connect to Groundwork from the Command Line

Your Groundwork app is sitting on your instance. Moving to the command line changes none of that. You will authenticate the SDK to the instance, pull your existing scoped app down as Fluent source, and confirm you can see it locally.

{% hint style="warning" %}
**IMPORTANT — You will need four data items to finish this configuration.**

* Your instance URL, username, and password are all on your instance reservation page — the same page you used this morning. The password is hidden; click the lock icon to reveal it.

![Instance reservation page showing the instance URL and login details, with the password hidden behind a lock icon](assets/lab6-instance-reservation-page.png)

* The one thing not on that page is your Groundwork app's sys_id: get it from your app in Studio (or the sys_app record), or simply ask Build Agent in your instance, "What is the sys_id of my application?"

![Build Agent answering "what is the sys id of the app?" with the application's sys_id](assets/lab6-ask-sys-id.png)

* We recommend that you capture these 4 items in your note-taking software of choice, e.g Notepad, OneNote.
{% endhint %}

### Step 1 · Start your Codespace

* Open your team repository link (from the organizers). Use the provided GitHub credentials to sign in. These were shared to the email address you signed up for the workshop with prior to today. If you have any trouble signing in or finding the credentials, please flag one of the gurus.
* On the repository page, click the green Code button (top right of the file list), switch to the Codespaces tab, then **Create codespace on main**.

![GitHub repository page with the Code dropdown open on the Codespaces tab, showing "Create codespace on main"](assets/lab6-create-codespace.png)

* A new browser tab opens and **the workspace builds for a few minutes (up to 5 minutes)**; wait for VS Code to appear. (Coming back later? The same **Code > Codespaces** menu lists your existing codespace — click its name to reopen it instead of creating a new one.)

![VS Code loaded in the Codespace, showing the repository's README.md and an open terminal](assets/lab6-codespace-vscode-loaded.png)

* When VS Code opens, open a terminal if one is not showing: menu (three lines) > Terminal > **New Terminal**. Type bash and press Enter.

![Terminal after opening, with "bash" typed and ready to run](assets/lab6-terminal-type-bash.png)

* Paste tip: if the browser asks for clipboard permission, click Allow. If pasting into the terminal does not work, use Ctrl/Cmd+Shift+V and click the Paste popup.

![Browser clipboard-permission popup for the Codespace, with Allow highlighted](assets/lab6-clipboard-permission-popup.png)

* The README file included lists the setup steps, so you can easily follow along.

### Step 2 · Connect, pull your app in, and start Claude

Run these in order. Replace the parts in capitals with your own values. If you are new to the command line, we recommend that you first paste these commands in your note-taking app, fill in with the values in the note-taking app, and then you can paste the full command in the terminal.

![Example note-taking doc with the instance URL, credentials, app sys_id, and the now-sdk commands filled in — the recommended way to prep values before pasting into the terminal](assets/lab6-notes-app-example.png)

**1.**
```bash
bash
```
Reloads all the tools we have pre-loaded in this Codespace for you. This is very important to do at the beginning of each Codespace session.

**2.**
```bash
now-sdk auth --add https://YOUR-INSTANCE.service-now.com
```
Registers your instance and stores your login so the SDK can talk to it. Answer the prompts in order. Select / type answers exactly as indicated. Hit Enter after each one.

* **auth type** `basic`
* **alias** `team`
* then provide you username and password (the password stays hidden as you type, which is normal)

![now-sdk auth prompt: selecting "basic" as the authentication type](assets/lab6-auth-type-basic.png)

![now-sdk auth prompt: entering "team" as the alias](assets/lab6-auth-alias-team.png)

![now-sdk auth prompt: entering the username and masked password](assets/lab6-auth-username-password.png)

![now-sdk auth completing successfully, with credentials stored under alias 'team'](assets/lab6-auth-success.png)

**3.**
```bash
now-sdk init --from YOUR_APP_SYS_ID --auth team
```
Creates a local project mirroring your existing app.

* `--from <sys_id>` tells it which app to pull;
* `--auth team` uses the credentials you just saved.

This is the "adopt your morning app" step. When it asks for an NPM package name, type `team-app` (do not change this) and press Enter.

![now-sdk init prompting for the NPM package name, answered with "team-app"](assets/lab6-init-npm-package-name.png)

**4.**
```bash
npm install
```
Downloads the Node packages the project depends on (listed in its package.json). One-time, takes a moment. You might get some warnings, they are irrelevant to our workshop.

**5.**
```bash
now-sdk transform
```
Converts the pulled app metadata into editable Fluent (TypeScript) source in the project. Wait for "Transform completed successfully."

![now-sdk transform finishing with "Transform completed successfully"](assets/lab6-transform-complete.png)

**6.**
```bash
claude
```
Launches Claude Code inside the project so you can prompt it. First time only: accept the setup questions and choose Yes to use the API key (even though it labels it "No (recommended)" — it is pre-wired for the lab).

Hit Enter at the first screen as seen below:

![Claude Code's first setup screen: choosing a terminal text style/theme](assets/claude-code-setup-theme.png)

Select Option 1 and hit Enter:

![Claude Code detecting the pre-wired API key and asking whether to use it — select option 1, Yes](assets/claude-code-setup-api-key.png)

Hit Enter:

![Claude Code's security notes screen — press Enter to continue](assets/claude-code-setup-security-notes.png)

Hit Enter:

![Claude Code asking whether to use recommended terminal settings — press Enter to accept](assets/claude-code-setup-terminal-settings.png)

Hit Enter (Codespaces do not store anything on your machine):

![Claude Code asking to trust the workspace folder — press Enter to accept (Codespaces don't persist anything locally)](assets/claude-code-setup-trust-folder.png)

You are in.

![Claude Code launched and ready, showing the model (Opus 4.8) and workspace](assets/claude-code-launched.png)

Follow the labs below to tell Claude what to build and approve its steps (**"Yes, and don't ask again"** is fine). When it hands you a deploy command, you run it yourself by typing `! npm run deploy` (the exclamation mark is important). Don't worry, Claude will remind you what the command is if you forget.

{% hint style="success" %}
**Feature Spotlight: same scope, new cockpit.** The SDK authenticated to the instance separately from your browser, and it deploys into the very same scoped application. Scope, ACLs, and update sets all still apply. The governance you met this morning did not disappear because you changed tools; it travels with the app.
{% endhint %}
