
build:
	nspire-merge --out out.lua -- gui.lua main.lua
	luna out.lua n-2048.tns

clean:
	$(RM) out.lua
	$(RM) n-2048.tns

.PHONY: clean build

