class "List"

function List:__init(p_Size)
  self.m_Data = {}

  if p_Size ~= nil then
    -- TODO
  end
end

function List:__index(p_Index)
  return self.m_Data[p_Index]
end

-- Causes crash
-- function List:__newindex(p_Index, p_Value)
--   self.m_Data[p_Index] = p_Value
-- end

function List:__tostring()
  return tostring(self.m_Data)
end

function List:__len()
  return #self.m_Data
end

function List:__gc()
  self.m_Data = nil
end

function List:Set(p_Index, p_Value)
  self.m_Data[p_Index] = p_Value
end

function List:Get(p_Index)
  return self.m_Data[p_Index]
end

function List:Insert(p_Pos, p_Value)
  table.insert(self.m_Data, p_Pos, p_Value)
end

function List:Push(p_Value)
  table.insert(self.m_Data, p_Value)
end

-- Changes all elements in an array to a static value
function List:Fill(p_Value)
  for l_Index, _ in ipairs(self.m_Data) do
    self.m_Data[l_Index] = p_Value
  end
end

-- Creates a new array with all elements that pass the test
-- implemented by the provided function
function List:Filter(p_Predicate)
  local l_NewList = List()

  for _, l_Value in ipairs(self.m_Data) do
    if p_Predicate(l_Value) then
      l_NewList:Push(l_Value)
    end
  end

  return l_NewList
end

-- Creates a new array populated with the results of calling
-- a provided function on every element in the calling array
function List:Map(p_Predicate)
  local l_NewList = List()

  for _, l_Value in ipairs(self.m_Data) do
    l_NewList:Push(p_Predicate(l_Value))
  end

  return l_NewList
end

-- Executes a reducer function (that you provide) on each element
-- of the array, resulting in a single output value
function List:Reduce(p_Predicate, p_InitialValue)
  local l_Accumulator = p_InitialValue or 0

  for _, l_Value in ipairs(self.m_Data) do
    l_Accumulator = p_Predicate(l_Accumulator, l_Value)
  end

  return l_Accumulator
end

function List:Contains(p_Value)
  for _, l_Value in ipairs(self.m_Data) do
    if l_Value == p_Value then
      return true
    end
  end

  return false
end

function List:Sort(p_Comparator, p_InPlace)
  -- TODO use p_InPlace flag

  local l_NewList = self:Clone()
  table.sort(l_NewList.m_Data, p_Comparator)

  return l_NewList
end

-- Returns a new list containing only distinct elements of the list
function List:Distinct()
  -- TODO
end

function List:Clone()
  local l_NewList = List()

  for _, l_Value in ipairs(self.m_Data) do
    l_NewList:Push(l_Value)
  end

  return l_NewList
end

function List:Size()
  return #self.m_Data
end

return List
