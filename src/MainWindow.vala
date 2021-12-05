/*
 * Copyright 2021 {{LEGAL_NAME}} <{{LEGAL_EMAIL}}>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

public class {{APP_NAME}}.MainWindow : Hdy.Window {

    private Gtk.Grid window_grid;
    private Gtk.Grid grid;

    public MainWindow (Gtk.Application application) {
        Object (
            application: application,
            border_width: 0,
            icon_name: "com.github.{{USER_NAME}}.{{APP_NAME_LOWER}}",
            resizable: true,
            title: _("{{APP_NAME}}"),
            window_position: Gtk.WindowPosition.CENTER
        );
    }

    construct {
        Hdy.init ();

        weak Gtk.IconTheme default_theme = Gtk.IconTheme.get_default ();
        default_theme.add_resource_path ("/com/github/{{USER_NAME}}/{{APP_NAME_LOWER}}");

        var header = new Hdy.HeaderBar () {
            show_close_button = true,
            title = _("{{APP_NAME}}")
        };

        unowned Gtk.StyleContext header_context = header.get_style_context ();
        header_context.add_class ("default-decoration");
        header_context.add_class (Gtk.STYLE_CLASS_FLAT);

        grid = new Gtk.Grid () {
            column_spacing = 6,
            row_spacing = 6,
            margin = 6,
            halign = Gtk.Align.FILL,
            expand = true
        };

        window_grid = new Gtk.Grid () {
            column_spacing = 0,
            row_spacing = 0,
            margin = 0,
            halign = Gtk.Align.FILL
        };

        window_grid.attach (header, 0, 0);
        window_grid.attach (grid, 0, 1);

        var window_handle = new Hdy.WindowHandle ();
        window_handle.add (window_grid);

        add (window_handle);

        show_all ();

    }


}
