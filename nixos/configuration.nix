{ config, pkgs, ... }: {
  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "/dev/sda";
  };

  networking.hostName = "showcase";
  time.timeZone = "Europe/Berlin";
  networking.interfaces.eth0.useDHCP = true;

  # services.xserver.enable = true;
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.mate.enable = true;

  virtualisation.docker.enable = true;

  services.xserver.layout = "eu";

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  users.users = {
    root = { password = "pass"; };
    vmuser = {
      isNormalUser = true;
      hashedPassword = "$1$P8jwThmP$mshJfqQrYFEdKxJ3yx11o0"; # This is also "pass"
      extraGroups = [ "wheel" ];
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
   environment.systemPackages = with pkgs; [
     vim
     # wget
     # firefox
   ];

   services = {
     openssh.enable = true;
     # nextcloud = {
     #   enable = true;
     # };
   };

  system.stateVersion = "21.11";
}
