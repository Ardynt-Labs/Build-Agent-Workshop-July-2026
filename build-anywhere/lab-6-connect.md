# Lab 6 · Connect to Groundwork from the Command Line

Your Groundwork app is sitting on your instance. Moving to the command line changes none of that. You will authenticate the SDK to the instance, pull your existing scoped app down as Fluent source, and confirm you can see it locally.

{% hint style="warning" %}
**IMPORTANT — You will need four data items to finish this configuration.**

* Your instance URL, username, and password are all on your instance reservation page — the same page you used this morning. The password is hidden; click the lock icon to reveal it.
* The one thing not on that page is your Groundwork app's sys\_id: get it from your app in Studio (or the sys\_app record), or simply ask Build Agent in your instance, "What is the sys\_id of my application?"
* We recommend that you capture these 4 items in your note-taking software of choice, e.g Notepad, OneNote.
{% endhint %}

<figure><img src="../.gitbook/assets/lab6-instance-reservation-page.png" alt="Instance reservation page showing the instance URL and login details, with the password hidden behind a lock icon"><figcaption><p>Click on image to zoom in</p></figcaption></figure>

<figure><img src="../.gitbook/assets/lab6-ask-sys-id.png" alt="Build Agent answering &#x22;what is the sys id of the app?&#x22; with the application&#x27;s sys_id"><figcaption><p>Click on image to zoom in</p></figcaption></figure>

### Step 1 · Start your Codespace

* Open your team repository link (from the organizers). Use the provided GitHub credentials to sign in. These were shared to the email address you signed up for the workshop with prior to today. If you have any trouble signing in or finding the credentials, please flag one of the gurus.
* On the repository page, click the green Code button (top right of the file list), switch to the Codespaces tab, then **Create codespace on main**.

<figure><img src="../.gitbook/assets/lab6-create-codespace.png" alt="GitHub repository page with the Code dropdown open on the Codespaces tab, showing &#x22;Create codespace on main&#x22;"><figcaption><p>Click on image to zoom in</p></figcaption></figure>

* A new browser tab opens and **the workspace builds for a few minutes (up to 5 minutes)**; wait for VS Code to appear. (Coming back later? The same **Code > Codespaces** menu lists your existing codespace — click its name to reopen it instead of creating a new one.)

<figure><img src="../.gitbook/assets/lab6-codespace-vscode-loaded.png" alt="VS Code loaded in the Codespace, showing the repository&#x27;s README.md and an open terminal"><figcaption><p>Click on image to zoom in</p></figcaption></figure>

* When VS Code opens, open a terminal if one is not showing: menu (three lines) > Terminal > **New Terminal**. Type bash and press Enter.

<figure><img src="../.gitbook/assets/lab6-terminal-type-bash.png" alt="Terminal after opening, with &#x22;bash&#x22; typed and ready to run"><figcaption><p>Click on image to zoom in</p></figcaption></figure>

* Paste tip: if the browser asks for clipboard permission, click Allow. If pasting into the terminal does not work, use Ctrl/Cmd+Shift+V and click the Paste popup.

<figure><img src="../.gitbook/assets/lab6-clipboard-permission-popup.png" alt="Browser clipboard-permission popup for the Codespace, with Allow highlighted"><figcaption><p>Click on image to zoom in</p></figcaption></figure>

* The README file included lists the setup steps, so you can easily follow along.

### Step 2 · Connect, pull your app in, and start Claude

Run these in order. Replace the parts in capitals with your own values. If you are new to the command line, we recommend that you first paste these commands in your note-taking app, fill in with the values in the note-taking app, and then you can paste the full command in the terminal.

<figure><img src="../.gitbook/assets/lab6-notes-app-example.png" alt="Example note-taking doc with the instance URL, credentials, app sys_id, and the now-sdk commands filled in — the recommended way to prep values before pasting into the terminal"><figcaption><p>Click on image to zoom in</p></figcaption></figure>

**1.**

{% code overflow="wrap" %}
```bash
bash
```
{% endcode %}

Reloads all the tools we have pre-loaded in this Codespace for you. This is very important to do at the beginning of each Codespace session.

**2.**

{% code overflow="wrap" %}
```bash
now-sdk auth --add https://YOUR-INSTANCE.service-now.com
```
{% endcode %}

Registers your instance and stores your login so the SDK can talk to it. Answer the prompts in order. Select / type answers exactly as indicated. Hit Enter after each one.

* **auth type** `basic`
* **alias** `team`
* then provide you username and password (the password stays hidden as you type, which is normal)

