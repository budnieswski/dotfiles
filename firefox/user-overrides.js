/*
 * Install:
 *  1- about:profiles
 *  2- Open Folder in the Root Directory
 *  3- Download arkenfox zipped
 *  4- Move the all unzipped the content to Root Directory
 *  5- Run: prefsCleaner.sh
 *  6- Run: updater.sh
 *
 * Refs:
 *  https://github.com/arkenfox/user.js
 *  https://searchfox.org/mozilla-release/source/browser/app/profile/firefox.js
 */

// Homepage
// 0=blank, 1=home, 2=last visited page, 3=resume previous session
user_pref("browser.startup.page", 3);
