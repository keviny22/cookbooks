region   = node['ec2']['placement_availability_zone'].chop
repo_url = node['intu']['package_repo_urls'].fetch region

yum_repository "intu-packages-#{region}" do
  description 'Intuit Custom RPM Packages'
  url repo_url
  action :add
end
