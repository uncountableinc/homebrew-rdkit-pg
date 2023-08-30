cask "rdkit-pg" do
  arch arm: "arm64", intel: "x86_64"

  version "4.2.0"
  sha256 arm: "49bb46238015a6a14ab34ece00c071d619d3a099c6b032d261ae06215f713326",
         intel: "93fa0b8cd8e82de6185a0712d726d24930060c38c9401daba3d0a6ce93ab524d"

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
