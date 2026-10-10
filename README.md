# Spicetify Desktop Launcher Setup

This repository provides a Bash script designed to automate downloading the official Spotify SVG icon and creating an application shortcut (`.desktop`) directly on your Ubuntu Desktop. The launcher runs `spicetify apply` every time it is executed.

## Prerequisites

Before running this script, make sure **Spicetify** is properly installed on your system.

1. **Installing Spicetify:**

   Please refer to the official documentation to install the Spicetify CLI:

   [Official Spicetify Installation Guide](https://spicetify.app/docs/getting-started)

2. **Verification:**

   Ensure that the `spicetify` executable exists within your home directory:

   ```bash
   ls -l ~/.spicetify/spicetify
   ```

## Usage

### 1. Make the Script Executable

Open a terminal in the directory containing the `install_spotify.sh` script and grant executable permissions:

```bash
chmod u+x install_spotify.sh
```

### 2. Run the Script

Execute the script:

```bash
./install_spotify.sh
```

## How It Works

1. **Icon Download:**

   Downloads the official Spotify SVG icon and saves it to `~/Documents/spotify.svg`.

2. **Creating the `.desktop` File:**

   Generates `spotify.desktop` in your Desktop directory (`~/Desktop` or localized equivalents like `~/Bureau`).

3. **Setting Permissions:**

   Grants executable permissions to the `.desktop` file (`chmod u+x`).

## Note for Ubuntu (GNOME) Users

The first time you use the shortcut on your desktop:

1. **Right-click** the `spotify.desktop` icon on your desktop.
2. Select **"Allow Launching"**.
