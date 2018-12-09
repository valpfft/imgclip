require "mkmf"

exit(1) unless find_executable("pkg-config")

$CFLAGS  << " " + `pkg-config gtk+-2.0 --cflags`.strip
$LDFLAGS << " " + `pkg-config gtk+-2.0 --libs`.strip
$CFLAGS  << " -W -Wall"

find_header("gtk/gtk.h") || exit(1)

create_header
create_makefile("imgclip")
