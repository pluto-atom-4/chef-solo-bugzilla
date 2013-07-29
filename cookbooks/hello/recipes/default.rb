#
# Cookbook Name:: hello
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
log "Hello Chef!"
#
#
%w{zsh perl mysql-client mysql-server}.each do |pkg|
	package pkg  do
		action :install 
	end
end
#
user "bugzilla" do 
   supports :manage_home => true
   comment "Bugzilla User"
   home    "/home/bugzilla"
   shell   "/bin/zsh"
   password "$1$uwjCOPnd$1DIZ3LzS5fwAnuFFRS2BY/"
end
#
#directory "/home/bugzilla" do
#   owner "bugzilla"
#   group "bugzilla"
#   mode  "0755" 
#   action :create
#end
