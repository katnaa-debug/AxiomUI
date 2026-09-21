local Library = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/katnaa-debug/AxiomUI/refs/heads/main/Library.lua"
))()

--//====================================================
--// WINDOW
--//====================================================

local Window = Library:CreateWindow({
    Title = "AxiomUI",
    Logo = "rbxassetid://118685771787843",
    Description = "Complete UI Showcase",

    Collapsed = false,

    NotificationPosition = "TopRight",
    ConfigFolder = "AxiomUI_Config",

    Watermark = true,
    Keybinds = true,

    Theme = {
        Accent = Color3.fromRGB(110, 100, 255),

        Background = Color3.fromRGB(24, 23, 35),
        Sidebar = Color3.fromRGB(20, 19, 30),
        Card = Color3.fromRGB(34, 32, 48),
        Element = Color3.fromRGB(24, 23, 35),
        Input = Color3.fromRGB(16, 15, 23),
        Outlines = Color3.fromRGB(50, 48, 68),

        Text = Color3.fromRGB(245, 245, 250),
        TextMuted = Color3.fromRGB(145, 142, 165),

        BackgroundTrans = 0,
        BgImageTrans = 1,
        CardTrans = 0,
        ElementTrans = 0,
        InputTrans = 0,

        BackgroundImage = "",

        TextFont = "Gotham",
        SubtextFont = "Gotham",

        MainOutlineEnabled = false,
        InternalOutlines = "Off",

        ElementStyle = 1,

        CloseAnimation = 4,

        TopbarAlign = "Right",

        ShowSearchBar = true,
        ShowProfile = true,

        DropShadows = true,

        CornerRadius = 20,
        ElementsCornerRadius = 20,
        HUDCornerRadius = 10,

        SidebarPosition = "Left",
        DetachedSidebar = false,

        TogglePosition = "Right",
    }
})


--//====================================================
--// MAIN TAB
--//====================================================

local MainTab = Window:CreateTab({
    Name = "Main",
    Icon = "rbxassetid://118685771787843"
})


--//====================================================
--// LEFT BLOCK
--//====================================================

local MainBlock = MainTab:CreateBlock({
    Name = "Basic Components",
    Side = "Left",
    Icon = "rbxassetid://118685771787843"
})

MainBlock:CreateSection("Buttons")


--// Button

MainBlock:CreateButton({
    Name = "Simple Button",

    Callback = function()
        print("Simple Button clicked!")
    end
})


--// Button + Keybind

MainBlock:CreateButtonKeybind({
    Name = "Button With Keybind",

    Default = Enum.KeyCode.K,

    Callback = function()
        print("Button / Keybind activated!")
    end
})


MainBlock:CreateSection("Toggles")


--// Simple Toggle

local GodMode = MainBlock:CreateToggle({
    Name = "God Mode",

    Default = false,

    Callback = function(state)
        print("God Mode:", state)
    end
})


--// Toggle + Keybind

local Aura = MainBlock:CreateToggle({
    Name = "Aura",

    Default = false,

    Keybind = Enum.KeyCode.T,

    Callback = function(state, bind)
        print("Aura:", state, bind)
    end
})


--// Toggle + Color

local ESP = MainBlock:CreateToggle({
    Name = "ESP",

    Default = true,

    Color = Color3.fromRGB(110, 100, 255),

    Callback = function(state, color)
        print("ESP:", state, color)
    end
})


--// Toggle + Keybind + Color

local Chams = MainBlock:CreateToggle({
    Name = "Chams",

    Default = false,

    Keybind = Enum.KeyCode.C,

    Color = Color3.fromRGB(255, 80, 80),

    Callback = function(state, color, bind)
        print("Chams:", state, color, bind)
    end
})


MainBlock:CreateSection("Text & Media")


--// Label

local Label = MainBlock:CreateLabel(
    "This is a simple label."
)


--// Picture

local Picture = MainBlock:CreatePicture({
    Name = "Avatar",

    Image = "rbxassetid://118685771787843",

    Size = 100,

    Description = "Example image component."
})


