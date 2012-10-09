['sqlite', 'sqlite-devel'].each do |pkg|
  package pkg do
    version node[pkg]["version"]
  end
end
