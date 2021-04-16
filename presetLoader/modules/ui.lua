ui = {
    currentName = "New preset",
    color = {0, 50, 255}
}

function ui.draw(pL)
    if pL.CPSinstalled then 
        pL.CPS:setThemeBegin() 
    end
	if (ImGui.Begin("Settings Presets", ImGuiWindowFlags.AlwaysAutoResize)) then
        if pL.CPSinstalled then 
            pL.CPS.colorBegin("Separator", ui.color)
            pL.CPS.colorBegin("Border", ui.color)
        end
        ImGui.BeginChild("addNew", 300, 60, true)
        ImGui.Text("Add new preset with current settings")
        ImGui.Separator()
        ui.currentName = ImGui.InputTextWithHint("", "Preset Name", ui.currentName, 100)
        ImGui.SameLine()
        if ImGui.Button("Add") then 
            local name = ui.currentName
            if name == "" then name = "New Preset" end
            pL.GameSettings.ExportTo(tostring("presets/" .. name .. ".lua")) 
        end
        ImGui.EndChild()

        for _, file in pairs(dir("presets")) do
            if file.name:match("^.+(%..+)$") == ".lua" then
                ui.drawPreset(file, pL)
            end
        end

        if pL.CPSinstalled then 
            pL.CPS.colorEnd(2)
        end
        ImGui.End()
	end

    if pL.CPSinstalled then pL.CPS:setThemeEnd() end
end

function ui.drawPreset(p, pL)
    if not p.deleted then
        ImGui.BeginChild(p.name, 300, 80, true)
        ImGui.Text(p.name:match("(.+)%..+$"))
        ImGui.Separator()

        if ImGui.RadioButton("HK 1", pL.hks.hk1 == p.name) then 
            pL.hks.hk1 = p.name
            pL.fileSys.saveFile("config.json", pL.hks)
        end
        ImGui.SameLine()
        if ImGui.RadioButton("HK 2", pL.hks.hk2 == p.name) then 
            pL.hks.hk2 = p.name
            pL.fileSys.saveFile("config.json", pL.hks)
        end
        ImGui.SameLine()
        if ImGui.RadioButton("HK 3", pL.hks.hk3 == p.name) then 
            pL.hks.hk3 = p.name
            pL.fileSys.saveFile("config.json", pL.hks)
        end
        ImGui.SameLine()
        if ImGui.RadioButton("HK 4", pL.hks.hk4 == p.name) then 
            pL.hks.hk4 = p.name
            pL.fileSys.saveFile("config.json", pL.hks)
        end
        ImGui.SameLine()
        if ImGui.RadioButton("HK 5", pL.hks.hk5 == p.name) then 
            pL.hks.hk5 = p.name
            pL.fileSys.saveFile("config.json", pL.hks)
        end

        if ImGui.Button("Load") then
            pL.GameSettings.ImportFrom(tostring("presets/" .. p.name))
            pL.GameSettings.Save()
        end
        ImGui.SameLine()
        if ImGui.Button("Store current Settings") then
            pL.GameSettings.ExportTo(tostring("presets/" .. p.name))
        end
        ImGui.SameLine()
        if ImGui.Button("Delete") then
            os.remove("presets/" .. p.name)
        end

        ImGui.EndChild()
    end
end

return ui