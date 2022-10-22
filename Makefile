
TEMP_LUA = out.lua
OUT_FILE = n-2048.tns

all: clean build upload

clean:
	$(RM) $(TEMP_LUA)
	$(RM) $(OUT_FILE)

build:
	nspire-merge --out $(TEMP_LUA) -- gui.lua logic.lua events.lua
	luna $(TEMP_LUA) $(OUT_FILE)

upload:
	uploadnspire $(OUT_FILE)

