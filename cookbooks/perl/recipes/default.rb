#
# Cookbook Name:: perl
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w{ perl libperl-dev }.each do |perl_pkg|
	package perl_pkg
end

remote_file '/usr/local/bin/cpanm' do
	source 'https://raw.github.com/miyagawa/cpanminus/1.5015/cpanm'
	checksum '8cb7b62b55a3043c4ccb'
	owner "root"
	group "root"
	mode 0755
end

%w{ CGI Date::Format DateTime DateTime::TimeZone DBI DBD::mysql Digest::SHA Email::Send Email::MIME Template URI }.each do |mdl|
	cpan_module mdl 
end
