#!/bin/bash

# Exit en cas d'erreur
set -e

# 1. Récupération dynamique de l'utilisateur courant et de son dossier Home
USER_HOME="$HOME"

# Définition du répertoire "Bureau" (s'adapte aussi si le dossier s'appelle "Desktop")
DESKTOP_DIR="${XDG_DESKTOP_DIR:-${USER_HOME}/Bureau}"

# Définition des dossiers et fichiers de destination
DOC_DIR="${USER_HOME}/Documents"
SVG_DEST="${DOC_DIR}/spotify.svg"
DESKTOP_FILE="${DESKTOP_DIR}/spotify.desktop"

SVG_URL="https://upload.wikimedia.org/wikipedia/commons/8/84/Spotify_icon.svg?utm_source=commons.wikimedia.org&utm_campaign=index&utm_content=original"

# 2. Création des dossiers de destination s'ils n'existent pas
mkdir -p "$DOC_DIR"
mkdir -p "$DESKTOP_DIR"

# 3. Téléchargement de l'icône SVG
echo "Téléchargement de l'icône Spotify dans ${SVG_DEST}..."
curl -sSL "$SVG_URL" -o "$SVG_DEST"

# Vérification rapide du téléchargement
if [ -f "$SVG_DEST" ]; then
    echo "Image enregistrée avec succès."
else
    echo "Erreur lors du téléchargement de l'image." >&2
    exit 1
fi

# 4. Création du fichier .desktop directement dans ~/Bureau/spotify.desktop
echo "Création du fichier ${DESKTOP_FILE}..."
cat << EOF > "$DESKTOP_FILE"
[Desktop Entry]
Exec=/bin/bash -c "${USER_HOME}/.spicetify/spicetify apply"
Name=Spotify
Icon=${SVG_DEST}
Type=Application
EOF

# 5. Application des permissions d'exécution
chmod u+x "$DESKTOP_FILE"

echo "Installation terminée ! Le raccourci Spotify a été créé sur le bureau : ${DESKTOP_FILE}"