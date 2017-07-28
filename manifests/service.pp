# Class hyperv::service
class hyperv::service inherits hyperv {
  service { 'vmms':
    ensure => $::hyperv::ensure_service,
    enable => $::hyperv::enable_service,
  }
}
