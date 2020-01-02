if not app.activeSprite then
	app.alert("There is no active sprite!")
end

local dlg = Dialog()
dlg:number{ id="frames", label="Frames:" }
dlg:button{ id="ok", text="OK" }
dlg:button{ id="cancel", text="Cancel" }
dlg:show()

local data = dlg.data

if data.ok then
	app.command.GoToFirstFrame()
	app.command.GoToNextFrame()

	for i = 1, #app.activeSprite.frames do
		if i % data.frames == 0 then
			app.command.RemoveFrame()	
		else
			app.command.GotoNextFrame()
		end
	end
end
