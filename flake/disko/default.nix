{
  disko.devices = {
    disk."main" = {
      device = "/dev/sda";
      imageSize = "10G";
      type = "disk";

      content = {
        type = "gpt";
        partitions = import ./partitions.nix;
      };
    };
    zpool."zroot" = import ./zroot.nix;
    nodev = import ./nodevs.nix;
  };
}
