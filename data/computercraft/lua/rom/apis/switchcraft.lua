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
  return 0, "The TPS API is not available"
end

function isYemmelOn()
  return false, "the brotherhood is real"
end
isYemOn = isYemmelOn
return {
  githubLimits = githubLimits,
  tps = tps
}