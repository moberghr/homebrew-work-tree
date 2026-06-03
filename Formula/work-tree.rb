class WorkTree < Formula
  desc "Cross-platform Git worktree manager for multiple repositories"
  homepage "https://github.com/moberghr/cli-work-tree-manager"
  url "https://registry.npmjs.org/@moberg_hr/work-tree/-/work-tree-1.5.0.tgz"
  sha256 "9dd6fef6104c21e5308bdfe5e540edd3ae7bb61b0ddb6cc63c2457f0f9e71882"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/work --version")
  end
end
