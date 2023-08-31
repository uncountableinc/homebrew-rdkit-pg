cask "rdkit-pg" do
  arch arm: "arm64", intel: "x86_64"

  version "4.2.0"
  sha256 arm: "a1014dfe43cab382ed43a3508c016cf2e7c6fce2ba9434b62d7a6c4d0903ae67",
         intel: "6a573967b90a014bceff7d67a6c979705b8d1694fd97344fe8e6c8d63d7d8875"

  homepage "https://github.com/uncountableinc/rdkit-pg-homebrew"
  url "https://github.com/uncountableinc/rdkit-pg-homebrew/releases/download/4.2.0/rdkit-pg_#{version}_#{arch}.zip"
  name "RDKit Postgresql Extension"
  desc "Installs the RDKit Postgresql Extension"

  depends_on macos: ">= :high_sierra"
  depends_on formula: "postgresql@13"

  def postgresql
    Formula["postgresql@13"]
  end

  installer script: {
    executable: "#{staged_path}/install/install.sh",
    args:       [postgresql.opt_bin, arch],
    sudo:       false,
  }

  uninstall script: {
    executable: "#{postgresql.opt_bin}/uninstall_rdkit.sh",
    args:       [postgresql.opt_bin],
    sudo:       false,
  }
end
