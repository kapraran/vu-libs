class "Map"

function Map:__init()
  self.m_Data = {}
end

-- Causes crash
-- function Map:__newindex(p_Key, p_Value)
--   self.m_Data[p_Key] = p_Value
-- end

function Map:__index(p_Key)
  return self.m_Data[p_Key]
end

function Map:__tostring()
  return tostring(self.m_Data)
end

function Map:__len()
  return self:Size()
end

function Map:__gc()
  self.m_Data = nil
end

function Map:Keys()
  local l_Keys = {}
  for l_Key, _ in pairs(self.m_Data) do
    table.insert(l_Keys, l_Key)
  end

  return l_Keys
end

function Map:Values()
  local l_Values = {}
  for _, l_Value in pairs(self.m_Data) do
    table.insert(l_Values, l_Value)
  end

  return l_Values
end

function Map:IsEmpty()
  return next(self.m_Data) == nil
end

function Map:Size()
  local l_Count = 0
  for _, _ in pairs(self.m_Data) do
    l_Count = l_Count + 1
  end

  return l_Count
end

return Map
