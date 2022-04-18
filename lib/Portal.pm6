use v6.c;

use Portal::Raw::Types;
use Portal::Raw::Portal

use GLib::Variant;
use Portal::Session;

use GLib::Roles::Object;

class Portal {
  also does GLib::Roles::Object;

  has XdpPortal $!p

  proto method create_remote_desktop_session (|)

  method create_remote_desktop_session (
    Int()           $devices,
    Int()           $outputs,
                    &callback,
    gpointer        $data         = gpointer
    Int()          :$flags        = 0,
    GCancellable() :$cancellable  = GCancellable,
  ) {
    samewith($devices, $outputs, $flags, $cancellable, &callback, $data);
  }
  method create_remote_desktop_session (
    Int()          $devices,
    Int()          $outputs,
    Int()          $flags,
    GCancellable() $cancellable,
                   &callback,
    gpointer       $data         = gpointer
  ) {
    my XdpDeviceType         $d = $devices;
    my XdpOutputType         $o = $outputs;
    my XdpRemoteDesktopFlags $f = $flags;

    xdp_portal_create_remote_desktop_session(
      $!p,
      $devices,
      $outputs,
      $f,
      $c,
      &c,
      $data
    );
  }

  method create_remote_desktop_session_finish (
    GAsyncResult()           $result,
    CArray[Pointer[GError]]  $error   = gerror
                            :$raw     = False
  ) {
    clear_error;
    my $xs = xdp_portal_create_remote_desktop_session_finish(
      $!p,
      $result,
      $error
    );
    set_error($error);

    propReturnObject($xs, $raw, |Portal::Session.getTypePair);
  }

  proto method create_screencast_session (|)
  { * }

  multi method create_screencast_session (
    Int()           $outputs,
                    &callback,
    gpointer        $data         = gpointer,
    Int()          :$flags        = 0,
    GCancellable() :$cancellable  = GCancellable
  ) {
    samewith($outputs, $flags, $cancellable, &callback, $data);
  }
  multi method create_screencast_session (
    Int()          $outputs,
    Int()          $flags,
    GCancellable() $cancellable,
                   &callback,
    gpointer       $data         = gpointer
  ) {
    my XdpOutputType      $o = $outputs;
    my XdpScreencastFlags $f = $flags;

    xdp_portal_create_screencast_session(
      $!p,
      $o,
      $f,
      $cancellable,
      &callback,
      $data
    );
  }

  method create_screencast_session_finish (
    GAsyncResult()           $result,
    CArray[Pointer[GError]]  $error   = gerror,
                            :$raw     = False
  ) {
    clear_error;
    my $s = xdp_portal_create_screencast_session_finish($!p, $result, $error);
    set_error($error);
    propReturnObject($s, $raw, |Portal::Session.getTypePair);
  }

  proto method install (|)
  { * }

  multi method install (
    Int()           $flags,
                    &callback,
    gpointer        $data         = gpointer,
    XdpParent()    :$parent       = XdpParent,
    GCancellable() :$cancellable  = GCancellable,
  ) {
    samewith($parent, $flags, $cancellable, &callback, $data);
  }
  multi method install (
    XdpParent()    $parent,
    Int()          $flags,
    GCancellable() $cancellable,
                   &callback,
    gpointer       $data         = gpointer
  ) {
    my XdpUpdateInstallFlags $f = $flags;

    xdp_portal_update_install($!p, $parent, $f, $cancellable, &callback, $data);
  }

  method install_finish (
    GAsyncResult()          $result,
    CArray[Pointer[GError]] $error   = gerror
  ) {
    xdp_portal_update_install_finish($!p, $result, $error);
  }

  method keyboard_key (
    Int() $keysym,
    Int() $key,
    Int() $state
  ) {
    my gboolean    $ks = $keysym.so.Int;
    my gint        $k  = $key;
    my XdpKeyState $s  = $state;

    xdp_session_keyboard_key($!p, $ks, $k, $s);
  }

  proto method monitor_start (|)
  { * }

