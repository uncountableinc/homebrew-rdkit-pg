cask "rdkit-pg" do
  arch arm: "arm64", intel: "i386"

  version "4.2.0"
  sha256 arm: "61b72b0eb3a242e692bf795ec3cda059387588352a7de1792978ceb6f3f342c3",
         intel: "53c125e040affb8b44ff963602b3d0c2f4978e244c38e3eb489b9acbff95f762"

  url "http://localhost:3000/rdkit-pg_#{version}_#{arch}.zip"
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
