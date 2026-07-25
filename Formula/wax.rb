# frozen_string_literal: true

require "tmpdir"

# Formula for the wax design-system analysis CLI.
class Wax < Formula
  desc "Design-system component tracker CLI"
  homepage "https://github.com/Daio-io/wax"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Daio-io/wax/releases/download/v0.6.0-alpha.2/wax-0.6.0-alpha.2-aarch64-apple-darwin.tar.gz"
      sha256 "edffa4137b0db6e07ad1815676abb1123eb750b8eee739b779165a66862e7276"
    end
    if Hardware::CPU.intel?
      url "https://github.com/Daio-io/wax/releases/download/v0.6.0-alpha.2/wax-0.6.0-alpha.2-x86_64-apple-darwin.tar.gz"
      sha256 "9d61e8f265f675d1d30027f432e32742b71c6e7aee3ef329ca80ae94c8d6ce39"
    end
  end

  def install
    bin.install "wax" => "wax"
  end

  def post_install
    Dir.mktmpdir("wax-language-refresh") do |repo_root|
      next if quiet_system bin/"wax", "language", "update", "--all", "--repo-root", repo_root

      opoo "Unable to refresh installed wax language packs after install. Run `wax language update --all` to retry."
    end
  rescue
    opoo "Unable to refresh installed wax language packs after install. Run `wax language update --all` to retry."
  end

  def caveats
    <<~EOS
      Language packs are not bundled with the CLI binary.

      After installing or upgrading wax, Homebrew makes a best-effort attempt
      to refresh already-installed language packs. If that refresh warns or
      cannot complete, run:
        wax language update --all

      After installing wax, run:
        wax init --non-interactive --language compose
        wax language install compose
    EOS
  end

  test do
    assert_match "wax", shell_output("#{bin}/wax --help")
  end
end
