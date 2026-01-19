{
  inputs,
  config,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    mesa
    mesa-demos
  ];
  # Enable opengl
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      nvidia-vaapi-driver
      intel-media-driver
      #intel-compute-runtime
    ];
    # driSupport = true;
    # driSupport32Bit = true;
  };
  services.xserver.videoDrivers = [
    "nvidia"
    "modesetting" # example for Intel iGPU; use "amdgpu" here instead if your iGPU is AMD
  ];
  hardware.nvidia = {
    # Modesetting is required.
    modesetting.enable = true;

    # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
    # Enable this if you have graphical corruption issues or application crashes after waking
    # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead
    # of just the bare essentials.
    powerManagement.enable = false;

    # Fine-grained power management. Turns off GPU when not in use.
    # Experimental and only works on modern Nvidia GPUs (Turing or newer).
    powerManagement.finegrained = false;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of
    # supported GPUs is at:
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
    # Only available from driver 515.43.04+
    open = false;

    # Enable the Nvidia settings menu,
    # accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    #package = config.boot.kernelPackages.nvidiaPackages.legacy_470;
  };

  hardware.nvidia.prime = {
    # Sync -> run dedicated all time
    #    sync.enable = true;

    #Offload -> run dedicated when it's necessary
    offload = {
      enable = true;
      enableOffloadCmd = true;
    };
    #integrated
    intelBusId = "PCI:0:2:0";
    # dedicated
    nvidiaBusId = "PCI:1:0:0";
  };
}