  multi method monitor_start (
    Int()           $flags,
                    &callback,
    gpointer        $data        = gpointer,
    GCancellable() :$cancellable = GCancellable
  ) {
    samewith($flags, $cancellable, &callback, $data);
  }
  multi method monitor_start (
    Int()          $flags,
    GCancellable() $cancellable,
                   &callback,
    gpointer       $data         = gpointer
  ) {
    xdp_portal_update_monitor_start(
      $!p,
      $flags,
      $cancellable,
      $callback,
      $data
    );
  }

  method monitor_start_finish (
    GAsyncResult()          $result,
    CArray[Pointer[GError]] $error   = gerror
  ) {
    clear_error;
    my $rv = so xdp_portal_update_monitor_start_finish($!p, $result, $error);
    set_error($error);
    $rv;
  }

  method monitor_stop {
    xdp_portal_update_monitor_stop($!p);
  }

  method notification_add (
    Str()          $id,
    GVariant()     $notification,
    Int()          $flags,
    GCancellable() $cancellable,
                   &callback,
    gpointer       $data
  ) {
    my XdpNotificationFlags $f = $flags;

    xdp_portal_add_notification(
      $!p,
      $id,
      $notification,
      $f,
      $cancellable,
      $callback,
      $data
    );
  }

  method notification_add_finish (
    GAsyncResult()          $result,
    CArray[Pointer[GError]] $error   = gerror
  ) {
    clear_error;
    my $rv = so xdp_portal_add_notification_finish($!p, $result, $error);
    set_error($error);
    $rv;
  }

  method notification_remove (Str() $id) {
    xdp_portal_remove_notification($!p, $id);
  }

  proto method open_directory (|)
  { * }

  multi method open_directory (
    Str()          $uri,
                   &callback,
    gpointer       $data         = gpointer,
    XdpParent()    $parent       = XdpParent,
    Int()          $flags        = 0,
    GCancellable() $cancellable  = GCancellable
  ) {
    samewith($parent, $uri, $flags, $cancellable, &callback, $data);
  }
  multi method open_directory (
    XdpParent()    $parent,
    Str()          $uri,
    Int()          $flags,
    GCancellable() $cancellable,
                   &callback,
    gpointer       $data
  ) {
    my XdpOpenUriFlags $f = $flags;

    xdp_portal_open_directory(
      $!p,
      $parent,
      $uri,
      $f,
      $cancellable,
      &callback,
      $data
    );
  }

  method open_directory_finish (
    GAsyncResult()          $result,
    CArray[Pointer[GError]] $error   = gerror
  ) {
    clear_error;
    my $rv = so xdp_portal_open_directory_finish($!p, $result, $error);
    set_error($error);
    $rv;
  }

  proto method open_uri (|)
  { * }

  multi method open_uri (
    Str()           $uri,
                    &callback,
    gpointer        $data        = gpointer
    XdpParent()    :$parent      = XdpParent,
    Int()          :$flags       = 0,
    GCancellable() :$cancellable = GCancellable
  ) {
    samewith($parent, $uri, $flags, $cancellable, &callback, $data);
  }
  multi method open_uri (
    XdpParent()    $parent,
    Str()          $uri,
    Int()          $flags,
    GCancellable() $cancellable,
                   &callback,
    gpointer       $data          = gpointer
  ) {
    my XdpOpenUriFlags $f = $flags;

    xdp_portal_open_uri(
      $!p,
      $parent,
      $uri,
      $f,
      $cancellable,
      &callback,
      $data
    );
  }

  method open_uri_finish (
    GAsyncResult()          $result,
    CArray[Pointer[GError]] $error   = gerror
  ) {
    clear_error;
    my $rv = so xdp_portal_open_uri_finish($!p, $result, $error);
    set_error($error);
    $rv;
  }

  proto method prepare_print (|)
  { * }

