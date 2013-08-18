#
# Cookbook Name:: postfix
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "postfix"


service "postfix" do
  supports :status => true, :restart => true, :reload => true
  action :enable
end

%w{main master}.each do |cfg|

  template "/etc/postfix/#{cfg}.cf" do
    source "#{cfg}.cf.erb"
    owner "root"
    group 0
    mode 00644
    notifies :restart, "service[postfix]"

  end
end

service "postfix" do
  action :start
end
