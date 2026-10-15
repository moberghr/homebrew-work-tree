class Work < Formula
  desc "Cross-platform Git worktree manager for multiple repositories"
  homepage "https://github.com/moberghr/cli-work-tree-manager"
  # Points at the published npm tarball. After `npm publish`, update both the
  # version in the URL and the sha256 (see packaging/homebrew/README.md).
  url "https://registry.npmjs.org/@moberg_hr/work-tree/-/work-tree-2.2.1.tgz"
  sha256 "a2c08a6f4d27d8ae188547e0874865dffcdce80d22da96e7a122ea1bf9af69e9"
  license "MIT"

  depends_on "node"

  def install
    # npm >= 11.19 skips dependency install scripts unless allow-listed, which
    # leaves better-sqlite3 unbuilt and node-pty's spawn-helper non-executable.
    system "npm", "install", *std_npm_args, "--allow-scripts=better-sqlite3,node-pty"
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/work --version")
  end
end
