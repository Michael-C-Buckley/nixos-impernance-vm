# NixOS Impermanence VM

This is a simple project for testing impermanence deployment on NixOS.  It also uses Disko for declarative disk management.

## Creating a VM

Disko allows the opportunity to fully build an operational VM disk image, provisioned according to your config.

### Build the VM

Building is a two-step process:

* Create the helper VM build instructions
* Execute the instructions

`nix build` will create the instructions as I've aliased the disko build output.
`./result --build-memory 8192` will create and run the helper VM to build the image.  Adjust memory as needed/availible.

### Run the VM

Use `nix-locate` to find the OVMF path.
This is mostly for my convenience:

```
qemu-system-x86_64 \
  -enable-kvm \
  -cpu host \
  -m 8G \
  -smp 4 \
  -drive file=main.raw,format=raw,if=virtio \
  -device virtio-net-pci,netdev=net0 \
  -netdev user,id=net0,hostfwd=tcp::2222-:22 \
  -nographic \
  -serial mon:stdio \
  -bios /nix/store/ypfbsa465m41zyxkcdgqhlgc7j9411di-OVMF-202411-fd/FV/OVMF.fd
```