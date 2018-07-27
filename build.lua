-- l3build check settings for lua-font-pond
module="lua-font-pond"

stdengine    = "luatex"
checkengines = {"luatex"}
checkconfigs = {"build","config-unicode-math","config-plain","config-fontspec"}

testsuppdir =  "./resources" -- test files should also use resources

checkruns = 3

kpse.set_program_name ("kpsewhich")
if not release_date then
 dofile ( kpse.lookup ("l3build.lua"))
end
