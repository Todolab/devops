# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

settingsDir = File.expand_path(File.dirname(__FILE__) + '/.settings')

TodolabYamlPath = settingsDir + '/Todolab.yaml'

# Load todolab.rb class
require File.expand_path(File.dirname(__FILE__) + '/scripts/todolab.rb')

Vagrant.require_version '>= 1.9.1'




# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  settings = nil
  if File.exist? TodolabYamlPath then
    settings = YAML::load(File.read(TodolabYamlPath))
  else
    abort "Todolab settings file not found in #{settingsDir}"
  end

  if Vagrant.has_plugin?("vagrant-hostmanager")
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.hostmanager.manage_guest = true
    config.hostmanager.ignore_private_ip = false
    config.hostmanager.include_offline = true
    config.vm.define settings['name'] do |node|
      node.vm.hostname = settings["hostname"] ||= "todolab"
      node.vm.network :private_network, ip: settings['ip']
      node.hostmanager.aliases = settings['sites']
    end
  end


  if Vagrant.has_plugin?("vagrant-proxyconf")
    config.proxy.enabled = { apt: false }
    config.proxy.http = settings['proxy']['http']
    config.proxy.https = settings['proxy']['https']
    config.proxy.no_proxy = settings['proxy']['no_proxy'].join(',')
  end

  Todolab.configure(config, settings)
end
