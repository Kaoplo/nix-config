{ config, lib, pkgs, configDir, ... }:

let
  zshPlugins = [ "sudo" ];
  zshExtraConfigText = "";
in
{
  config = {
    home.packages = with pkgs; [
      eza
      duf
      bat
      zsh
      oh-my-zsh
      zsh-autosuggestions
      zsh-syntax-highlighting

      zsh-powerlevel10k
      fastfetch
    ];

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      oh-my-zsh = {
        enable = true;
        plugins = zshPlugins;
      };

      dotDir = "${config.xdg.configHome}/zsh";

      shellAliases = {
        c = "clear";
        vc = "code";
        fastfetch = "fastfetch --logo-type kitty";
        ".." = "cd ..";
        "..." = "cd ../..";
        ".3" = "cd ../../..";
        ".4" = "cd ../../../..";
        ".5" = "cd ../../../../..";
        mkdir = "mkdir -p";
      };

      initContent = lib.mkMerge [
        (lib.mkOrder 550 ''
          #!/usr/bin/env zsh
          # Some binds won't work on first prompt when deferred
          bindkey '\e[H' beginning-of-line
          bindkey '\e[F' end-of-line
        '')

        (lib.mkOrder 910 ''
          # Source the rest of the functions
          if [[ -d ~/.config/zsh/functions ]]; then
              for file in ~/.config/zsh/functions/*.zsh; do
                  [[ -f "$file" ]] && source "$file"
              done
          fi

          if [[ -d ~/.config/zsh/completions ]]; then
              for file in ~/.config/zsh/completions/*.zsh; do
                  [[ -f "$file" ]] && source "$file"
              done
          fi
        '')

        ''
          pokego --no-title -r 1,3,6

          # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
          # Initialization code that may require console input (password prompts, [y/n]
          # confirmations, etc.) must go above this block; everything else may go below.
          if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
            source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
          fi
          source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme

          ${zshExtraConfigText}
        ''
      ];
    };

    home.file = lib.mkMerge [
      {
        ".zshenv".source = "${configDir}/.zshenv";

        ".config/zsh/completions/hyde-shell.zsh".source =
          "${configDir}/.config/zsh/completions/hyde-shell.zsh";

        ".config/zsh/.p10k.zsh" = {
          source = "${configDir}/.config/zsh/.p10k.zsh";
          enable = true;
        };

        ".config/zsh/completions/fzf.zsh".source =
          "${configDir}/.config/zsh/completions/fzf.zsh";

        ".config/zsh/completions/hydectl.zsh".source =
          "${configDir}/.config/zsh/completions/hydectl.zsh";

        ".config/zsh/functions/bat.zsh".source =
          "${configDir}/.config/zsh/functions/bat.zsh";

        ".config/zsh/functions/bind_M_n_history.zsh".source =
          "${configDir}/.config/zsh/functions/bind_M_n_history.zsh";

        ".config/zsh/functions/duf.zsh".source =
          "${configDir}/.config/zsh/functions/duf.zsh";

        ".config/zsh/functions/eza.zsh".source =
          "${configDir}/.config/zsh/functions/eza.zsh";

        ".config/zsh/functions/fzf.zsh".source =
          "${configDir}/.config/zsh/functions/fzf.zsh";

        ".config/zsh/functions/kb_help.zsh".source =
          "${configDir}/.config/zsh/functions/kb_help.zsh";
      }
      {
        ".config/lsd/config.yaml".source = "${configDir}/.config/lsd/config.yaml";
        ".config/lsd/icons.yaml".source = "${configDir}/.config/lsd/icons.yaml";
        ".config/lsd/colors.yaml".source = "${configDir}/.config/lsd/colors.yaml";
      }
    ];
  };
}
