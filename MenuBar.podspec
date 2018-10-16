
Pod::Spec.new do |s|

  s.name = 'MenuBar'
  s.version = '1.0.0'
  s.swift_version = '4.2'
  s.summary = 'A declarative wrapper to easily define your MenuBar'
  s.homepage = 'https://github.com/igormuzyka/MenuBar'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.author = { 'igormuzyka' => 'igormuzyka42@gmail.com' }
  s.source = { :git => 'https://github.com/igormuzyka/MenuBar.git', :tag => s.version.to_s }
  s.source_files = 'Sources/*'

  s.osx.deployment_target = "10.10"


end
