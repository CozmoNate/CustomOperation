Pod::Spec.new do |s|
  s.name             = 'AsyncOperation'
  s.version          = '1.0.1'
  s.summary          = 'Custom async Operation implementation in Swift'
  s.homepage         = 'https://github.com/kzlekk/AsyncOperation'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Natan Zalkin' => 'natan.zalkin@me.com' }
  s.source           = { :git => 'https://github.com/kzlekk/AsyncOperation', :tag => "#{s.version}" }
  s.module_name      = 'AsyncOperation'
  s.swift_version    = '5.0'

  s.ios.deployment_target = '10.0'
  s.osx.deployment_target = '10.12'
  s.watchos.deployment_target = '3.0'
  s.tvos.deployment_target = '10.0'

  s.source_files = 'AsyncOperation/*.swift'

end
