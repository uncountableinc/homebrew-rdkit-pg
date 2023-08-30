cask "rdkit-pg" do
  arch arm: "arm64", intel: "x86_64"

  version "4.2.0"
  sha256 arm: "1263e646b83012052fb1e70aa78fc5c951158322d12d38ed90613267123ae677",
         intel: "d86b9f544343b7ed7897bba9db9bfa9bb6d774a9921ba733919771d54b21782c"

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