  multi method prepare_print (
                     &callback,
    gpointer         $data        = gpointer,
    XdpParent()     :$parent      = XdpParent,
    Str()           :$title       = 'Print',
    GVariant()      :$settings    = GVariant,
    GVariant()      :$page_setup  = GVariant,
    Int()           :$flags       = 0,
    GCancellable()  :$cancellable = GCancellable
  ) {
    samewith(
      $parent,
      $title,
      $settings,
      $page_setup,
      $flags,
      $cancellable,
      &callback,
      $data
    );
  }
  multi method prepare_print (
    XdpParent()     $parent,
    Str()           $title,
    GVariant()      $settings,
    GVariant()      $page_setup,
    Int()           $flags,
    GCancellable()  $cancellable,
                    &callback,
    gpointer        $data          = gpointer
  ) {
    my XdpPrintFlags $f = $flags;

    xdp_portal_prepare_print(
      $!p,
      $parent,
      $title,
      $settings,
      $page_setup,
      $f,
      $cancellable,
      &callback,
      $data
    );
  }

  # Returns a [struct@GLib.Variant] dictionary with the following information:
  #
  # - settings `a{sv}`: print settings as set up by the user in the print dialog
  # - page-setup `a{sv}: page setup as set up by the user in the print dialog
  # - token u: a token that can by used in a [method@Portal.print_file] call to
  #     avoid the print dialog
  method prepare_print_finish (
    GAsyncResult()           $result,
    CArray[Pointer[GError]]  $error   = gerror
                            :$raw     = False
  ) {
    clear_error;
    my $v = xdp_portal_prepare_print_finish($!p, $result, $error);
    set_error($error);

    propReturnObject($v, $raw, |GLib::Variant.getTypePair);
  }

  proto method print_file (|)
  { * }

  multi method print_file (
    Str()           $file,
                    &callback,
    gpointer        $data           = gpointer,
    XdpParent()    :$parent         = XdpParent,
    Str()          :$title          = 'Print',
    Int()          :$token          = 0,
    Int()          :$flags          = 0,
    GCancellable() :$cancellable    = GCancellable
  ) {
    samewith(
      $parent,
      $title,
      $token,
      $file,
      $flags,
      $cancellable,
      &callback,
      $data
    );
  }
  multi method print_file (
    XdpParent()    $parent,
    Str()          $title,
    Int()          $token,
    Str()          $file,
    Int()          $flags,
    GCancellable() $cancellable,
                   &callback,
    gpointer       $data           = gpointer
  ) {
    my guint         $t = $token;
    my XdpPrintFlags $f = $flags;

    xdp_portal_print_file(
      $!p,
      $parent,
      $title,
      $token,
      $file,
      $flags,
      $cancellable,
      &callback,
      $data
    );
  }

  method print_file_finish (
    GAsyncResult()          $result,
    CArray[Pointer[GError]] $error   = gerror
  ) {
    clear_error;
    xdp_portal_print_file_finish($!p, $result, $error);
    set_error($error);
  }

  method open_pipewire_remote {
    xdp_session_open_pipewire_remote($!p);
  }

  proto method pick_color (|)
  { * }

  multi method pick_color (
                    &callback,
    gpointer        $data        = gpointer
    XdpParent()    :$parent      = XdpParent,
    GCancellable() :$cancellable = GCancellable
  ) {
    samewith($parent, $cancellable, &callback, $data);
  }
  multi method pick_color (
    XdpParent()     $parent,
    GCancellable()  $cancellable,
                    &callback,
    gpointer        $data        = gpointer
  ) {
    xdp_portal_pick_color($!p, $parent, $cancellable, &callback, $data);
  }

  method pick_color_finish (
    GAsyncResult()           $result,
    CArray[Pointer[GError]]  $error   = gerror,
                            :$raw     = False
  ) {
    clear_error;
    my $v = xdp_portal_pick_color_finish($!p, $result, $error);
    set_error($error);

    propReturnObject($v, $raw, |GLib::Variant.getTypePair);
  }

  method pointer_axis (
    Int() $finish,
    Num() $dx,
    Num() $dy
  ) {
    my gboolean $f          = $finish;
    my gdouble ($ddx, $ddy) = ($dx, $dy);

    xdp_session_pointer_axis($!p, $f, $ddx, $ddy);
  }

