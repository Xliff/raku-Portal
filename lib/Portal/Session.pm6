use v6.c;

use Portal::Raw::Types;
use Portal::Raw::Portal;

use GLib::Variant;

class Portal::Session {
  has PortalSession $!pss;

  method close {
    xdp_session_close($!ps);
  }

  method get_devices {
    getFlags( XdpDeviceType, xdp_session_get_devices($!ps) );
  }

  method get_session_state {
    XdpSessionStateEnum( xdp_session_get_session_state($!ps) );
  }

  # cw: NOT the in the traditional Glib sense.
  method get_type {
    XdpSessionTypeEnum( xdp_session_get_session_type($!ps) );
  }

  method get_streams ( :$raw = False ) {
    propReturnObject(
      xdp_session_get_streams($!ps),
      $raw,
      |GLib::Variant.getTypePair`
    );
  }
}
