return function(specification)
    local features = specification.features.normal
    local name   = features.original or "texgyrepagella-regular"
    local option = features.option -- we only support "line"
    local size   = specification.size -- always set
    -- size can be negative if not font size is used
    texio.write_nl ("size="..size)
    if size <= 0 then fontsize = 10*65590 else fontsize=size end
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
--  local n = utf.byte("K")
    f.characters[utf.byte("K")].commands = {
    { "image", {filename="duckchess.pdf", page=11,height= fontsize.."sp"} },
    }
      f.characters[utf.byte("k")].commands = {
    { "image", {filename="duckchess.pdf", page=12,height= fontsize.."sp"} },
    }
  
 end
return f
end
