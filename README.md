# AxiomUI
AxiomUI is a Roblox UI library built around a simple idea:
**powerful interfaces should be easy to create and pleasant to use.**

## Installation

``` lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/katnaa-debug/AxiomUI/refs/heads/main/Library.lua"))()
```

## Quick Start

``` lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/katnaa-debug/AxiomUI/refs/heads/main/Library.lua"))()

local Window = Library:CreateWindow({
    Title = "My Hub",
    Description = "Powered by AxiomUI"
})

local Tab = Window:CreateTab({Name = "Main"})
local Block = Tab:CreateBlock({Name = "Settings", Side = "Left"})

Block:CreateToggle({
    Name = "Enabled",
    Default = false,
    Callback = function(state)
        print("Enabled:", state)
    end
})
```

## Window

``` lua
local Window = Library:CreateWindow({
    Title = "AxiomUI",
    Logo = "rbxassetid://118685771787843",
    Description = "Premium Interface",
    Collapsed = false,
    NotificationPosition = "TopRight",
    ConfigFolder = "AxiomUI_CFG",
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
        TogglePosition = "Right"
    }
})
```

### Window options

`Title` --- window title. `Logo` --- image ID as a number or
`rbxassetid://...`. `Description` --- sidebar subtitle. `Collapsed` ---
start collapsed. `NotificationPosition` --- `TopRight`, `TopLeft`,
`BottomRight`, or `BottomLeft`. `ConfigFolder` --- config folder name.
`Watermark` and `Keybinds` enable their HUDs.

### Theme options

**Colors:** `Accent`, `Background`, `Sidebar`, `Card`, `Element`,
`Input`, `Outlines`, `Text`, `TextMuted`.

**Transparency:** `BackgroundTrans`, `BgImageTrans`, `CardTrans`,
`ElementTrans`, `InputTrans`.

**Fonts:** `TextFont`, `SubtextFont`.

**Layout/visuals:** `BackgroundImage`, `MainOutlineEnabled`,
`InternalOutlines`, `ElementStyle`, `CloseAnimation`, `TopbarAlign`,
`ShowSearchBar`, `ShowProfile`, `DropShadows`, `CornerRadius`,
`ElementsCornerRadius`, `HUDCornerRadius`, `SidebarPosition`,
`DetachedSidebar`, `TogglePosition`.

`InternalOutlines`: `Off`, `Only Blocks`, `Only Elements`, `All`.

`SidebarPosition`: `Left`, `Right`, `Top`, `Bottom`.

## Tabs and Blocks

``` lua
local Tab = Window:CreateTab({
    Name = "Elements Showcase",
    Icon = "rbxassetid://118685771787843"
})

local Block = Tab:CreateBlock({
    Name = "Basic Components",
    Side = "Left",
    Icon = "rbxassetid://118685771787843"
})

local Section = Block:CreateSection("Interactive")
```

``` lua
Tab:SetTitle("Updated Tab")
Block:SetTitle("Updated Block")
Section:SetText("Updated Section")
```

## Buttons

``` lua
local Button = Block:CreateButton({
    Name = "Show Notification",
    Callback = function()
        print("Clicked!")
    end
})

Button:SetText("New Text")
Button:SetCallback(function()
    print("New callback!")
end)
```

### Button with keybind

``` lua
local Button = Block:CreateButtonKeybind({
    Name = "Kill All Entities",
    Default = Enum.KeyCode.K,
    Callback = function()
        print("Button or bind activated!")
    end
})

Button:SetKeybind(Enum.KeyCode.G)
```

## Toggles

### Basic

``` lua
local Toggle = Block:CreateToggle({
    Name = "God Mode",
    Default = true,
    Callback = function(state)
        print("Toggle State:", state)
    end
})

Toggle:Set(false)
```

### Toggle + keybind

``` lua
local Aura = Block:CreateToggle({
    Name = "Aura",
    Default = false,
    Keybind = Enum.KeyCode.T,
    Callback = function(state, bind)
        print("Aura:", state, bind)
    end
})

Aura:SetKeybind(Enum.KeyCode.J)
```

### Toggle + color

``` lua
local ESP = Block:CreateToggle({
    Name = "ESP",
    Default = true,
    Color = Color3.fromRGB(110, 100, 255),
    Callback = function(state, color)
        print("ESP:", state, color)
    end
})

ESP:SetColor(Color3.fromRGB(0, 255, 0))
```

### Toggle + keybind + color

``` lua
local Chams = Block:CreateToggle({
    Name = "Chams",
    Default = false,
    Keybind = Enum.KeyCode.C,
    Color = Color3.fromRGB(255, 100, 100),
    Callback = function(state, color, bind)
        print("Chams:", state, color, bind)
    end
})

Chams:Set(true)
Chams:SetColor(Color3.fromRGB(0, 255, 255))
Chams:SetKeybind(Enum.KeyCode.Z)
```

