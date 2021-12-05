/*
 * Copyright 2021 {{LEGAL_NAME}} <{{LEGAL_EMAIL}}>
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

public class {{APP_NAME}}.App : Gtk.Application {

    private static string version = "0.0.1";
    private static bool print_version = false;

    public App () {
        Object (
            application_id: "com.github.{{USER_NAME}}.{{APP_NAME_LOWER}}",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    private const OptionEntry[] OPTIONS = {
        { "version", 'v', 0, OptionArg.NONE, ref print_version,
            "Display version number." },
        { null }
    };

    construct {
        add_main_option_entries (OPTIONS);
    }

    protected override void activate () {

        unowned var gtk_settings = Gtk.Settings.get_default ();
        unowned var granite_settings = Granite.Settings.get_default ();

        gtk_settings.gtk_cursor_theme_name = "elementary";
        gtk_settings.gtk_icon_theme_name = "elementary";

        gtk_settings.gtk_application_prefer_dark_theme = (
            granite_settings.prefers_color_scheme == Granite.Settings.ColorScheme.DARK
        );

        granite_settings.notify["prefers-color-scheme"].connect (() => {
            gtk_settings.gtk_application_prefer_dark_theme = (
                granite_settings.prefers_color_scheme == Granite.Settings.ColorScheme.DARK
            );
        });

        var quit_action = new SimpleAction ("quit", null);

        add_action (quit_action);
        set_accels_for_action ("app.quit", {"<Control>q", "<Control>w"});

        var app_window = new MainWindow (this);

        quit_action.activate.connect (() => {
            if (app_window != null) {
                app_window.destroy ();
            }
        });

    }

    public static int main (string[] args) {
        var app = new App ();
        return app.run (args);
    }
}
