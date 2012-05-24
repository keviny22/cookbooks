case node[:platform_version]
when "6.2"
  default['ruby']['url'] = 'https://s3.amazonaws.com/cto-baseline-rhel6/intu-ruby-1.9.3-p125.el6.x86_64.rpm'
  default['ruby']['libyaml']['url'] = 'https://s3.amazonaws.com/cto-baseline-rhel6/libyaml-0.1.3-1.el6.x86_64.rpm'
end
