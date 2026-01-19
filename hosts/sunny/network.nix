{
  networking = {
    hostName = "sunny"; # Define your hostname.
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

