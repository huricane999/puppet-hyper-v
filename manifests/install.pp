# Class hyperv::install
class hyperv::install inherits hyperv {
  if $::hyperv::install_feature {
    exec { "Install ${::hyperv::feature_name}":
      command  => "Install-WindowsFeature -Name '${::hyperv::feature_name}' -IncludeAllSubFeature -IncludeManagementTools",
      unless   => "if((Get-WindowsFeature '${::hyperv::feature_name}').Installed){exit 1}",
      provider => powershell,
    }
  }
}
