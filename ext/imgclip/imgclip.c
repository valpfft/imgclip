#include <ruby.h>
#include <gtk/gtk.h>
#include "extconf.h"

static VALUE clipboard_to_file(VALUE _self, VALUE path) {
    char* c_path = StringValueCStr(path);

    Check_Type(path, T_STRING);

    GtkClipboard *clipboard;
    GdkPixbuf *pixbuf;

    clipboard = gtk_clipboard_get(GDK_SELECTION_CLIPBOARD);
    pixbuf = gtk_clipboard_wait_for_image(clipboard);

    if (pixbuf == NULL) {
        rb_raise(rb_eArgError, "Clipboard content could not be converted into an image.");
    }

    GError *gerror = NULL;
    char* image_type = "jpeg";
    gdk_pixbuf_save(pixbuf, c_path, image_type, &gerror, NULL);

    if (gerror) {
        g_error_free(gerror);
        rb_raise(rb_eException, "Unable to save clipboard image to %s: %s\n", c_path, gerror->message);
    }

    if (pixbuf != NULL) {
        g_object_unref(pixbuf);
    }

    return path;
}

void Init_imgclip() {
    gtk_init(NULL, NULL);
    VALUE mod = rb_define_module("Imgclip");
    rb_define_module_function(mod, "clipboard_to_file", clipboard_to_file, 1);
}
