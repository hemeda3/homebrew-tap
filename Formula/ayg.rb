class Ayg < Formula
  desc "Indexed grep for large codebases — 1,000x faster than ripgrep on selective queries"
  homepage "https://github.com/hemeda3/aygrep"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/hemeda3/aygrep/releases/download/v0.1.0/ayg-macos-arm64"
      sha256 "8288034527cb46b881b8844f3b0ba889aebbb1be6768e5e04b8ddd429132d462"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/hemeda3/aygrep/releases/download/v0.1.0/ayg-linux-amd64"
      sha256 "2d8f592e0c2f66c1a995467784c6cbac4a5e64db2d7b17850b5c24e6092eecf1"
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "ayg-macos-arm64" => "ayg"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "ayg-linux-amd64" => "ayg"
    end
  end

  test do
    assert_match "ayg 0.1.0", shell_output("#{bin}/ayg --version")
  end
end
