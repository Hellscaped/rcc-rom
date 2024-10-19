local GITHUB_API_URL = "https://api.github.com"

function githubLimits(key)
  key = key or "guest"
  local headers = {}

  local url = GITHUB_API_URL .. "/rate_limit"
  if key ~= "guest" then
    headers.Authorization =  'token ' .. key
  end

  local h, err = http.get(url, headers)
  if not h or err then
    error("Error contacting GitHub API: " .. err)
  end

  local data = textutils.unserializeJSON(h.readAll())
  h.close()
  return data
end

function tps()
  local h = http.get("https://api.reconnected.cc/tps")
  if not h then
      return 0, "Error contacting the API"
  end
  local data = h.readAll()
  h.close()
  return tonumber(data), nil
end

function isYemmelOn()
  return false, "the brotherhood is real"
end
isYemOn = isYemmelOn

function isDrunk(n)
  local h, err = http.get("https://lemmmy.pw/bac?u=" .. textutils.urlEncode(n))
  if err then error("Not ok") end
  
  local data = textutils.unserialiseJSON(h.readAll())
  h.close()
  return data.drunk
end

function isYemmelDrunk()
  return isDrunk("Yemmel")
end
isYemDrunk = isYemmelDrunk

function isLemmmyDrunk()
  return isDrunk("Lemmmy")
end
isLemDrunk = isLemmmyDrunk

return {
  githubLimits = githubLimits,
  tps = tps,
  isYemmelOn = isYemmelOn,
  isYemOn = isYemmelOn,
  isDrunk = isDrunk,
  isYemmelDrunk = isYemmelDrunk,
  isYemDrunk = isYemmelDrunk,
  isLemmmyDrunk = isLemmmyDrunk,
  isLemDrunk = isLemmmyDrunk
}