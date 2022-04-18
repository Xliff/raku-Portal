use v6.c;

use GLib::Raw::Definitions;
use Portal::Raw::Definitions;

unit package Portal::Raw::Enums;

constant XdpBackgroundFlags is export := guint32;
our enum XdpBackgroundFlagsEnum is export (
  XDP_BACKGROUND_FLAG_NONE        =>      0,
  XDP_BACKGROUND_FLAG_AUTOSTART   => 1 +< 0,
  XDP_BACKGROUND_FLAG_ACTIVATABLE => 1 +< 1,
);

constant XdpButtonState is export := guint32;
our enum XdpButtonStateEnum is export (
  XDP_BUTTON_RELEASED => 0,
  XDP_BUTTON_PRESSED  => 1,
);

constant XdpCameraFlags is export := guint32;
our enum XdpCameraFlagsEnum is export (
  XDP_CAMERA_FLAG_NONE => 0,
);

constant XdpDeviceType is export := guint32;
our enum XdpDeviceTypeEnum is export (
  XDP_DEVICE_NONE        =>      0,
  XDP_DEVICE_KEYBOARD    => 1 +< 0,
  XDP_DEVICE_POINTER     => 1 +< 1,
  XDP_DEVICE_TOUCHSCREEN => 1 +< 2,
);

constant XdpDiscreteAxis is export := guint32;
our enum XdpDiscreteAxisEnum is export (
  XDP_AXIS_HORIZONTAL_SCROLL => 0,
  XDP_AXIS_VERTICAL_SCROLL   => 1,
);

constant XdpEmailFlags is export := guint32;
our enum XdpEmailFlagsEnum is export (
  XDP_EMAIL_FLAG_NONE => 0,
);

constant XdpInhibitFlags is export := guint32;
our enum XdpInhibitFlagsEnum is export (
  XDP_INHIBIT_FLAG_LOGOUT      => 1 +< 0,
  XDP_INHIBIT_FLAG_USER_SWITCH => 1 +< 1,
  XDP_INHIBIT_FLAG_SUSPEND     => 1 +< 2,
  XDP_INHIBIT_FLAG_IDLE        => 1 +< 3,
);

constant XdpKeyState is export := guint32;
our enum XdpKeyStateEnum is export (
  XDP_KEY_RELEASED => 0,
  XDP_KEY_PRESSED  => 1,
);

constant XdpLocationAccuracy is export := guint32;
our enum XdpLocationAccuracyEnum is export <
  XDP_LOCATION_ACCURACY_NONE
  XDP_LOCATION_ACCURACY_COUNTRY
  XDP_LOCATION_ACCURACY_CITY
  XDP_LOCATION_ACCURACY_NEIGHBORHOOD
  XDP_LOCATION_ACCURACY_STREET
  XDP_LOCATION_ACCURACY_EXACT
>;

constant XdpLocationMonitorFlags is export := guint32;
our enum XdpLocationMonitorFlagsEnum is export (
  XDP_LOCATION_MONITOR_FLAG_NONE => 0,
);

constant XdpLoginSessionState is export := guint32;
our enum XdpLoginSessionStateEnum is export (
  XDP_LOGIN_SESSION_RUNNING   => 1,
  XDP_LOGIN_SESSION_QUERY_END => 2,
  XDP_LOGIN_SESSION_ENDING    => 3,
);

constant XdpNotificationFlags is export := guint32;
our enum XdpNotificationFlagsEnum is export (
  XDP_NOTIFICATION_FLAG_NONE => 0,
);

constant XdpOpenFileFlags is export := guint32;
our enum XdpOpenFileFlagsEnum is export (
  XDP_OPEN_FILE_FLAG_NONE     =>      0,
  XDP_OPEN_FILE_FLAG_MULTIPLE => 1 +< 0,
);

constant XdpOpenUriFlags is export := guint32;
our enum XdpOpenUriFlagsEnum is export (
  XDP_OPEN_URI_FLAG_NONE     =>      0,
  XDP_OPEN_URI_FLAG_ASK      => 1 +< 0,
  XDP_OPEN_URI_FLAG_WRITABLE => 1 +< 1,
);

