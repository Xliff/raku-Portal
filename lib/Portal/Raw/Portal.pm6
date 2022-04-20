use v6.c;

use GLib::Raw::Definitions;
use Portal::Raw::Definitions;

unit package Portal::Raw::Portal;


### /usr/src/libportal-0.4/libportal/filechooser.h

sub xdp_portal_open_file (
  XdpPortal        $portal,
  XdpParent        $parent,
  Str              $title,
  GVariant         $filters,
  GVariant         $current_filter,
  GVariant         $choices,
  XdpOpenFileFlags $flags,
  GCancellable     $cancellable,
                   &callback (XdpPortal, GAsyncResults, gpointer),
  gpointer         $data
)
  is native(rest)
  is export
{ * }

sub xdp_portal_open_file_finish (
  XdpPortal               $portal,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns GVariant
  is native(rest)
  is export
{ * }

sub xdp_portal_save_file (
  XdpPortal        $portal,
  XdpParent        $parent,
  Str              $title,
  Str              $current_name,
  Str              $current_folder,
  Str              $current_file,
  GVariant         $filters,
  GVariant         $current_filter,
  GVariant         $choices,
  XdpSaveFileFlags $flags,
  GCancellable     $cancellable,
                   &callback (XdpPortal, GAsyncResults, gpointer),
  gpointer         $data
)
  is native(rest)
  is export
{ * }

sub xdp_portal_save_file_finish (
  XdpPortal               $portal,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns GVariant
  is native(rest)
  is export
{ * }

sub xdp_portal_save_files (
  XdpPortal        $portal,
  XdpParent        $parent,
  Str              $title,
  Str              $current_name,
  Str              $current_folder,
  GVariant         $files,
  GVariant         $choices,
  XdpSaveFileFlags $flags,
  GCancellable     $cancellable,
                   &callback (XdpPortal, GAsyncResults, gpointer),
  gpointer         $data
)
  is native(rest)
  is export
{ * }

sub xdp_portal_save_files_finish (
  XdpPortal               $portal,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns GVariant
  is native(rest)
  is export
{ * }

### /usr/src/libportal-0.4/libportal/inhibit.h

sub xdp_portal_session_inhibit (
  XdpPortal           $portal,
  XdpParent           $parent,
  Str                 $reason,
  XdpInhibitFlags     $flags,
  GCancellable        $cancellable,
                      &callback (XdpPortal, GAsyncResults, gpointer),
  gpointer            $data
)
  is native(rest)
  is export
{ * }

sub xdp_portal_session_inhibit_finish (
  XdpPortal               $portal,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns gint
  is native(rest)
  is export
{ * }

sub xdp_portal_session_monitor_query_end_response (XdpPortal $portal)
  is native(rest)
  is export
{ * }

sub xdp_portal_session_monitor_start (
  XdpPortal              $portal,
  XdpParent              $parent,
  XdpSessionMonitorFlags $flags,
  GCancellable           $cancellable,
  GAsyncReadyCallback    $callback,
  gpointer               $data
)
  is native(rest)
  is export
{ * }

sub xdp_portal_session_monitor_start_finish (
  XdpPortal               $portal,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(rest)
  is export
{ * }

sub xdp_portal_session_monitor_stop (XdpPortal $portal)
  is native(rest)
  is export
{ * }

sub xdp_portal_session_uninhibit (XdpPortal $portal, gint $id)
  is native(rest)
  is export
{ * }


### /usr/src/libportal-0.4/libportal/location.h

sub xdp_portal_location_monitor_start (
  XdpPortal               $portal,
  XdpParent               $parent,
  guint                   $distance_threshold,
  guint                   $time_threshold,
  XdpLocationAccuracy     $accuracy,
  XdpLocationMonitorFlags $flags,
  GCancellable            $cancellable,
                          &callback (XdpPortal, GAsyncResult, gpointer),
  gpointer                $data
)
  is native(rest)
  is export
{ * }

sub xdp_portal_location_monitor_start_finish (
  XdpPortal               $portal,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(rest)
  is export
{ * }

sub xdp_portal_location_monitor_stop (XdpPortal $portal)
  is native(rest)
  is export
{ * }


### /usr/src/libportal-0.4/libportal/notification.h

sub xdp_portal_add_notification (
  XdpPortal            $portal,
  Str                  $id,
  GVariant             $notification,
  XdpNotificationFlags $flags,
  GCancellable         $cancellable,
                       &callback (XdpPortal, GAsyncResult, gpointer),
  gpointer             $data
)
  is native(portal)
  is export
{ * }

sub xdp_portal_add_notification_finish (
  XdpPortal               $portal,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(portal)
  is export
{ * }

sub xdp_portal_remove_notification (XdpPortal $portal, Str $id)
  is native(portal)
  is export
{ * }

### /usr/src/libportal-0.4/libportal/openuri.h

sub xdp_portal_open_directory (
  XdpPortal       $portal,
  XdpParent       $parent,
  Str             $uri,
  XdpOpenUriFlags $flags,
  GCancellable    $cancellable,
                  &callback (XdpPortal, GAsyncResult, gpointer),
  gpointer        $data
)
  is native(portal)
  is export
{ * }

sub xdp_portal_open_directory_finish (
  XdpPortal               $portal,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(portal)
  is export
{ * }

sub xdp_portal_open_uri (
  XdpPortal       $portal,
  XdpParent       $parent,
  Str             $uri,
  XdpOpenUriFlags $flags,
  GCancellable    $cancellable,
                  &callback (XdpPortal, GAsyncResult, gpointer),
  gpointer        $data
)
  is native(portal)
  is export
{ * }

sub xdp_portal_open_uri_finish (
  XdpPortal               $portal,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(portal)
  is export
{ * }

### /usr/src/libportal-0.4/libportal/print.h

sub xdp_portal_prepare_print (
  XdpPortal     $portal,
  XdpParent     $parent,
  Str           $title,
  GVariant      $settings,
  GVariant      $page_setup,
  XdpPrintFlags $flags,
  GCancellable  $cancellable,
                &callback (XdpPortal, GAsyncResult, gpointer),
  gpointer      $data
)
  is native(portal)
  is export
{ * }

sub xdp_portal_prepare_print_finish (
  XdpPortal               $portal,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns GVariant
  is native(portal)
  is export
{ * }

sub xdp_portal_print_file (
  XdpPortal     $portal,
  XdpParent     $parent,
  Str           $title,
  guint         $token,
  Str           $file,
  XdpPrintFlags $flags,
  GCancellable  $cancellable,
                &callback (XdpPortal, GAsyncResult, gpointer),
  gpointer      $data
)
  is native(portal)
  is export
{ * }

sub xdp_portal_print_file_finish (
  XdpPortal               $portal,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(portal)
  is export
{ * }

### /usr/src/libportal-0.4/libportal/remote.h

sub xdp_portal_create_remote_desktop_session (
  XdpPortal             $portal,
  XdpDeviceType         $devices,
  XdpOutputType         $outputs,
  XdpRemoteDesktopFlags $flags,
  GCancellable          $cancellable,
                        &callback (XdpPortal, GAsyncResult, gpointer),
  gpointer              $data
)
  is native(portal)
  is export
{ * }

sub xdp_portal_create_remote_desktop_session_finish (
  XdpPortal               $portal,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns XdpSession
  is native(portal)
  is export
{ * }

sub xdp_portal_create_screencast_session (
  XdpPortal          $portal,
  XdpOutputType      $outputs,
  XdpScreencastFlags $flags,
  GCancellable       $cancellable,
                     &callback (XdpPortal, GAsyncResult, gpointer),
  gpointer           $data
)
  is native(portal)
  is export
{ * }

sub xdp_portal_create_screencast_session_finish (
  XdpPortal               $portal,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns XdpSession
  is native(portal)
  is export
{ * }

sub xdp_session_close (XdpSession $session)
  is native(portal)
  is export
{ * }

sub xdp_session_get_devices (XdpSession $session)
  returns XdpDeviceType
  is native(portal)
  is export
{ * }

sub xdp_session_get_session_state (XdpSession $session)
  returns XdpSessionState
  is native(portal)
  is export
{ * }

sub xdp_session_get_session_type (XdpSession $session)
  returns XdpSessionType
  is native(portal)
  is export
{ * }

sub xdp_session_get_streams (XdpSession $session)
  returns GVariant
  is native(portal)
  is export
{ * }

sub xdp_session_get_type ()
  returns GType
  is native(portal)
  is export
{ * }

sub xdp_session_keyboard_key (
  XdpSession  $session,
  gboolean    $keysym,
  gint        $key,
  XdpKeyState $state
)
  is native(portal)
  is export
{ * }

sub xdp_session_open_pipewire_remote (XdpSession $session)
  returns gint
  is native(portal)
  is export
{ * }

sub xdp_session_pointer_axis (
  XdpSession $session,
  gboolean   $finish,
  gdouble    $dx,
  gdouble    $dy
)
  is native(portal)
  is export
{ * }

sub xdp_session_pointer_axis_discrete (
  XdpSession      $session,
  XdpDiscreteAxis $axis,
  gint            $steps
)
  is native(portal)
  is export
{ * }

sub xdp_session_pointer_button (
  XdpSession     $session,
  gint           $button,
  XdpButtonState $state
)
  is native(portal)
  is export
{ * }

sub xdp_session_pointer_motion (XdpSession $session, gdouble $dx, gdouble $dy)
  is native(portal)
  is export
{ * }

sub xdp_session_pointer_position (
  XdpSession $session,
  guint      $stream,
  gdouble    $x,
  gdouble    $y
)
  is native(portal)
  is export
{ * }

sub xdp_session_start (
  XdpSession   $session,
  XdpParent    $parent,
  GCancellable $cancellable,
               &callback (XdpPortal, GAsyncResult, gpointer),
  gpointer     $data
)
  is native(portal)
  is export
{ * }

sub xdp_session_start_finish (
  XdpSession              $session,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(portal)
  is export
{ * }

sub xdp_session_touch_down (
  XdpSession $session,
  guint      $stream,
  guint      $slot,
  gdouble    $x,
  gdouble    $y
)
  is native(portal)
  is export
{ * }

sub xdp_session_touch_position (
  XdpSession $session,
  guint      $stream,
  guint      $slot,
  gdouble    $x,
  gdouble    $y
)
  is native(portal)
  is export
{ * }

sub xdp_session_touch_up (XdpSession $session, guint $slot)
  is native(portal)
  is export
{ * }

### /usr/src/libportal-0.4/libportal/screenshot.h

sub xdp_portal_pick_color (
  GCancellable $cancellable,
  XdpPortal    $portal,
  XdpParent    $parent,
               &callback (XdpPortal, GAsyncResult, gpointer),
  gpointer     $data
)
  is native(portal)
  is export
{ * }

sub xdp_portal_pick_color_finish (
  XdpPortal               $portal,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns GVariant
  is native(portal)
  is export
{ * }

sub xdp_portal_take_screenshot (
  XdpPortal          $portal,
  XdpParent          $parent,
  XdpScreenshotFlags $flags,
  GCancellable       $cancellable,
                     &callback (XdpPortal, GAsyncResult, gpointer),
  gpointer           $data
)
  is native(portal)
  is export
{ * }

sub xdp_portal_take_screenshot_finish (
  XdpPortal               $portal,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns Str
  is native(portal)
  is export
{ * }

### /usr/src/libportal-0.4/libportal/spawn.h

sub xdp_portal_spawn (
  XdpPortal     $portal,
  Str           $cwd,
  CArray[Str]   $argv,
  gint          $fds                 is rw,
  gint          $map_to              is rw,
  gint          $n_fds,
  CArray[Str]   $env,
  XdpSpawnFlags $flags,
  CArray[Str]   $sandbox_expose,
  CArray[Str]   $sandbox_expose_ro,
  GCancellable  $cancellable,
                &callback (
                  XdpPortal,
                  GAsyncResult,
                  gpointer
                ),
  gpointer      $data
)
  is native(portal)
  is export
{ * }

sub xdp_portal_spawn_finish (
  XdpPortal               $portal,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns pid_t
  is native(portal)
  is export
{ * }

sub xdp_portal_spawn_signal (
  XdpPortal $portal,
  pid_t     $pid,
  gint      $signal,
  gboolean  $to_process_group
)
  is native(portal)
  is export
{ * }

### /usr/src/libportal-0.4/libportal/trash.h

sub xdp_portal_trash_file (
  XdpPortal    $portal,
  Str          $path,
  GCancellable $cancellable,
               &callback (XdpPortal, GAsyncResult, gpointer),
  gpointer     $data
)
  is native(portal)
  is export
{ * }

sub xdp_portal_trash_file_finish (
  XdpPortal               $portal,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(portal)
  is export
{ * }

### /usr/src/libportal-0.4/libportal/updates.h

sub xdp_portal_update_install (
  XdpPortal             $portal,
  XdpParent             $parent,
  XdpUpdateInstallFlags $flags,
  GCancellable          $cancellable,
                        &callback (XdpPortal, GAsyncResult, gpointer),
  gpointer              $data
)
  is native(portal)
  is export
{ * }

sub xdp_portal_update_install_finish (
  XdpPortal               $portal,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(portal)
  is export
{ * }

sub xdp_portal_update_monitor_start (
  XdpPortal             $portal,
  XdpUpdateMonitorFlags $flags,
  GCancellable          $cancellable,
                        &callback (XdpPortal, GAsyncResult, gpointer),
  gpointer              $data
)
  is native(portal)
  is export
{ * }

sub xdp_portal_update_monitor_start_finish (
  XdpPortal               $portal,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(portal)
  is export
{ * }

sub xdp_portal_update_monitor_stop (XdpPortal $portal)
  is native(portal)
  is export
{ * }


### /usr/src/libportal-0.4/libportal/wallpaper.h

sub xdp_portal_set_wallpaper (
  XdpPortal         $portal,
  XdpParent         $parent,
  Str               $uri,
  XdpWallpaperFlags $flags,
  GCancellable      $cancellable,
                    &callback (XdpPortal, GAsyncResult, gpointer),
  gpointer          $data
)
  is native(portal)
  is export
{ * }

sub xdp_portal_set_wallpaper_finish (
  XdpPortal               $portal,
  GAsyncResult            $result,
  CArray[Pointer[GError]] $error
)
  returns uint32
  is native(portal)
  is export
{ * }
