return function(specification)
    local features = specification.features.normal
    local name   = features.original or "texgyrepagella-regular"
    local option = features.option -- we only support "line"
    local size   = specification.size -- always set
    -- size can be negative if not font size is used
    texio.write_nl ("size="..size)
    local chessscale = features.chessscale or 0.75
    local chesschars = features.chesschars or {"P","p","N","n","B","l","R","r","Q","q","K","k"}
    -- I set the factors manually so that one can fine tune them independantly from the actual graphic size
    -- perhaps reconsider later
    -- Knight is a larger than the real value 22.6
    local chessheightfactors = {15.3,15.3,26.6,26.6,25.4,25.4,23.1,23.1,27.7,27.7,26.8,26.8}
    -- knight is not so wide then the real value (27.4), queen a bit larger than 20.2
    local chesswidthfactors =  {15.2,15.2,27.4,27.4,20.2,20.2,12.4,12.4,20.3,20.3,20.2,20.2}
    -- scale factor to adjust the relative size
    local chessscalefactors =  {1.2,1.2,1,1,1,1,1.1,1.1,1,1,1,1}
    local chessmoveleftfactors     =  {1,1,2.5,2.5,1,1,1,1,1,1,1,1}
    if size <= 0 then fontsize = chessscale*10*65782 else fontsize=chessscale*size end
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

 for I = 1,#chesschars do
   local n = utf.byte(chesschars[I])
   if f.characters[n] then 
     f.characters[n].width=chessscalefactors[I]*chesswidthfactors[I]/chessheightfactors[12]*fontsize
   end    
   f.characters[n].commands = {
     { "right" , -50000*chessmoveleftfactors[I]},
     { "image", {filename="duckchess-glyphs.pdf", 
                 transform=4,
                 page=I,
                 height=chessscalefactors[I]*chessheightfactors[I]/chessheightfactors[12]*fontsize.."sp"} },
    }
  end  
 end
return f
end
