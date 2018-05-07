Pod::Spec.new do |s|
  s.name             = 'JSSideBar'
  s.version          = '0.1.0'
  s.summary          = 'Simple view that helps to jump UITableView subclasses'
 
  s.description      = <<-DESC
A simple jumpable view
                       DESC
 
  s.homepage         = 'https://github.com/jseidman95/JSSideBar'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jesse Seidman' => 'jseidman95@yahoo.com' }
  s.source           = { :git => 'https://github.com/jseidman95/JSSideBar.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '9.0'
  s.swift_version = '4.0'
  s.source_files = 'JSSideBar/*.swift'
 
end
