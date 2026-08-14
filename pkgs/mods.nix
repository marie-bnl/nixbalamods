{
  fetchFromGitHub,
  fetchzip,
}:

{
  smods = fetchFromGitHub {
    name = "smods";
    owner = "Steamodded";
    repo = "smods";
    tag = "1.0.0-beta-1814a";
    hash = "sha256-5chUzZSfUDUqtlMzSdSa1fZRHOPvRIdwHnKK83f4ecs=";
  };

  balatreat = fetchzip {
    name = "balatreat";
    url = "https://nomnomnami.com/games/treat/downloads/BALATREAT(sm-template).zip";
    hash = "sha256-VN/n4Hotvlejs/jn+EOFJ6r7o7cSWtHJBEJdBly5oRA=";
  };
}