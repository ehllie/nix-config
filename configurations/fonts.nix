# Font list

{ pkgs, ... }:
{
  fonts.fonts = with pkgs; [
    # Nerd Fonts
    cascadia-code
    nerdfonts
  ];
}
