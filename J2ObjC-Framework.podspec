#
#  Be sure to run `pod spec lint J2ObjC-Framework.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "J2ObjC-Framework"
  spec.version      = "2.5"
  spec.summary      = "Integrates the pre-built J2ObjC frameworks into your project"
  spec.description  = <<-DESC
  Downloads the j2objc release and integrates the frameworks into your project.
                   DESC

  current_folder = File.dirname(__FILE__)

  spec.homepage     = "https://github.com/dmorozov/J2ObjC-Framework"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  spec.license      = { :type => "MIT", :file => "#{current_folder}/LICENSE" }
  spec.author       = { 'Denis Morozov' => 'den.morozov@gmail.com' }
  spec.source       = { :git => "https://github.com/dmorozov/J2ObjC-Framework.git" }

  spec.static_framework = true
  spec.requires_arc = false

  spec.prepare_command = <<-CMD
    #{current_folder}/scripts/install_from_local.sh
  CMD

  spec.platform = :ios
  spec.ios.deployment_target = "10.0"

  # spec.frameworks = 'Security'
  # spec.osx.frameworks = 'ExceptionHandling'
  # spec.preserve_paths = 'dist'
  # spec.default_subspec = 'all'

  # spec.subspec 'all' do |all|
  #   all.dependency "#{spec.name}/JRE"
  #   all.dependency "#{spec.name}/JSR305"
  # end

  # spec.subspec 'JRE' do |jre|
  #   jre.vendored_frameworks = "dist/frameworks/JRE.framework"
  #   jre.ios.framework = 'UIKit'
  #   jre.osx.frameworks = 'AppKit'
  #   jre.libraries = 'z', 'icucore', 'iconv'

  #   xcconfig_entry = {
  #     "HEADER_SEARCH_PATHS" => "\"${PODS_ROOT}/#{spec.name}/dist/frameworks/JRE.framework/Headers\""
  #   }
  #   jre.xcconfig = xcconfig_entry
  #   jre.pod_target_xcconfig = xcconfig_entry
  # end

  # spec.subspec 'JSR305' do |jsr305|
  #   jsr305.dependency "#{spec.name}/JRE"
  #   jsr305.vendored_frameworks = "dist/frameworks/JSR305.framework"

  #   xcconfig_entry = {
  #     "HEADER_SEARCH_PATHS" => "\"${PODS_ROOT}/#{spec.name}/dist/frameworks/JSR305.framework/Headers\""
  #   }
  #   jsr305.xcconfig = xcconfig_entry
  #   jsr305.pod_target_xcconfig = xcconfig_entry
  # end

  spec.preserve_paths = 'dist/**/*'
  spec.public_header_files = 'dist/include/**/*.h'
  spec.source_files = 'dist/include/**/*.h'
  spec.header_mappings_dir = 'dist/include'

  spec.libraries = 'jre_emul', 'icucore', 'z', 'iconv'
  spec.vendored_libraries = 'dist/lib/libjre_emul.a'

  #spec.xcconfig = { 
    # 'HEADER_SEARCH_PATHS' => '${PODS_ROOT}/../../J2ObjC-Framework/dist/include',
    # 'LIBRARY_SEARCH_PATHS' => '$(PODS_ROOT)/../../J2ObjC-Framework/dist/lib',
    # 'HEADER_SEARCH_PATHS' => "#{current_folder}/dist/include",
    # 'LIBRARY_SEARCH_PATHS' => "#{current_folder}/dist/lib",
  #}

  spec.frameworks = 'Security'
  spec.ios.framework  = 'UIKit'
  spec.osx.frameworks = 'AppKit', 'ExceptionHandling'

  # spec.xcconfig = {
  #   'HEADER_SEARCH_PATHS' => '${PODS_ROOT}/J2ObjC-Framework/dist/include',
  # }
  spec.ios.xcconfig = {
    'LIBRARY_SEARCH_PATHS' => '${PODS_ROOT}/J2ObjC-Framework/dist/lib'
  }
  spec.osx.xcconfig = {
    'LIBRARY_SEARCH_PATHS' => '${PODS_ROOT}/J2ObjC-Framework/dist/lib/macosx'
  }
  spec.watchos.xcconfig = {
    'LIBRARY_SEARCH_PATHS' => '${PODS_ROOT}/J2ObjC-Framework/dist/lib'
  }  
end
