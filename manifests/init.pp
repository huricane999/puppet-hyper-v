# Class: hyperv
# Initialize WDS
class hyperv(
  Boolean $install_feature     = $::hyperv::params::install_feature,
  String $ensure_service      = $::hyperv::params::ensure_service,
  Boolean $enable_service      = $::hyperv::params::enable_service,
  String $feature_name        = $::hyperv::params::feature_name,
) inherits hyperv::params {
  if $::osfamily == 'Windows' {
    anchor{'hyperv::begin':}
    -> class{'::hyperv::install':}
    #-> class{'::hyperv::config':}
    ~> class{'::hyperv::service':}
    -> anchor{'hyperv::end':}
  } else {
    fail { "This operating system family (${::osfamily}) is not supported.": }
  }
}
