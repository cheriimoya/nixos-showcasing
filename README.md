# Quick showcasing of Nix and NixOS

This small repo shall give interested users and administrators a consise view on what Nix is and how it is being leveraged to define a linux based operating system known as NixOS.

## Nix example

To build the `hello.nix` file you need to [have Nix installed](https://nixos.org/download.html).
Then, you can simply run `nix-build ./nix/hello.nix` (or using the newer `nix build -f ./nix/hello.nix`).
This builds the gnu hello package and puts the result in the nix store sitting at `/nix/store/`.
For convenience, a symbolic link called `result` will be put in the current working directory so you can write `./result/bin/hello` to run the hello binary.

## NixOS example

| :warning: For this, you need to run NixOS or try running it with `nix-shell -p nixos-rebuild` (untested!). |
|------------------------------------------------------------------------------------------------------------|

The file `./nixos/configuration.nix` contains a playground NixOS VM definition which you can build by running `NIXOS_CONFIG="${PWD}/nixos/configuration.nix" nixos-rebuild build-vm-with-bootloader`.
This command will build the example VM and also write the VM system to the nix store (like every output Nix generates btw).
You can run the VM you just built by executing `./result/bin/run-showcase-vm` or directly by the path that `nixos-rebuild` will print as the last line.
Obviously you need to have kvm enabled for the VM to be usable in terms of speed.
The hashed password of the vmuser is "pass".

The nix store inside of the VM is mounted by using P9 in a way that the VM cannot modify the nix store.
So if you make changes, you'll need to rebuild the VM.
