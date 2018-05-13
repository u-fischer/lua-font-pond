return function(specification)
    local features = specification.features.normal
    local name   = features.original or "texgyrepagella-regular"
    local option = features.option -- we only support "line"
    local size   = specification.size -- always set
    -- size can be negative if not font size is used
    if size <= 0 then rulesize = 1000 else rulesize=size/10 end
    local detail = specification.detail -- e.g. default
 if detail then
  name = name .. ":" .. detail -- latex syntax instead of *
 end
 local f, id = fonts.constructors.readanddefine(name,size)
 if f then
  f.properties.name = specification.name
  f.properties.virtualized = true
  f.fonts = {
   { id = id },
  }
  for s in string.gmatch("aeuioy",".") do
  local n = utf.byte(s)
  local c = f.characters[n]
  if c then
   local w = c.width or 0
   local h = c.height or 0
   local d = c.depth or 0
   if option == "line" then
    f.characters[n].commands = {
    { "rule", rulesize, w },
    }
   else
    f.characters[n].commands = {
    { "down", d },
    { "rule", h + d, w },
    }
   end
  else
-- probably a real bad font
  end
 end
end
return f
end
