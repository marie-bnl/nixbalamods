{
  balatro,
  fetchpatch2,
  lib,
  linkFarmFromDrvs,
  lovely-injector,
  modList ? [],
  overriddenSrc ? null,
}:
let
  modDir = linkFarmFromDrvs "balatro-mods" modList;

  balatro-patched = balatro.overrideAttrs ({ postInstall ? "", ... }: {
    postInstall = postInstall + ''
      wrapProgram $out/bin/balatro \
        --set LOVELY_DEBUG_DIR '/tmp/balatro-debug' \
        --set LOVELY_MOD_DIR '${modDir}'
    '';
  });
in
balatro-patched.override {
  inherit overriddenSrc;

  lovely-injector = lovely-injector.overrideAttrs ({ patches ? [], ... }: {
    patches = patches ++ [(
      # Separates DEBUG_DIR from MOD_DIR so MOD_DIR can be immutable
      fetchpatch2 {
        url = "https://patch-diff.githubusercontent.com/raw/ethangreen-dev/lovely-injector/pull/375.diff?full_index=1";
        hash = "sha256-vZplGhVZ7Ww1peCzHaOvDQmJJsDIOhappfmqmB/nnAk=";
      }
    )];
  });
}