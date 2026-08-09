# Daybook — getting it onto your phone

I can't compile an Android APK inside this chat (no Android SDK access here), but here's the real
path to one, using free tools. Steps 1–2 get you a working app icon in ~10 minutes. Step 3 gets you
an actual `.apk` file.

## 1. Put these files somewhere public (needs to be https)

Easiest free option — GitHub Pages:
1. Create a new public GitHub repo (e.g. `daybook`).
2. Upload these 5 files to it: `index.html`, `manifest.json`, `service-worker.js`, `icon-192.png`, `icon-512.png`.
3. Repo → Settings → Pages → Deploy from branch → `main` / root. Save.
4. Wait ~1 minute, then your app is live at `https://<your-username>.github.io/daybook/`.

(Netlify's drag-and-drop deploy works too, if you'd rather skip GitHub.)

## 2. Install it as a home-screen app (no APK needed for this part)

Open that URL on your phone in Chrome → menu (⋮) → **Install app** (or **Add to Home screen**).
It opens full-screen with its own icon, and works offline after the first load. Your events are
saved on your phone (`localStorage`) — nothing leaves your device.

## 3. If you specifically want a real `.apk`

1. Go to **pwabuilder.com**.
2. Paste your GitHub Pages URL, click **Start**.
3. Once it scores your app, click **Package for stores → Android**.
4. Download the generated `.apk` (or `.aab` for Play Store).
5. On your phone: enable "Install unknown apps" for your file manager/browser, then open the downloaded file to install it.

## How the "extract event" feature works here

Since this version runs outside Claude, it can't call Claude's API for parsing — instead it uses
**chrono-node**, a free offline date/time parser, loaded from a CDN the first time you open the app.
It's not as smart as an LLM, so always double-check the preview card before saving — you can edit
the title, date, time, and location right there.
