Pod::Spec.new do |s|
  s.name             = 'gitlabclient'
  s.version          = '0.0.2'
  s.summary          = 'GitLab API client written in Swift'
  s.description      = <<-DESC
GitLab API Swift client.
                       DESC

  s.homepage         = 'https://gitlab.com/caramba/gitlabclient'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Caramba.io' => 'hello@caramba.io' }
  s.source           = { :git => 'https://gitlab.com/caramba/gitlabclient.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/carambalabs'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.source_files = 'gitlabclient/Classes/**/*'
  
  s.dependency 'Unbox', '~> 2.3'
  s.dependency 'Result', '~> 3.1'
  s.dependency 'HTTPStatusCodes', '~> 3.1'

  # s.resource_bundles = {
  #   'gitlabclient' => ['gitlabclient/Assets/*.png']
  # }

end
