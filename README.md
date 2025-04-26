# NixOS Impermanence VM

This is a simple project for testing impermanence deployment on NixOS.  It also uses Disko for declarative disk management.

##  Run Command

This is mostly for my convenience:

```
qemu-system-x86_64 -m 8G -machine type=q35,accel=kvm -smp 4 -drive format=raw,file=main.raw -cpu host -display default -vga virtio -bios /nix/store/rca6khqlw5bykxqwnkbgb8r5fv0kj5ad-OVMF-202411-fd/FV/OVMF.fd
```

Use `nix-locate` to find the OVMF path.
