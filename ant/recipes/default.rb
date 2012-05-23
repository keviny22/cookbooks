include_recipe = "java"

ant_pkgs = value_for_platform(
  ["debian","ubuntu",] => {
    "default" => ["ant","ant-contrib"]
  },
  ["centos","redhat","fedora" ] => {
    "default" => ["ant","ant-contrib"]
  },
  "default" => ["ant","ant-contrib"]
)

ant_pkgs.each do |pkg|
  package pkg do
    action :install
  end
end
