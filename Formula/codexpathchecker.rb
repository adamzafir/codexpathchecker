class Codexpathchecker < Formula
  desc "Warn before running codex in the wrong working directory"
  homepage "https://github.com/adamzafir/codexpathchecker"
  url "https://github.com/adamzafir/codexpathchecker/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "fb8e222af8ead9d0d3ddbc8aeebf0790ba8b0fcc28dfe0648c215864a7695078"
  license "MIT"
  head "https://github.com/adamzafir/codexpathchecker.git", branch: "main"

  def install
    bin.install "bin/codexpathchecker"
    libexec.install "libexec/codexpathchecker.zsh"
  end

  test do
    output = shell_output("#{bin}/codexpathchecker status")
    assert_match "Not installed", output
  end
end