## Label

``` lua
local Label = Block:CreateLabel("This is a label.")
Label:SetText("Updated text!")
```

## Picture

``` lua
local Picture = Block:CreatePicture({
    Name = "Target Avatar",
    Image = "rbxassetid://118685771787843",
    Size = 100,
    Description = "Example image description."
})

Picture:SetImage("rbxassetid://7059346373")
Picture:SetSize(40)
Picture:SetDescription("Updated description.")
```

## Dropdowns

### Single selection

``` lua
local Target = Block:CreateDropdown({
    Name = "Aimbot Target",
    Options = {"Head", "Torso", "Random", "Closest"},
    Default = "Head",
    Callback = function(selected)
        print("Selected:", selected)
    end
})

Target:SetOptions({"Chest", "Feet", "Hands"})
Target:Set("Chest")
```

### Multi selection

``` lua
local Hitboxes = Block:CreateDropdown({
    Name = "Target Hitboxes",
    Options = {"Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg"},
    Default = {"Head", "Torso"},
    Multi = true,
    MaxSelections = 4,
    Callback = function(selected)
        for i, value in ipairs(selected) do
            print(i, value)
        end
    end
})

Hitboxes:Set({"Left Arm", "Right Arm"})
```

### Search

``` lua
local Player = Block:CreateDropdown({
    Name = "Target Player",
    Options = {"Player1", "Player2", "NoobMaster69", "ProGamer", "Robloxian", "Guest_1234"},
    Search = true,
    Callback = function(selected)
        print("Target:", selected)
    end
})
```

### Search + Multi

``` lua
local Whitelist = Block:CreateDropdown({
    Name = "Whitelist Friends",
    Options = {"Player1", "Player2", "NoobMaster69", "ProGamer", "Robloxian", "Guest_1234"},
    Multi = true,
    Search = true,
    MaxSelections = 5,
    Callback = function(selected)
        for _, value in ipairs(selected) do
            print("Whitelisted:", value)
        end
    end
})
```

## Slider

``` lua
local WalkSpeed = Block:CreateSlider({
    Name = "WalkSpeed",
    Min = 16,
    Max = 500,
    Step = 1,
    Default = 16,
    Callback = function(value)
        print("WalkSpeed:", value)
    end
})

WalkSpeed:Set(250)
```

## Input

``` lua
local PlayerName = Block:CreateInput({
    Name = "Player Name",
    Placeholder = "Enter name...",
    Callback = function(text)
        print("Input:", text)
    end
})

PlayerName:SetText("Updated Player!")
```

## Keybind

``` lua
local MenuKey = Block:CreateKeybind({
    Name = "Hide Menu Key",
    Default = Enum.KeyCode.RightShift,
    Callback = function(key)
        print("Menu bind:", key.Name)
    end
})

MenuKey:SetKeybind(Enum.KeyCode.X)
```

## Colorpicker

``` lua
local Color = Block:CreateColorpicker({
    Name = "Ambient Color",
    Default = Color3.fromRGB(100, 100, 255),
    Callback = function(color)
        print("Color:", color)
    end
})

Color:SetColor(Color3.fromRGB(100, 255, 100))
```

## 3D Object

``` lua
local Preview = Block:CreateObject({
    Name = "Character 3D",
    Object = "game.Players.LocalPlayer",
    Size = 45,
    Description = "Hold RMB to rotate the model."
})

Preview:SetObject(workspace.Part)
Preview:SetDescription("Updated description")
Preview:SetSize(60)
Preview:ResetRotation()
```

## Notifications

``` lua
local Notification = Window:Notify({
    Title = "AxiomUI",
    Description = "This is a notification.",
    Duration = 5,
    Icon = "rbxassetid://118685771787843"
})

Notification:SetTitle("Updated Title")
Notification:SetDescription("Updated description")
Notification:SetIcon("rbxassetid://7059346373")
Notification:Close()
```

## Multi-Variant Blocks

Create multiple internal variants inside one block:

``` lua
local Combat, Movement = Tab:CreateBlock({
    Side = "Left",
    Variants = {
        {Name = "Combat", Icon = "rbxassetid://118685771787843"},
        {Name = "Movement", Icon = "rbxassetid://7059346373"}
    }
})
```

``` lua
Combat:CreateToggle({
    Name = "Silent Aim",
    Default = true,
    Keybind = Enum.KeyCode.P
})

Combat:CreateSlider({
    Name = "FOV Size",
    Min = 10,
    Max = 360,
    Default = 90
})

Combat:CreateDropdown({
    Name = "Hitbox",
    Options = {"Head", "Torso", "Legs"},
    Default = "Head"
})

Movement:CreateToggle({Name = "Bunny Hop", Default = false})

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
```

Three variants work the same way:

