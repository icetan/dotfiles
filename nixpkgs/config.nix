{ pkgs } : with pkgs; let
  setPrio = num: drv: pkgs.lib.addMetaAttrs { priority = num; } drv;
  #customEmacsPackages = emacsPackagesNg.override (super: self: {
  #  emacs = emacs25-nox;
  #});
  defaultShellHook = ''
    export PS1="$PS1"
  '';
in rec {
  allowUnfree = true;
  allowBroken = true;

  packageOverrides = pkgs : with pkgs; rec {

    bashEnv = callPackage (import ./bash.nix) {};

    myNeovim = callPackage (import ./vim.nix) {};

    vim-env = buildEnv {
      name = "vim-env";
      ignoreCollisions = true;
      paths = [
        myNeovim
      ];
    };

    #myEmacs = (customEmacsPackages.emacsWithPackages (epkgs : with epkgs; [
    #  #company
    #  #company-ghc
    #  evil
    #  #evil-leader
    #  #evil-surround
    #  #flycheck
    #  #haskell-mode
    #  helm
    #  #markdown-mode
    #  #monokai-theme
    #  #org
    #  #rainbow-delimiters
    #  #undo-tree
    #  #use-package
    #]));

    emacsEnv = #setPrio "9" (
    buildEnv {
      name = "emacs-env";
      ignoreCollisions = true;
      paths = [
        myEmacs
      ];
    };
    #);

    baseEnv = buildEnv {
      name = "base-env";
      ignoreCollisions = true;
      paths = [
        neomutt
        mu
        msmtp
        khal
        isync
        pandoc
      ];
    };

    myGhc = haskellPackages.ghcWithPackages (haskellPackages:
      with haskellPackages; [
        mtl
        QuickCheck
        random
        text
        alex
        cabal-install
        cpphs
        happy
        ghc-paths
        hdevtools
      ]
    );

    haskellEnv = buildEnv {
      name = "haskell-env";
      ignoreCollisions = true;
      paths = [
        myGhc
      ];
    };

    maven-oracle = maven.override {
      jdk = oraclejdk8psu;
    };

    maven-old = maven.overrideDerivation (_: rec {
      version = "3.0.5";
      name = "apache-maven-${version}";
      src = fetchurl {
        url = "mirror://apache/maven/maven-3/${version}/binaries/${name}-bin.tar.gz";
        sha256 = "1nbx6pmdgzv51p4nd4d3h8mm1rka8vyiwm0x1j924hi5x5mpd3fr";
      };
    });

    java-env = buildEnv {
      name = "java-env";
      ignoreCollisions = true;
      paths = [ maven ];
    };

    android-env = stdenv.lib.overrideDerivation (buildEnv {
      name = "android-env";
      ignoreCollisions = true;
      paths = [ androidsdk androidndk gradle ];
    }) (oldAttr: {
      shellHook = ''
        export ANDROID_HOME=${androidsdk}
      '';
    });

    oracle-java-env = buildEnv {
      name = "oracle-java-env";
      ignoreCollisions = true;
      paths = [ maven-oracle ];
    };

    scala-env = buildEnv {
      name = "scala-env";
      ignoreCollisions = true;
      paths = [
        sbt
        ammonite-repl
      ];
    };

    my-weechat = callPackage (import ./weechat.nix) {
      inherit (darwin) libobjc;
      inherit (darwin) libresolv;
      #lua5 = luajit;
      luaSupport = false;
      luaJitSupport = true;
      guileSupport = false; guile = null;
      rubySupport = false; ruby = null;
      tclSupport = false; tcl = null;
    };

    #spotify = pkgs.spotify.overrideDerivation (oldAttr: {
    #  name = "spotify-1.0.34.146.g28f9eda2-19";
    #  src = fetchurl {
    #    url = "http://repository-origin.spotify.com/pool/non-free/s/spotify-client/spotify-client_1.0.34.146.g28f9eda2-19_amd64.deb";
    #    sha256 = "1pks9b83aj6y3c3jlmll0rs05yk15r49v0v4amm950z68v182a5g";
    #  };
    #});
  };
}
