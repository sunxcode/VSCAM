

platform :ios, '9.0'
use_frameworks!

target 'VSCAM' do
    pod 'RxSwift', '~> 3.0.1'                   # RxSwift
    pod 'RxCocoa', '~> 3.0.1'                   # RxCocoa
    pod 'SnapKit', '~> 3.0.1'                   # 约束
    pod 'Alamofire', '~> 4.0.1'                 # 网络
    pod 'SDWebImage', '~> 3.7.6'                # 图片加载
    pod 'JGProgressHUD', '~> 1.3.2'             # Loading
    pod 'MJRefresh', '~> 3.1.0'                 # 上拉/下拉刷新
    pod 'NJKWebViewProgress', '~> 0.2.3'        # WebView 进度条
    pod 'UMengAnalytics-NO-IDFA', '~> 4.1.5'    # UMeng 统计分析
    pod 'KMPlaceholderTextView', '~> 1.3.0'     # 带占位文字的多行编辑框
    pod 'SwiftMessages', '~> 3.0.3'             # 消息框
    pod 'LFRoundProgressView', '~> 1.0.0'       # 进度条
    pod 'Fabric'                                # 统计
    pod 'Crashlytics'                           # 错误分析
    #pod 'MBNetwork', '~> 0.4.0'					# 某知名网络库

    # 图片浏览依赖
    pod 'YLGIFImage', '= 0.11'
    pod 'SVProgressHUD', '~> 2.0.4'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
            config.build_settings['PROVISIONING_PROFILE_SPECIFIER'] = ''
        end
    end
end

