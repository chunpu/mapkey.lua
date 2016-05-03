mapkey.lua
===

```lua
local mapKey = require 'mapkey'
```

Api
---

```lua
var translatedObj = mapKey(translateMap, rawObj)
```

Usage
---

```lua
test('should map key deep', function(t)
	local translateMap = {
		a = 'apple',
		g = 'google',
		e = 'error',
		t = 'timestamp',
		l = {
			name = 'list',
			child = {
				b = 'baidu',
				a = 'ali',
				d = {
					name = 'deep',
					child = {
						n = 'nested'
					}
				}
			},
			type = 'array'
		},
		o = {
			name = 'object',
			child = {
				m = 'xiaomi',
				t = 'qq'
			}
		},
		n = 'null',
		no = 'number'
	}

	local raw = {
		a = 'apple val',
		g = 'google val',
		e = 'fucked up',
		t = 1234567,
		l = {
			{
				b = 'baidu val',
				a = 'ali val',
				d = {
					n = 'nested'
				}
			}, {
				b = 'baidu2',
				a = 'ali2'
			}
		},
		o = {
			m = 'xiaomi val',
			t = 'qq val'
		},
		n = null,
		no = 1024,
		key_has_no_map = 'error'
	}

	local expected = {
		apple = 'apple val',
		google = 'google val',
		error = 'fucked up',
		timestamp = 1234567,
		list = {
			{
				baidu = 'baidu val',
				ali = 'ali val',
				deep = {
					nested = 'nested'
				}
			},
			{
				baidu = 'baidu2',
				ali = 'ali2'
			}
		},
		object = {
			xiaomi = 'xiaomi val',
			qq = 'qq val'
		},
		null = null,
		number = 1024
	}

	local ret = mapKey(translateMap, raw)
	t.deepEqual(ret, expected)
end)
```
