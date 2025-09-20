{
  networking = {
    hostName = "sunny"; # Define your hostname.
    #wireless.enable = true; # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
    # dns
    nameservers = [
      "1.1.1.1"
      "8.8.8.8"
    ];
    # Enable networking
    networkmanager.enable = true;
    interfaces.enp1s0.useDHCP = false;
    interfaces.enp1s0.ipv4.addresses = [
      {

        address = "192.168.1.30";
        prefixLength = 24;
      }
    ];
    defaultGateway = "192.168.1.1";
  };
}

# networking = {
#  hostName = "sunny";
#   interfaces.ens3 = {
#     #ipv6.addresses = [{
#     #  address = "2a01:4f8:1c1b:16d0::1";
#     #  prefixLength = 64;
#     #}];
#     ipv4.addresses = [{
#       address = "192.168.1.30";
#       prefixLength = 24;
#     }];
#   };
#   defaultGateway = {
#     address = "192.168.1.1";
#     interface = "ens3";
#   };
#   #defaultGateway6 = {
#   #  address = "fe80::1";
#   #  interface = "ens3";
#   #};
# };
