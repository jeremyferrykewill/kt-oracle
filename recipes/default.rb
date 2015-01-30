#
# Cookbook Name:: kt-oracle
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
yum_package "perl"
yum_package "gcc"
yum_package "bc"
yum_package "unzip"
yum_package "libaio"
yum_package "java-1.7.0-openjdk"


src_rpm  = "oracle-xe-11.2.0-1.0.x86_64.rpm"
src_filename  = "#{src_rpm}.zip"
src_filepath = "#{Chef::Config['file_cache_path']}/#{src_filename}"

remote_file src_filepath do
  source "http://ktwiki.kewill.com/files/#{src_filename}"
  action :create_if_missing
end

bash 'install_oracle' do
  cwd ::File.dirname(src_filepath)
  code <<-EOH
    unzip -q #{src_filename}
    cd Disk1
    rpm -ivh #{src_rpm}
    EOH
  not_if { ::File.exists?("/u01/app/oracle/product/11.2.0/xe/") }
end

#bash 'configure_oracle' do
#  cwd ::File.dirname(src_filepath)
#  code <<-EOH
#    /etc/init.d/oracle-xe configure
#    
#    
#    oracle
#    oracle
#    y
#    EOH
#end