  method pointer_axis_discrete (Int() $axis, Int() $steps) {
    my XdpDiscreteAxis $a = $axis;
    my gint            $s = $steps;

    xdp_session_pointer_axis_discrete($!p, $a, $s);
  }

  method pointer_button (Int() $button, Int() $state) {
    my gint           $b = $button;
    my XdpButtonState $s = $state;

    xdp_session_pointer_button($!p, $b, $s);
  }

  method pointer_motion (Num() $dx, Num() $dy) {
    my gdouble $ddx = $dx;
    my gdouble $ddy = $dy;

    xdp_session_pointer_motion($!p, $ddx, $ddy);
  }

  method pointer_position (Int() $stream, Num() $x, Num() $y) {
    my gdouble $xx = $x;
    my gdouble $yy = $y;
    my guint   $s  = $stream

    xdp_session_pointer_position($!p, $s, $xx, $yy);
  }

  method session_get_type {
    state ($n, $t);

    unstable_get_type(
      self.^name ~ '.session',
      &xdp_session_get_type,
      $n,
      $t
    );
  }

  proto method set_wallpaper (|)
  { * }
 
  multi method set_wallpaper (
    Str()           $uri,
                    &callback,
    gpointer        $data         = gpointer,
    XdpParent()    :$parent       = XdpParent,
    Int()          :$flags        = 0,
    GCancellable() :$cancellable  = GCancellable
  ) {
    samewith($parent, $uri, $flags, $cancellable, &callback, $data);
  }
  multi method set_wallpaper (
    XdpParent()    $parent,
    Str()          $uri,
    Int()          $flags,
    GCancellable() $cancellable,
                   &callback,
    gpointer       $data         = gpointer
  ) {
    my XdpWallpaperFlags $f = $flags;

    xdp_portal_set_wallpaper(
      $!p,
      $parent,
      $uri,
      $f,
      $cancellable,
      $callback,
      $data
    );
  }

  method set_wallpaper_finish (
    GAsyncResult()          $result,
    CArray[Pointer[GError]] $error   = gerror
  ) {
    clear_error;
    my $rv = so xdp_portal_set_wallpaper_finish($!p, $result, $error);
    set_error($error);
    $rv;
  }

  multi method spawn (
    Str            $cwd,
                   $argv              is copy,
                   &callback,
    gpointer       $data                       = gpointer,
                  :$fds               is copy  = CArray[gint],
                  :$map_to            is copy  = CArray[gint],
    Int()         :$n_fds                      = 0,
                  :$env               is copy  = CArray[Str],
    Int()         :$flags                      = 0,
                  :$sandbox_expose    is copy  = CArray[Str],
                  :$sandbox_expose_ro is copy  = CArray[Str],
    GCancellable  :$cancellable                = GCancellable
  ) {
    for $fds, $map_to -> $_ is raw {
      die "{ .VAR.name } must be Array or CArray compatible" unless
        $_ ~~ ( Positional, CArray[gint] ).any;

      $_ = ArrayToCArray(gint, $_) unless $_ ~~ CArray[gint];
    }

    for $argv, $env, $sandbox_expose, $sandbox_expose_ro -> $_ is raw {
      die "{ .VAR.name } must be Array or CArray compatible" unless
        $_ ~~ ( Positional, CArray[Str] ).any;

      $_ = ArrayToCArray(Str, $_) unless $_ ~~ CArray[Str];
    }

    samewith(
      $cwd,
      $argv,
      $fds,
      $map_to,
      $n_fds,
      $env,
      $flags,
      $sandbox_expose,
      $sandbox_expose_ro,
      $cancellable,
      &callback,
      $data
    );
  }
  multi method spawn (
    Str           $cwd,
    CArray[Str]   $argv,
    CArray[gint]  $fds,
    CArray[gint]  $map_to,
    Int()         $n_fds,
    CArray[Str]   $env,
    Int()         $flags,
    CArray[Str]   $sandbox_expose,
    CArray[Str]   $sandbox_expose_ro,
    GCancellable  $cancellable,
                  &callback,
    gpointer      $data                = gpointer
  ) {
    my gint          $n = $n_fds
    my XdpSpawnFlags $f = $flags;

    xdp_portal_spawn(
      $!p,
      $cwd,
      $argv,
      $fds,
      $map_to,
      $n_fds,
      $env,
      $flags,
      $sandbox_expose,
      $sandbox_expose_ro,
      $cancellable,
      &callback,
      $data
    );
  }

