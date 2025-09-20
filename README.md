## Structure

I've structured my files based on what I've seen as popular way to organize your nix configs and also what seems more modular.

`homeManagerModules/` -> Modules that I use for home-manager
`homes/` -> My home manager profiles
`hosts/` -> My personal laptop, local server and work laptop (soon)
`nixosModules/` -> Services and DE that cannot run by home-manager

## Profiles

`perry` -> My personal laptop
`sunny` -> local server for self-hosting

## Todos

- [ ] Add XFCE option
- [ ] If possible make an entire profile only for focus -> swap to XFCE and remove unnecessary applications.
- [ ] Fix Syncthing doesn't remember the stored devices for some reason (atp I'm going to use docker for syncthing)
