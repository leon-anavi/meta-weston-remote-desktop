FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

PACKAGECONFIG:append = " vnc"

FILES:${PN}:append = " ${sysconfdir}/pam.d/weston-remote-access"
