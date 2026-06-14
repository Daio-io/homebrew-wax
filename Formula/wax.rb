class Wax < Formula
  desc "Design-system component tracker CLI"
  homepage "https://github.com/Daio-io/wax"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Daio-io/wax/releases/download/v0.1.0-alpha.9/wax-0.1.0-alpha.9-aarch64-apple-darwin.tar.gz"
      sha256 "59eba873afd0c0ff0cd971a17d10f51e54b28e86c9f666ab8a21a0f21a3a61dc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Daio-io/wax/releases/download/v0.1.0-alpha.9/wax-0.1.0-alpha.9-x86_64-apple-darwin.tar.gz"
      sha256 "0d51239c68ce90b5edf4b2238f5b58b9f0fe9d9925e85c32d3d8616d409fbc38"
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