--// Colorpicker

MainBlock:CreateColorpicker({
    Name = "UI Color",

    Default = Color3.fromRGB(110, 100, 255),

    Callback = function(color)
        print("Color:", color)
    end
})


--//====================================================
--// RIGHT BLOCK
--//====================================================

local SettingsBlock = MainTab:CreateBlock({
    Name = "Advanced Components",
    Side = "Right"
})


SettingsBlock:CreateSection("Dropdowns")


--// Normal Dropdown

local Target = SettingsBlock:CreateDropdown({
    Name = "Target",

    Options = {
        "Head",
        "Torso",
        "Closest",
        "Random"
    },

    Default = "Head",

    Callback = function(value)
        print("Target:", value)
    end
})


--// Multi Dropdown

local Hitboxes = SettingsBlock:CreateDropdown({
    Name = "Hitboxes",

    Options = {
        "Head",
        "Torso",
        "Left Arm",
        "Right Arm",
        "Left Leg",
        "Right Leg"
    },

    Default = {
        "Head",
        "Torso"
    },

    Multi = true,

    MaxSelections = 4,

    Callback = function(values)
        print("Selected hitboxes:")

        for _, value in ipairs(values) do
            print(value)
        end
    end
})


--// Search Dropdown

local Player = SettingsBlock:CreateDropdown({
    Name = "Target Player",

    Options = {
        "Player1",
        "Player2",
        "NoobMaster69",
        "ProGamer",
        "Robloxian",
        "Guest_1234"
    },

    Search = true,

    Callback = function(value)
        print("Player:", value)
    end
})


--// Multi + Search

local Whitelist = SettingsBlock:CreateDropdown({
    Name = "Whitelist",

    Options = {
        "Player1",
        "Player2",
        "NoobMaster69",
        "ProGamer",
        "Robloxian",
        "Guest_1234"
    },

    Multi = true,
    Search = true,

    MaxSelections = 5,

    Callback = function(values)
        print("Whitelist:")

        for _, value in ipairs(values) do
            print(value)
        end
    end
})


SettingsBlock:CreateSection("Values")


--// Slider

local WalkSpeed = SettingsBlock:CreateSlider({
    Name = "WalkSpeed",

    Min = 16,
    Max = 500,
    Step = 1,

    Default = 16,

    Callback = function(value)
        print("WalkSpeed:", value)
    end
})


--// Input

local PlayerName = SettingsBlock:CreateInput({
    Name = "Player Name",

    Placeholder = "Enter player name...",

    Callback = function(text)
        print("Player:", text)
    end
})


--// Keybind

local MenuKey = SettingsBlock:CreateKeybind({
    Name = "Menu Key",

    Default = Enum.KeyCode.RightShift,

    Callback = function(key)
        print("Menu key:", key.Name)
    end
})


--// 3D Object

SettingsBlock:CreateSection("Advanced")


SettingsBlock:CreateObject({
    Name = "Character Preview",

    Object = "game.Players.LocalPlayer",

    Size = 45,

    Description = "3D object preview."
})


--//====================================================
--// NOTIFICATION
--//====================================================

MainBlock:CreateButton({
    Name = "Show Notification",

    Callback = function()

        local Notification = Window:Notify({
            Title = "AxiomUI",

            Description = "This is an example notification.",

            Duration = 5,

            Icon = "rbxassetid://118685771787843"
        })

        task.delay(1, function()

            Notification:SetTitle("Updated Notification")

            Notification:SetDescription(
                "Notification can be modified dynamically."
            )

            Notification:SetIcon(
                "rbxassetid://7059346373"
            )

        end)

    end
})


--//====================================================
--// DYNAMIC API
--//====================================================

MainBlock:CreateSection("Dynamic API")


