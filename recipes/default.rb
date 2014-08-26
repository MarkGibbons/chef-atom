#
# Cookbook Name:: chef-atom
# Recipe:: default
#
# Copyright (C) 2014 Mohit Sethi <mohit@sethis.in>
#
#
case node['platform_family']
when 'windows'
  include_recipe 'chocolatey'
  chocolatey 'atom'
when 'debian', 'ubuntu'
  # Add ppa
  include_recipe 'apt'
  apt_repository 'atom-ppa' do
    uri            'http://ppa.launchpad.net/webupd8team/atom/ubuntu'
    distribution   node['lsb']['codename']
    components     ['main']
    keyserver      'keyserver.ubuntu.com'
    key            'EEA14886'
  end
  package 'atom'
end