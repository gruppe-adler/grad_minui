class settings {
    class defaultactionicon {
        categoryName = "$STR_GRAD_MINUI_DEFAULTACTIONICON";
        class size {
            title = "$STR_GRAD_MINUI_DEFAULTACTIONICON_SIZE";
            type = "SLIDER";
            valueInfo = "[0, 2, 0, 2]";
            tooltip = "$STR_GRAD_MINUI_SETTINGS_NEEDS_GAME_RESTART";
            needsGameRestart = 1;
            script = "profileNamespace setVariable ['grad_minui_defaultactionicon_size', _this]; saveProfileNamespace;";
        };
    };
};
