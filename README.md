# NixOS Impermanence VM

This is a simple project for testing impermanence deployment on NixOS.  It also uses Disko for declarative disk management.

## Creating a VM

Disko allows the opportunity to fully build an operational VM disk image, provisioned according to your config.

### Build the VM

Building is a two-step process:

* Create the helper VM build instructions
* Execute the instructions

`nix build` will create the instructions as I've aliased the disko build output.
`sudo ./result --build-memory 8192` will create and run the helper VM to build the image.  Adjust memory as needed/availible.

The final disk output will be `main.raw` in the local directory.  It can be run with QEMU, you may want to `chown` it to your user.

### Run the VM

This is mostly for my convenience:

```
qemu-system-x86_64 -m 8G -machine type=q35,accel=kvm -smp 4 -drive format=raw,file=main.raw -cpu host -display default -vga virtio -bios /nix/store/rca6khqlw5bykxqwnkbgb8r5fv0kj5ad-OVMF-202411-fd/FV/OVMF.fd
```

Use `nix-locate` to find the OVMF path.
