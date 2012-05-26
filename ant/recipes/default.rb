include_recipe = 'java'

["ant","ant-contrib"].each do |pkg|
  package pkg do
    action :install
    version node[pkg]['version']
  end
end
