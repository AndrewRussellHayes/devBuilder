class DevBuilder < Formula
#used docker as example

  desc "Pack, ship and run any application as a lightweight container"
  homepage "https://www.andrewhay.es/devbuilder/"
  url "https://github.com/AndrewRussellHayes/devBuilder.git",
      :tag => "v0.0.1",
      :revision => "92763826e5ef98404d308c1652491e246dcbf6a4"

  depends_on "go" => :build

#  if build.with? "experimental"
#    depends_on "libtool" => :run
#    depends_on "yubico-piv-tool" => :recommended
#  end

  def install
    ENV["GOPATH"] = buildpath
    dir = buildpath/"src/github.com/AndrewRussellHayes/devBuilder"
    cd dir do
      system "go", "build",  "github.com/AndrewRussellHayes/devBuilder/main.go"

      #if build.with? "completions"
      #  bash_completion.install "contrib/completion/bash/devBuilder"
      #  fish_completion.install "contrib/completion/fish/devBuilder.fish"
      #  zsh_completion.install "contrib/completion/zsh/_devBuilder"
      #end
    end
  end

	#TODO: write a --version flag command so you can test with this call
  #test do
  #  system "#{bin}/docker", "--version"
  #end
end