constant XdpOutputType is export := guint32;
our enum XdpOutputTypeEnum is export (
  XDP_OUTPUT_MONITOR => 1 +< 0,
  XDP_OUTPUT_WINDOW  => 1 +< 1,
);

constant XdpPrintFlags is export := guint32;
our enum XdpPrintFlagsEnum is export (
  XDP_PRINT_FLAG_NONE => 0,
);

constant XdpRemoteDesktopFlags is export := guint32;
our enum XdpRemoteDesktopFlagsEnum is export (
  XDP_REMOTE_DESKTOP_FLAG_NONE     =>      0,
  XDP_REMOTE_DESKTOP_FLAG_MULTIPLE => 1 +< 0,
);

constant XdpSaveFileFlags is export := guint32;
our enum XdpSaveFileFlagsEnum is export (
  XDP_SAVE_FILE_FLAG_NONE => 0,
);

constant XdpScreencastFlags is export := guint32;
our enum XdpScreencastFlagsEnum is export (
  XDP_SCREENCAST_FLAG_NONE     =>      0,
  XDP_SCREENCAST_FLAG_MULTIPLE => 1 +< 0,
);

constant XdpScreenshotFlags is export := guint32;
our enum XdpScreenshotFlagsEnum is export (
  XDP_SCREENSHOT_FLAG_NONE        =>      0,
  XDP_SCREENSHOT_FLAG_INTERACTIVE => 1 +< 0,
);

constant XdpSessionMonitorFlags is export := guint32;
our enum XdpSessionMonitorFlagsEnum is export (
  XDP_SESSION_MONITOR_FLAG_NONE => 0,
);

constant XdpSessionState is export := guint32;
our enum XdpSessionStateEnum is export <
  XDP_SESSION_INITIAL
  XDP_SESSION_ACTIVE
  XDP_SESSION_CLOSED
>;

constant XdpSessionType is export := guint32;
our enum XdpSessionTypeEnum is export <
  XDP_SESSION_SCREENCAST
  XDP_SESSION_REMOTE_DESKTOP
>;

constant XdpSpawnFlags is export := guint32;
our enum XdpSpawnFlagsEnum is export (
  XDP_SPAWN_FLAG_NONE       =>      0,
  XDP_SPAWN_FLAG_CLEARENV   => 1 +< 0,
  XDP_SPAWN_FLAG_LATEST     => 1 +< 1,
  XDP_SPAWN_FLAG_SANDBOX    => 1 +< 2,
  XDP_SPAWN_FLAG_NO_NETWORK => 1 +< 3,
  XDP_SPAWN_FLAG_WATCH      => 1 +< 4,
);

constant XdpUpdateInstallFlags is export := guint32;
our enum XdpUpdateInstallFlagsEnum is export (
  XDP_UPDATE_INSTALL_FLAG_NONE => 0,
);

constant XdpUpdateMonitorFlags is export := guint32;
our enum XdpUpdateMonitorFlagsEnum is export (
  XDP_UPDATE_MONITOR_FLAG_NONE => 0,
);

constant XdpUpdateStatus is export := guint32;
our enum XdpUpdateStatusEnum is export <
  XDP_UPDATE_STATUS_RUNNING
  XDP_UPDATE_STATUS_EMPTY
  XDP_UPDATE_STATUS_DONE
  XDP_UPDATE_STATUS_FAILED
>;

constant XdpUserInformationFlags is export := guint32;
our enum XdpUserInformationFlagsEnum is export (
  XDP_USER_INFORMATION_FLAG_NONE => 0,
);

constant XdpWallpaperFlags is export := guint32;
our enum XdpWallpaperFlagsEnum is export (
  XDP_WALLPAPER_FLAG_NONE       =>      0,
  XDP_WALLPAPER_FLAG_BACKGROUND => 1 +< 0,
  XDP_WALLPAPER_FLAG_LOCKSCREEN => 1 +< 1,
  XDP_WALLPAPER_FLAG_PREVIEW    => 1 +< 2,
);
