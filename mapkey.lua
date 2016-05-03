local _ = require 'shim'

local function getType(val)
	return type(val)
end

local function mapKey(map, raw)
	local ret = {}
	if map and raw then
		_.forIn(raw, function(val, key)
			local info = map[key]
			if nil ~= info then
				if _.isTable(info) then
					local type = info.type or getType(val)
					local name = info.name
					if _.includes({'object', 'table'}, type) then
						ret[name] = mapKey(info.child, val)
					elseif 'array' == type then
						ret[name] = _.map(val, function(item)
							return mapKey(info.child, item)
						end)
					end
				else
					ret[info] = val
				end
			end
		end)
	end
	return ret
end

return mapKey
