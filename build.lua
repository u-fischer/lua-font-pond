-- l3build check settings for lua-font-pond
module="lua-font-pond"

stdengine    = "luatex"
checkengines = {"luatex"}
checkconfigs = {"build","config-plain"}

testsuppdir =  "./ressources" -- test files should also use ressources

checkruns = 3

kpse.set_program_name ("kpsewhich")
if not release_date then
 dofile ( kpse.lookup ("l3build.lua"))
end
