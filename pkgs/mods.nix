{
  fetchFromGitHub,
  fetchzip,
}:

{
  balatreat = fetchzip {
    name = "balatreat";
    url = "https://nomnomnami.com/games/treat/downloads/BALATREAT(sm-template).zip";
    hash = "sha256-VN/n4Hotvlejs/jn+EOFJ6r7o7cSWtHJBEJdBly5oRA=";
  };

  cryptid = fetchFromGitHub {
    name = "cryptid";
    owner = "SpectralPack";
    repo = "Cryptid";
    tag = "v0.5.16d";
    hash = "sha256-DS6uiCopMQznib1Wx0XjVKpb8iwmbg7iKic9FhjTo1A=";
  };

  multiplayer = fetchFromGitHub {
    name = "multiplayer";
    owner = "Balatro-Multiplayer";
    repo = "BalatroMultiplayer";
    tag = "v0.5.5";
    hash = "sha256-uYUJbIjQaztSqEQLybTTt3xi+aRg/cI5+BqNRU+ZdN0=";
  };

  saturn =
    builtins.warn "Saturn will probably not work (see https://github.com/marie-bnl/nixbalamods/issues/1)"
    fetchFromGitHub {
      name = "saturn";
      owner = "OceanRamen";
      repo = "Saturn";
      tag = "alpha-0.2.2-E-qf3";
      hash = "sha256-0llBmDtGtMYYCsitZigrUtraaJB0NZtpxn7ELeZHBqc=";
    };

  smods = fetchFromGitHub {
    name = "smods";
    owner = "Steamodded";
    repo = "smods";
    tag = "1.0.0-beta-1814a";
    hash = "sha256-5chUzZSfUDUqtlMzSdSa1fZRHOPvRIdwHnKK83f4ecs=";
  };
}