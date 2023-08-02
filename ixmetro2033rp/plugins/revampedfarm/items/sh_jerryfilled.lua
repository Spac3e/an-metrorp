ITEM.name = "Jerrycan"
ITEM.description = "A jerrycan filled with water."
ITEM.model = "models/props_junk/metalgascan.mdl"
ITEM.uniqueID = "jerryfilled"

if (CLIENT) then
    function ITEM:PaintOver(item, w, h)
        draw.SimpleText("Full", "DermaDefault", 5, h - 5, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, color_black)
    end
end