``` lua
local ESP, Chams, World = Tab:CreateBlock({
    Side = "Right",
    Variants = {
        {Name = "ESP", Icon = "rbxassetid://7059346373"},
        {Name = "Chams", Icon = "rbxassetid://118685771787843"},
        {Name = "World", Icon = "rbxassetid://7059346373"}
    }
})

ESP:CreateToggle({Name = "Show Boxes", Color = Color3.fromRGB(255, 255, 255)})
ESP:CreateToggle({Name = "Show Names"})
ESP:CreateToggle({Name = "Show Health"})

Chams:CreateToggle({Name = "Enable Chams", Color = Color3.fromRGB(255, 50, 50)})
Chams:CreateSlider({Name = "Fill Transparency", Min = 0, Max = 100, Default = 50})
Chams:CreateToggle({Name = "Wallhack (X-Ray)"})

World:CreateToggle({Name = "Night Mode"})
World:CreateColorpicker({Name = "Ambient Color", Default = Color3.fromRGB(100, 100, 255)})
World:CreateButton({
    Name = "Remove Shadows",
    Callback = function()
        print("Shadows removed!")
    end
})
```

## Dynamic UI Example

The returned component objects can be kept and updated later. A single
action can change many existing elements without recreating them:

``` lua
UpdateButton:CreateButton({
    Name = "UPDATE ALL ELEMENTS DYNAMICALLY!",
    Callback = function()
        Picture:SetSize(40)
        Picture:SetDescription("Updated picture description.")
        Picture:SetImage("rbxassetid://7059346373")

        Button:SetText("New Button Text")
        Button:SetKeybind(Enum.KeyCode.Q)

        Toggle:Set(false)
        Aura:Set(true)
        ESP:SetColor(Color3.fromRGB(0, 255, 0))

        Chams:Set(true)
        Chams:SetColor(Color3.fromRGB(0, 255, 255))
        Chams:SetKeybind(Enum.KeyCode.Z)

        Label:SetText("TEXT SUCCESSFULLY UPDATED!")
        Section:SetText("UPDATED SECTION NAME")

        Target:SetOptions({"Chest", "Feet", "Hands"})
        Target:Set("Chest")
        Hitboxes:Set({"Left Arm", "Right Arm"})
        WalkSpeed:Set(250)
        PlayerName:SetText("Updated Player!")
        Block:SetTitle("UPDATED BLOCK")
        Tab:SetTitle("Updated Tab!")
    end
})
```

## HUD & Editor

### Watermark

``` lua
Window.Watermark:SetVisible(true)
Window.Watermark:SetVisible(false)
Window.Watermark:SetLogo("rbxassetid://123456")
```

### Active keybinds HUD

``` lua
Window.Keybinds:SetVisible(true)
Window.Keybinds:SetVisible(false)
```

### UI edit mode

``` lua
Window:ToggleEditMode(true)
Window:ToggleEditMode(false)
```

## Complete API Cheat Sheet

``` text
Library
└─ CreateWindow
   ├─ CreateTab
   │  ├─ CreateBlock
   │  │  ├─ CreateSection
   │  │  ├─ CreateLabel
   │  │  ├─ CreateButton
   │  │  ├─ CreateButtonKeybind
   │  │  ├─ CreateToggle
   │  │  ├─ CreateInput
   │  │  ├─ CreateSlider
   │  │  ├─ CreateDropdown
   │  │  ├─ CreateColorpicker
   │  │  ├─ CreateKeybind
   │  │  ├─ CreatePicture
   │  │  └─ CreateObject
   │  └─ SetTitle
   ├─ Notify
   ├─ ToggleEditMode
   ├─ Watermark
   │  ├─ SetVisible
   │  └─ SetLogo
   └─ Keybinds
      └─ SetVisible
```

## Component Runtime API

``` text
Section       → SetText
Label         → SetText
Button        → SetText, SetCallback
ButtonKeybind → SetText, SetCallback, SetKeybind
Toggle        → Set, SetColor, SetKeybind
Input         → SetText
Slider        → Set
Dropdown      → SetOptions, Set
Colorpicker   → SetColor
Keybind       → SetKeybind
Picture       → SetImage, SetSize, SetDescription
Object        → SetObject, SetDescription, SetSize, ResetRotation
Notification  → SetTitle, SetDescription, SetIcon, Close
Block         → SetTitle
Tab           → SetTitle
```

## Design Philosophy

**Simple.** Common interfaces should take only a few lines.

**Flexible.** Components can be combined to build anything from a small
settings panel to a large multi-page hub.

**Dynamic.** Created elements remain controllable at runtime.

**Polished.** Themes, spacing, cards, HUD elements, notifications and
variants are designed to work as one visual system.

------------------------------------------------------------------------

```{=html}
<p align="center">
```
`<strong>`{=html}AxiomUI`</strong>`{=html}`<br>`{=html}`<sub>`{=html}Build
clean. Build fast. Build with AxiomUI.`</sub>`{=html}
```{=html}
</p>
```
