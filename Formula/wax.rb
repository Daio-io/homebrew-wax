class Wax < Formula
  desc "Design-system component tracker CLI"
  homepage "https://github.com/Daio-io/wax"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Daio-io/wax/releases/download/v0.1.0-alpha.3/wax-0.1.0-alpha.3-aarch64-apple-darwin.tar.gz"
      sha256 "1074f5399f57e663772562e8552180a27dbc3e30c720d3d96f3e49b73400abd2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Daio-io/wax/releases/download/v0.1.0-alpha.3/wax-0.1.0-alpha.3-x86_64-apple-darwin.tar.gz"
      sha256 "e170b59c313d301fac7f3604d813863dd1d801977618e5a769bfb675fab95c46"
    end
  end

  def install
    bin.install "wax" => "wax"
  end

  def caveats
    <<~EOS
      Language packs are not bundled with the CLI binary.

      After installing wax, run:
        wax init --non-interactive --language compose
        wax language install compose
    EOS
  end

  test do
    assert_match "wax", shell_output("#{bin}/wax --help")
  end
end
