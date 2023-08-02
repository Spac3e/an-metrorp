local PLUGIN = PLUGIN

local saveEnts = {
    ['ix_farmtap'] = true,
}

function Schema:SaveData()
    local savedEntities = {}

    for k, v in ipairs(ents.GetAll()) do
        local class = v:GetClass():lower()
            
        if (saveEnts[class]) then
            table.insert(savedEntities, {
                class = class, 
                pos = v:GetPos(),
                ang = v:GetAngles(),
            })
        end
    end

    self:SetData(savedEntities)
end

function Schema:LoadData()
    local savedEntities = self:GetData() or {}
    
    for k, v in ipairs(ents.GetAll()) do
        local class = v:GetClass():lower()
        if (saveEnts[class]) then
            v:Remove()
        end
    end
    
    for k, v in ipairs(savedEntities) do
        local ent = ents.Create(v.class)
        ent:SetPos(v.pos)
        ent:SetAngles(v.ang)
        ent:Spawn()
        ent:Activate()

        local phys = ent:GetPhysicsObject()
        if (IsValid(phys)) then
            phys:Wake()
            phys:EnableMotion()
        end

    end
end

