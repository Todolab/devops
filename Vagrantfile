# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

settingsDir = File.expand_path(File.dirname(__FILE__) + '/.todolab-settings')

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
    abort "Homestead settings file not found in #{settingsDir}"
  end

  if Vagrant.has_plugin?("vagrant-hostsupdater")
    config.hostsupdater.aliases = settings['sites'].map { |site| site }
  end

  Todolab.configure(config, settings)


end
