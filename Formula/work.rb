class Work < Formula
  desc "Cross-platform Git worktree manager for multiple repositories"
  homepage "https://github.com/moberghr/cli-work-tree-manager"
  # Points at the published npm tarball. After `npm publish`, update both the
  # version in the URL and the sha256 (see packaging/homebrew/README.md).
  url "https://registry.npmjs.org/@moberg_hr/work-tree/-/work-tree-2.5.1.tgz"
  sha256 "2884a50d99bda2e032c3a729f774381fdc8a071c83a541e03ed3afb0314ebbdc"
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
