# Development tools configurations
{ pkgs, ... }: 
{
  # Gradle configurations
  programs.gradle = {
    enable = true;
    package = pkgs.gradle_8;
    settings = {
      "org.gradle.home" = pkgs.jdk17;
    };
  };

  # Java configurations
  programs.java = {
    enable = true;
    package = pkgs.jdk17;
  };
}
