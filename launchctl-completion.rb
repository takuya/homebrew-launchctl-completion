# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/homebrew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class LaunchctlCompletion < Formula
  desc "Bash completion for launchctl"

  url "https://github.com/bobthecow/launchctl-completion",
    :revision => "f83bfbaa569d16f4951bae16aebff64fa498dfc7"
  
  sha256 "d10f4e21a4faebafcc781b2d0a423a0412776b6c5f45f3abfc541664e0829f8a"
	
	head "https://github.com/bobthecow/launchctl-completion.git"

  depends_on "bash-completion" # if your formula requires any X11/XQuartz components

  bottle :unneeded

  def install
    bash_completion.install "launchctl-completion.bash" => "launchctl"
  end

  test do
    assert_match "-F __bundle",
      shell_output("source #{bash_completion}/bundler && complete -p launchctl")
  end
end
