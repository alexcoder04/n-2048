
TEMP_LUA = out.lua
OUT_FILE = n-2048.tns
UPLOADER_PATH = /home/alex/Scripts:/home/alex/.local/bin

all: clean build upload

clean:
	$(RM) $(TEMP_LUA)
	$(RM) $(OUT_FILE)

build:
	nspire-merge --out $(TEMP_LUA) -- gui.lua logic.lua events.lua
	luna $(TEMP_LUA) $(OUT_FILE)

upload:
	PATH=$(UPLOADER_PATH):$(PATH) uploadnspire $(OUT_FILE)

