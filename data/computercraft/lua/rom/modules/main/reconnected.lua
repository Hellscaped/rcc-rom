function tps()
    local h = http.get("https://api.reconnected.cc/tps")
    if not h then
        return 0, "Error contacting TPS API"
    end
    local data = h.readAll()
    h.close()
    return tonumber(data), nil
end

return {
    tps = tps
}