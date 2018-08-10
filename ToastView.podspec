
Pod::Spec.new do |s|


  s.name         = "ToastView"
  s.version      = "0.0.5"
  s.summary      = "提示语"

  s.description  = <<-DESC
                    提示语功能组件
                   DESC

  s.homepage     = "https://github.com/398967541/ToastView"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author             = { "ALexTun" => "398967541@qq.com" }
  # Or just: s.author    = "ALexTun"
  # s.authors            = { "ALexTun" => "398967541@qq.com" }

  s.source       = { :git => "https://github.com/398967541/ToastView.git", :tag => s.version }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  s.source_files  = 'ToastView/*'

  # s.public_header_files = "Classes/**/*.h"
  s.requires_arc = true

    s.platform     = :ios
    s.ios.deployment_target = '8.0'
end