  method spawn_finish (
    GAsyncResult()          $result,
    CArray[Pointer[GError]] $error   = gerror
  ) {
    clear_error;
    my $pid = xdp_portal_spawn_finish($!p, $result, $error);
    set_error($error);
    $pid;
  }

  method spawn_signal (Int() $pid, Int() $signal, Int() $to_process_group) {
    my pid_t    $p = $pid;
    my gint     $s = $signal;
    my gboolean $t = $to_process_group;

    xdp_portal_spawn_signal($!p, $p, $s, $t);
  }

  multi method start (
                    &callback,
    gpointer        $data        = gpointer,
    XdpParent()    :$parent      = XdpParent,
    GCancellable() :$cancellable = GCancellable
  ) {
    samewith($parent, $cancellable, &callback, $data);
  }
  multi method start (
    XdpParent()    $parent,
    GCancellable() $cancellable,
                   &callback,
    gpointer       $data          = gpointer
  ) {
    xdp_session_start($!p, $parent, $cancellable, &callback, $data);
  }

  method start_finish (
    GAsyncResult()          $result,
    CArray[Pointer[GError]] $error   = gerror
  ) {
    clear_error;
    my $rv = so xdp_session_start_finish($!p, $result, $error);
    set_error($error);
    $rv;
  }

  method touch_down (Int() $stream, Int() $slot, Num() $x, Num() $y) {
    my guint   ($st, $sl) = ($stream, $slot);
    my gdouble ($xx, $yy) = ($x, $y);

    xdp_session_touch_down($!p, $st, $sl, $xx, $yy);
  }

  method touch_position (Int() $stream, Int() $slot, Num() $x, Num() $y) {
    my guint   ($st, $sl) = ($stream, $slot);
    my gdouble ($xx, $yy) = ($x, $y);

    xdp_session_touch_position($!p, $st, $sl, $xx, $yy);
  }

  method touch_up (Int() $slot) {
    my guint $s = $slot;

    xdp_session_touch_up($!p, $s);
  }

  proto method take_screenshot (|)
  { * }

  multi method take_screenshot (
    XdpParent()     $parent,
                    &callback,
    gpointer        $data          = gpointer,
    Int()          :$flags         = 0,
    GCancellable() :$cancellable   = GCancellable
  ) {
    samewith($parent, $flags, $cancellable, &callback, $data);
  }
  multi method take_screenshot (
    XdpParent()    $parent,
    Int()          $flags,
    GCancellable() $cancellable,
                   &callback,
    gpointer       $data          = gpointer
  ) {
    my XdpScreenshotFlags $f = $flags;

    xdp_portal_take_screenshot(
      $!p,
      $parent,
      $f,
      $cancellable,
      &callback,
      $data
    );
  }

  method take_screenshot_finish (
    GAsyncResult()          $result,
    CArray[Pointer[GError]] $error   = gerror
  ) {
    clear_error;
    my $s = xdp_portal_take_screenshot_finish($!p, $result, $error);
    set_error($error);
    $s;
  }

  proto method trash_file (|)
  { * }

  multi method trash_file (
    Str()          $path,
                   &callback,
    gpointer       $data         = gpointer,
    GCancellable() :$cancellable = GCancellable
  ) {
    samewith($path, $cancellable, &callback, $data);
  }
  multi method trash_file (
    Str()          $path,
    GCancellable() $cancellable,
                   &callback,
    gpointer       $data         = gpointer
  ) {
    xdp_portal_trash_file($!p, $path, $cancellable, &callback, $data);
  }

  method trash_file_finish (
    GAsyncResult()          $result,
    CArray[Pointer[GError]] $error   = gerror
  ) {
    clear_error;
    my $rv = so xdp_portal_trash_file_finish($!p, $result, $error);
    set_error($error);
    $rv;
  }

}
