do 
   local MyUnitIdTable = { 
      'xeb0304',
      'xrb0404',
      'xsb0104',
      'xab0104',       
   } 
   --unit icon must be in /icons/units/. Put the full path to the /icons/ folder in here - note no / on the end! 
   local MyIconPath = "/mods/T3EngStationsFAF" 
    
   local function IsMyUnit(bpid) 
      for i, v in MyUnitIdTable do 
         if v == bpid then 
            return true 
         end 
      end 
      return false 
   end 
    
   local oldUpdateWindow = UpdateWindow 
   function UpdateWindow(info) 
      oldUpdateWindow(info) 
      if IsMyUnit(info.blueprintId) and DiskGetFileInfo(MyIconPath .. '/icons/units/' .. info.blueprintId.. '_icon.dds') then 
         controls.icon:SetTexture(MyIconPath .. '/icons/units/' .. info.blueprintId .. '_icon.dds') 
      end 
   end 
end