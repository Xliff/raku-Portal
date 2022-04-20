use v6.c;

use NativeCall;

use GLib::Raw::Definitions;

unit package Portal::Raw::Definitions;

constant portal is export = 'portal,v0';

# cw: Opaque structure, but definition provided for use in arrays.
class XdpParent is repr<CStruct> does GLib::Roles::Pointers is export {
  has Pointer  $!parent_export;   #= XdpParentExport
  has Pointer  $!parent_unexport; #= XdpParentUnexport
  has GObject  $!object;
  has Pointer  $!callback;        #= XdpParentExported
  has gpointer $!data;
}
