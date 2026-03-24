class Ayg < Formula
  desc "Indexed grep for large codebases — 13,806x faster than ripgrep"
  homepage "https://github.com/hemeda3/aygrep"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hemeda3/aygrep/releases/download/v0.1.0/ayg-macos-arm64"
      sha256 "38a145eba5e49ee831b83dac4c3022c4aef220d401f21318b84c8b87f267dd45"
    end
    on_intel do
      url "https://github.com/hemeda3/aygrep/releases/download/v0.1.0/ayg-macos-amd64"
      sha256 "28b186e3a8ba5f1e8c2d1c990c6ff9b82f5e1f748d35732f55d6f91b9e37fb21"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hemeda3/aygrep/releases/download/v0.1.0/ayg-linux-amd64"
      sha256 "76dcb9f9d231ce3b762425869b35ff575c5e79507a666ca398d0d98743f8bb09"
    end
  end

  def install
    bin.install Dir["ayg-*"].first => "ayg"
  end

  test do
    assert_match "ayg", shell_output("#{bin}/ayg --version")
  end
end
