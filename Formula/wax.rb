class Wax < Formula
  desc "Design-system component tracker CLI"
  homepage "https://github.com/Daio-io/wax"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Daio-io/wax/releases/download/v0.1.0-alpha.6/wax-0.1.0-alpha.6-aarch64-apple-darwin.tar.gz"
      sha256 "fd3ec88cea8070f323a2ef858e8f01d9fa4db3cfe1a71055c659c0794689d961"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Daio-io/wax/releases/download/v0.1.0-alpha.6/wax-0.1.0-alpha.6-x86_64-apple-darwin.tar.gz"
      sha256 "4124707a8caad013f727d7936f07ae8d912c9520d98d44575f44437d7d61f9c7"
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
