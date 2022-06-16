
TEMP_LUA = out.lua
OUT_FILE = n-2048.tns
UPLOADER_PATH = /home/alex/Scripts

all: clean build upload

clean:
	$(RM) $(TEMP_LUA)
	$(RM) $(OUT_FILE)

build:
	nspire-merge --out $(TEMP_LUA) -- gui.lua logic.lua main.lua
	luna $(TEMP_LUA) $(OUT_FILE)

upload:
	PATH=$(UPLOADER_PATH):$(PATH) uploadnspire $(OUT_FILE)

