let
  mkZfsLegacyFs = mount: {
    mountpoint = mount;
    options.mountpoint = "legacy";
    type = "zfs_fs";
  };
in {
  type = "zpool";
  datasets = {
    # "root" = mkZfsLegacyFs "/";
    "nix" = mkZfsLegacyFs "/nix";
    "home" = mkZfsLegacyFs "/home";
    "persist" = mkZfsLegacyFs "/persist";
  };
  options = {
    ashift = "12";
    autotrim = "on";
  };
  rootFsOptions = {
    acltype = "posixacl";
    atime = "off";
    compression = "zstd";
    normalization = "none";
    xattr = "sa";
  };
}
