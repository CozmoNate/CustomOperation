Pod::Spec.new do |s|
  s.name             = 'CustomOperation'
  s.version          = '1.2.1'
  s.summary          = 'Custom async Operation implementation in Swift'
  s.homepage         = 'https://github.com/kzlekk/AsyncOperation'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Natan Zalkin' => 'natan.zalkin@me.com' }
  s.source           = { :git => 'https://kzlekk@github.com/kzlekk/CustomOperation.git', :tag => "#{s.version}" }
  s.module_name      = 'CustomOperation'
  s.swift_version    = '5.0'

  s.ios.deployment_target = '10.0'
  s.osx.deployment_target = '10.12'
  s.watchos.deployment_target = '3.0'
  s.tvos.deployment_target = '10.0'

  s.source_files = 'CustomOperation/*.swift'

end
