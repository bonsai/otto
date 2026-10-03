param(
  [string]$Source = ".",
  [string]$Domain = "kana-synth.surge.sh"
)

# otto — Surge deploy
# Example:
#   .\deploy.ps1 -Source ..\kana -Domain kana-synth.surge.sh

npx surge $Source $Domain