<figure><img src="../.gitbook/assets/lab6-auth-type-basic.png" alt="now-sdk auth prompt: selecting &#x22;basic&#x22; as the authentication type"><figcaption><p>Click on image to zoom in</p></figcaption></figure>

<figure><img src="../.gitbook/assets/lab6-auth-alias-team.png" alt="now-sdk auth prompt: entering &#x22;team&#x22; as the alias"><figcaption><p>Click on image to zoom in</p></figcaption></figure>

<figure><img src="../.gitbook/assets/lab6-auth-username-password.png" alt="now-sdk auth prompt: entering the username and masked password"><figcaption><p>Click on image to zoom in</p></figcaption></figure>

<figure><img src="../.gitbook/assets/lab6-auth-success.png" alt="now-sdk auth completing successfully, with credentials stored under alias &#x27;team&#x27;"><figcaption><p>Click on image to zoom in</p></figcaption></figure>

**3.**

{% code overflow="wrap" %}
```bash
now-sdk init --from YOUR_APP_SYS_ID --auth team
```
{% endcode %}

Creates a local project mirroring your existing app.

* `--from <sys_id>` tells it which app to pull;
* `--auth team` uses the credentials you just saved.

This is the "adopt your morning app" step. When it asks for an NPM package name, type `team-app` (do not change this) and press Enter.

<figure><img src="../.gitbook/assets/lab6-init-npm-package-name.png" alt="now-sdk init prompting for the NPM package name, answered with &#x22;team-app&#x22;"><figcaption><p>Click on image to zoom in</p></figcaption></figure>

**4.**

{% code overflow="wrap" %}
```bash
npm install
```
{% endcode %}

Downloads the Node packages the project depends on (listed in its package.json). One-time, takes a moment. You might get some warnings, they are irrelevant to our workshop.

**5.**

{% code overflow="wrap" %}
```bash
now-sdk transform
```
{% endcode %}

Converts the pulled app metadata into editable Fluent (TypeScript) source in the project. Wait for "Transform completed successfully."

<figure><img src="../.gitbook/assets/lab6-transform-complete.png" alt="now-sdk transform finishing with &#x22;Transform completed successfully&#x22;"><figcaption><p>Click on image to zoom in</p></figcaption></figure>

**6.**

{% code overflow="wrap" %}
```bash
claude
```
{% endcode %}

Launches Claude Code inside the project so you can prompt it. First time only: accept the setup questions and choose Yes to use the API key (even though it labels it "No (recommended)" — it is pre-wired for the lab).

Hit Enter at the first screen as seen below:

<figure><img src="../.gitbook/assets/claude-code-setup-theme.png" alt="Claude Code&#x27;s first setup screen: choosing a terminal text style/theme"><figcaption><p>Click on image to zoom in</p></figcaption></figure>

Select Option 1 and hit Enter:

<figure><img src="../.gitbook/assets/claude-code-setup-api-key.png" alt="Claude Code detecting the pre-wired API key and asking whether to use it — select option 1, Yes"><figcaption><p>Click on image to zoom in</p></figcaption></figure>

Hit Enter:

<figure><img src="../.gitbook/assets/claude-code-setup-security-notes.png" alt="Claude Code&#x27;s security notes screen — press Enter to continue"><figcaption><p>Click on image to zoom in</p></figcaption></figure>

Hit Enter:

<figure><img src="../.gitbook/assets/claude-code-setup-terminal-settings.png" alt="Claude Code asking whether to use recommended terminal settings — press Enter to accept"><figcaption><p>Click on image to zoom in</p></figcaption></figure>

Hit Enter (Codespaces do not store anything on your machine):

<figure><img src="../.gitbook/assets/claude-code-setup-trust-folder.png" alt="Claude Code asking to trust the workspace folder — press Enter to accept (Codespaces don&#x27;t persist anything locally)"><figcaption><p>Click on image to zoom in</p></figcaption></figure>

You are in.

<figure><img src="../.gitbook/assets/claude-code-launched.png" alt="Claude Code launched and ready, showing the model (Opus 4.8) and workspace"><figcaption><p>Click on image to zoom in</p></figcaption></figure>

Follow the labs below to tell Claude what to build and approve its steps (**"Yes, and don't ask again"** is fine). When it hands you a deploy command, you run it yourself by typing `! npm run deploy` (the exclamation mark is important). Don't worry, Claude will remind you what the command is if you forget.

{% hint style="success" %}
**Feature Spotlight: same scope, new cockpit.** The SDK authenticated to the instance separately from your browser, and it deploys into the very same scoped application. Scope, ACLs, and update sets all still apply. The governance you met this morning did not disappear because you changed tools; it travels with the app.
{% endhint %}
