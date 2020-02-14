--[[ Version Checker ]]--
local VERSION = "1.2.0"

AddEventHandler("onResourceStart", function(resource)
    if resource == GetCurrentResourceName() then
        checkVersion()
    end
end)

function checkVersion()
  PerformHttpRequest("https://raw.githubusercontent.com/RevTheDev/rewards/master/version.json", function(err, text, h)
    if err == 200 then
      local versionArray = json.decode(text)
      local gitVersion = versionArray.version

      if(VERSION ~= gitVersion) then
        print("\n=================================\n")
        local patchnoteArray = versionArray.patchnote
        local patchnote = ""
        for _, line in pairs(patchnoteArray) do
          patchnote = patchnote..line.."\n"
        end

        print("A new version of rewards is available: "..VERSION)
        print("patchnote: \n"..patchnote)
        print("\n=================================\n")
      end
    else
      print(getText("cant_get_version"))
    end
  end, "GET")
end
