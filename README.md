# 🔗 FiveM Weapon Lanyard Script

![FiveM](https://img.shields.io/badge/FiveM-Script-orange?style=for-the-badge)
![Standalone](https://img.shields.io/badge/Standalone-Supported-green?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Stable-brightgreen?style=for-the-badge)
![License](https://img.shields.io/badge/License-Free-lightgrey?style=for-the-badge)

A realistic **Weapon Lanyard Script for FiveM** that simulates the safety lanyard used by law enforcement officers.

When a supported weapon is drawn, a **lanyard connects the weapon to the player's body**, adding extra realism and immersion to your roleplay server.

The script is **lightweight, configurable, and compatible with both QBCore and Standalone servers.**

---

# 📸 Preview

### In-Game Preview

Add preview images here:

![preview](images/preview1.png)
![preview](images/preview2.png)
![preview](images/preview3.png)

### Video Preview

Add your video here:

https://your-video-link-here

---

# ✨ Features

- Works with **QBCore**
- Fully functional in **Standalone mode**
- Option to show the lanyard **only for police jobs**
- Option to show the lanyard **for all players**
- Configure **which weapons will use the lanyard**
- Simple and clean **config file**
- Lightweight and optimized
- Adds **extra realism** to RP servers

---

# 📂 Download

GitHub Repository:

YOUR_GITHUB_LINK_HERE

---

# ⚙️ Installation

Follow these steps to install the script.

## 📥 Step 1 – Download

Download the resource from GitHub.

---

## 📁 Step 2 – Add to resources

Place the script folder inside your server resources directory.

Example:

```
resources/[scripts]/weapon-lanyard
```

---

## 🧾 Step 3 – Add to server.cfg

Add the following line to your **server.cfg**

```
ensure weapon-lanyard
```

---

## ✅ Step 4 – Restart the server

Restart your server and the script will start automatically.

---

# 🔧 Configuration

All settings can be edited in:

```
config.lua
```

---

## Framework Selection

Choose which framework your server uses.

```
Config.Framework = "qbcore"
```

or

```
Config.Framework = "standalone"
```

---

## Police Only Mode

Enable the lanyard **only for police jobs**

```
Config.PoliceOnly = true
```

Allow the lanyard **for all players**

```
Config.PoliceOnly = false
```

---

## Supported Weapons

You can configure which weapons will use the lanyard.

Example:

```
Config.Weapons = {
    "weapon_pistol",
    "weapon_combatpistol",
    "weapon_heavypistol"
}
```

---

# 🧠 Use Cases

Perfect for:

- Police departments
- Law enforcement RP
- Realistic roleplay servers
- Servers looking to improve immersion

---

# 🛠 Support

If you encounter bugs or want to suggest improvements:

Open an **Issue on GitHub**

---

# ❤️ Credits

Created by

**Sols Files**
