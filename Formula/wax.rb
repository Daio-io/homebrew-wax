class Wax < Formula
  desc "Design-system component tracker CLI"
  homepage "https://github.com/Daio-io/wax"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Daio-io/wax/releases/download/v0.2.0-alpha.1/wax-0.2.0-alpha.1-aarch64-apple-darwin.tar.gz"
      sha256 "167cdf5bc7c75e5bf6e84ac595f417be4740eddc4eae0736903eb66bd4d49bd8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Daio-io/wax/releases/download/v0.2.0-alpha.1/wax-0.2.0-alpha.1-x86_64-apple-darwin.tar.gz"
      sha256 "5c126aa5504f7bd48d1414a3e8abb1514a09b7e357deec9deb8b16a5cf5d9b66"
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
