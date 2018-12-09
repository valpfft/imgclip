#include <ruby.h>
#include <gtk/gtk.h>
#include "extconf.h"

int clipboard_to_file(char* filename) {
    GtkClipboard *clipboard;
    GdkPixbuf *pixbuf;

    /* Consider all images as jpg for now */
    char* image_type = "jpeg";
    int error = 0;

    if(error == 0) {
        clipboard = gtk_clipboard_get(GDK_SELECTION_CLIPBOARD);
        pixbuf = gtk_clipboard_wait_for_image(clipboard);

        GError *gerror = NULL;
        gdk_pixbuf_save(pixbuf, filename, image_type, &gerror, NULL);

        if(gerror != NULL) {
            printf("Unable to save clipboard image to %s: %s\n", filename, gerror->message);
            error = 1;

            g_error_free(gerror);
        }

        g_object_unref(pixbuf);
    }

    return error;
}

VALUE save(VALUE _self, VALUE path) {
  Check_Type(path, T_STRING);

  int error = 0;

  error = clipboard_to_file(StringValueCStr(path));

  return error;
}

void Init_imgclip() {
  gtk_init(NULL, NULL);
  VALUE mod = rb_define_module("Imgclip");
  rb_define_module_function(mod, "save", save, 1);
}
