{config, pkgs,...}:
{
  environment.systemPackages = [
    #Apps
    pkgs.syncthing
    #programming
    pkgs.nodejs_20
    #pkgs.python313
    (pkgs.python3.withPackages(ps: with ps; [ numpy pandas jupyter ]))
    #pkgs. python312Packages.jupyter-core
    #pkgs.opencv
    #pkgs.vscode
    pkgs.vscodium
    #Database--
    pkgs.dbeaver-bin    
    #MySQL
    pkgs.mysql84
    pkgs.mysql-workbench
    #Postgres
    pkgs.pgadmin4
    #Versioning
    pkgs.git
    pkgs.gh
   # utility
    pkgs.postman #backend utility for proping/testing api
    pkgs.yt-dlp
    pkgs.ffmpeg_7
    pkgs.mpv
    pkgs.krita
    pkgs.pdfsam-basic #pdf utility
    pkgs.shotcut #video editing UI
    pkgs.stow # tool for symlink managing 	   
    # Security util
    pkgs.burpsuite
];
}