MainBlock:CreateButton({
    Name = "Update Everything",

    Callback = function()

        -- Button
        -- myButton:SetText("New Text")

        -- Toggle
        GodMode:Set(true)

        -- Toggle color
        ESP:SetColor(
            Color3.fromRGB(0, 255, 0)
        )

        -- Toggle keybind
        Chams:SetKeybind(
            Enum.KeyCode.Z
        )

        -- Label
        Label:SetText(
            "Text updated dynamically!"
        )

        -- Picture
        Picture:SetSize(60)

        Picture:SetImage(
            "rbxassetid://7059346373"
        )

        Picture:SetDescription(
            "Updated picture description."
        )

        -- Dropdown
        Target:SetOptions({
            "Chest",
            "Feet",
            "Hands"
        })

        Target:Set("Chest")

        -- Multi dropdown
        Hitboxes:Set({
            "Left Arm",
            "Right Arm"
        })

        -- Slider
        WalkSpeed:Set(250)

        -- Input
        PlayerName:SetText(
            "Updated Player"
        )

        -- Block
        MainBlock:SetTitle(
            "Updated Block"
        )

        -- Tab
        MainTab:SetTitle(
            "Updated Main Tab"
        )

    end
})


--//====================================================
--// MULTI-BLOCK / VARIANTS
--//====================================================

local AdvancedTab = Window:CreateTab({
    Name = "Advanced",
    Icon = "rbxassetid://7059346373"
})


--// Two variants

local Combat, Movement = AdvancedTab:CreateBlock({

    Side = "Left",

    Variants = {

        {
            Name = "Combat",
            Icon = "rbxassetid://118685771787843"
        },

        {
            Name = "Movement",
            Icon = "rbxassetid://7059346373"
        }
    }
})


Combat:CreateSection("Combat")


Combat:CreateToggle({
    Name = "Silent Aim",

    Default = false,

    Keybind = Enum.KeyCode.P
})


Combat:CreateSlider({
    Name = "FOV",

    Min = 10,
    Max = 360,

    Default = 90
})


Combat:CreateDropdown({
    Name = "Hitbox",

    Options = {
        "Head",
        "Torso",
        "Legs"
    },

    Default = "Head"
})


Movement:CreateSection("Movement")


Movement:CreateToggle({
    Name = "Bunny Hop",

    Default = false
})


Movement:CreateSlider({
    Name = "Speed Boost",

    Min = 16,
    Max = 150,

    Default = 16
})


Movement:CreateKeybind({
    Name = "Fly Key",

    Default = Enum.KeyCode.F
})


--//====================================================
--// THREE VARIANTS
--//====================================================

local ESPTab, ChamsTab, WorldTab = AdvancedTab:CreateBlock({

    Side = "Right",

    Variants = {

        {
            Name = "ESP",
            Icon = "rbxassetid://7059346373"
        },

        {
            Name = "Chams",
            Icon = "rbxassetid://118685771787843"
        },

        {
            Name = "World",
            Icon = "rbxassetid://7059346373"
        }
    }
})


-- ESP

ESPTab:CreateSection("ESP")


ESPTab:CreateToggle({
    Name = "Show Boxes",

    Default = true,

    Color = Color3.fromRGB(255, 255, 255)
})


ESPTab:CreateToggle({
    Name = "Show Names",

    Default = true
})


ESPTab:CreateToggle({
    Name = "Show Health",

    Default = false
})


-- Chams

ChamsTab:CreateSection("Chams")


ChamsTab:CreateToggle({
    Name = "Enable Chams",

    Default = false,

    Color = Color3.fromRGB(255, 50, 50)
})


ChamsTab:CreateSlider({
    Name = "Fill Transparency",

    Min = 0,
    Max = 100,

    Default = 50
})


ChamsTab:CreateToggle({
    Name = "X-Ray",

    Default = false
})


-- World

WorldTab:CreateSection("World")


WorldTab:CreateToggle({
    Name = "Night Mode",

    Default = false
})


WorldTab:CreateColorpicker({
    Name = "Ambient Color",

    Default = Color3.fromRGB(
        100,
        100,
        255
    )
})


WorldTab:CreateButton({
    Name = "Remove Shadows",

    Callback = function()
        print("Shadows removed!")
    end
})
