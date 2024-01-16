build:
	nixos-rebuild build-vm --flake .\#linuxBase

run:
	result/bin/run-nixos-vm
