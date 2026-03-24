class Ayg < Formula
  desc "Indexed grep for large codebases — 13,806x faster than ripgrep"
  homepage "https://github.com/hemeda3/aygrep"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hemeda3/aygrep/releases/download/v0.1.0/ayg-macos-arm64"
      sha256 "2230156ab3e1284aa783515fb074059ec3648751ab00c227f94f1e1dffb44c92"
    end
    on_intel do
      url "https://github.com/hemeda3/aygrep/releases/download/v0.1.0/ayg-macos-amd64"
      sha256 "89a895e1e14876f05b00d0ad29a24f231f831c82adce9ea148fa9149fe4ac286"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hemeda3/aygrep/releases/download/v0.1.0/ayg-linux-amd64"
      sha256 "ad2b5fa76a02eb2c3b3cc51da09cdda1ca3f1a617314fd17453f1adc3c6a5dad"
    end
  end

  def install
    bin.install Dir["ayg-*"].first => "ayg"
  end

  test do
    assert_match "ayg 0.1.0", shell_output("#{bin}/ayg --version")
  end
end
