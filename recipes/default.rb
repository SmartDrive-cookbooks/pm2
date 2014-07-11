#
# Cookbook Name:: pm2
# Recipe:: default
#
# Copyright 2014, Yuki Osawa
#
# All rights reserved - Do Not Redistribute
#
# nvm install
include_recipe "nvm"

ndv = node["pm2"]["nodejs"]["version"]

nvm_nodejs ndv do
  alias_default_flag true
end

# pm2 install
nvm_npm "pm2" do
  nodejs_version ndv
  %w{version local_flag registry path}.each do |attr|
    send(attr, node["pm2"][attr]) if node["pm2"][attr]
  end
  action :install
end
