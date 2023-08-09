#!/bin/bash -e

TARGET_DIR="$1"
[ "$TARGET_DIR" ] || exit 1

OVERLAY_DIR="$(dirname "$(realpath "$0")")"
SDK_DIR="${SDK_DIR:-$(realpath "$OVERLAY_DIR/../../../../..")}"

# Login root on serial console
sed -i 's~\(respawn:\)/bin/start_getty.*~\1/bin/login -p root~' \
	"$TARGET_DIR/etc/inittab"

# Use uid to detect root user
sed -i 's~"$HOME" != "/home/root"~$(id -u) -ne 0~' "$TARGET_DIR/etc/profile"

if [ -x "$TARGET_DIR/usr/bin/weston" ]; then
	sed -i 's/\(WESTON_USER=\)weston/\1root/' "$TARGET_DIR/etc/init.d/weston"

	echo "Installing weston overlay: $OVERLAY_DIR/weston to $TARGET_DIR..."
	rsync -av --chmod=u=rwX,go=rX "$OVERLAY_DIR/weston/" "$TARGET_DIR/" \
		--exclude="$(basename "$(realpath "$0")")"

	echo "Installing Rockchip test scripts to $TARGET_DIR..."
	rsync -av --chmod=u=rwX,go=rX "$SDK_DIR/external/rockchip-test/" \
		"$TARGET_DIR/rockchip-test/" \
		--include="camera/" --include="video/" --exclude="/*"
fi
