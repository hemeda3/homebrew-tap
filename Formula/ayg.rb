class Ayg < Formula
  desc "Indexed grep for large codebases — 1,000x faster than ripgrep on selective queries"
  homepage "https://github.com/hemeda3/aygrep"
  url "https://github.com/hemeda3/aygrep/archive/refs/heads/main.tar.gz"
  version "0.1.0"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release"
    bin.install "target/release/ayg"
  end

  test do
    mkdir "test-repo" do
      system "git", "init"
      system "git", "config", "user.email", "test@test.com"
      system "git", "config", "user.name", "Test"
      (testpath/"test-repo/test.rs").write('fn main() { println!("hello"); }')
      system "git", "add", "."
      system "git", "commit", "-m", "init"
      system bin/"ayg", "build", ".", "--no-content"
      output = shell_output("#{bin}/ayg search println 2>&1")
      assert_match "hello", output
    end
  end
end
