class CfgFunctions
{
    class grad_minui
    {
        tag = "grad_minui";
        class EH
        {
            file = "\grad_minui\functions\EH";
            class EHgetIn {};
            class EHgetOut {};
            class EHseatSwitched {};
        };
        class misc
        {
            file = "\grad_minui\functions\misc";
            class isFFV {};
            class onEachFrame {};
            class onEachFrameFFV {};
            class postInit {postInit = 1;};
            class registerCBASettings {};
        };
        class ui
        {
            file = "\grad_minui\functions\ui";
            class createDisplay {};
            class hideInfo {};
            class showInfo {};
        };
    };
};
