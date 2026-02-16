cask "rdkit-pg" do
  arch arm: "arm64"

  version "4.2.0"
  sha256 arm: "dc21cce37e26a95e3c308f8a9aff90dc18886f81fbfc2e000db9776d5bc4bdc1"

  homepage "https://github.com/uncountableinc/rdkit-pg-homebrew"
  url "https://github.com/uncountableinc/rdkit-pg-homebrew/releases/download/4.2.0-1/rdkit-pg_#{version}_#{arch}.zip"
  name "RDKit Postgresql Extension"
  desc "Installs the RDKit Postgresql Extension"

  depends_on macos: ">= :sequoia"
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
