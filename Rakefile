require 'rake'
require 'rubygems'
require 'chef'
require 'rubocop/rake_task'
require 'foodcritic'

# Set the url to the box you want to use as a starter template.
# You can also use a local file url like: `file://path-to-local-box.box`
ENV['INPUT_BOX_URL'] = 'https://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_ubuntu-14.04_chef-provisionerless.box'

# Set build path to a directory outside the cookbook project.
ENV['BUILD_PATH'] = '../builds/'

# The private IP address which the 7-Iron box should use.
ENV['BOX_IP'] = '192.168.33.33'

# Shorthand to a 7-Iron box in HashiCorp's Atlas
ENV['BOX_NAME'] = 'seanbuscay/7-Iron'

# Nothing else below needs changed.

# Detect and set the absolute path to the project.
ENV['PROJECT_PATH'] = Dir.pwd

ENV['BUILD_INPUT'] = ENV['BUILD_PATH'] + 'input/'
ENV['BUILD_OUTPUT'] = ENV['BUILD_PATH'] + 'output/'
# For Berks to vendor cookbooks into during packer build.
ENV['COOKBOOKS'] = ENV['BUILD_PATH'] + 'cookbooks/'

ENV['SPECS_PATH'] = 'test/integration/default/serverspec/'
ENV['RECIPES_PATH'] = 'recipes/'
ENV['README_ERB'] = 'templates/dev/README.md.erb'
ENV['SPEC_ERB'] = 'templates/dev/starter_spec.rb.erb'
ENV['RECIPE_ERB'] = 'templates/dev/starter_recipe.rb.erb'
ENV['RELEASE_ERB'] = 'templates/dev/release_tag.erb'
ENV['VAGRANTFILE_ERB'] = 'templates/dev/Vagrantfile.erb'
ENV['VAGRANTFILE_TPL'] = ENV['BUILD_PATH'] + 'Vagrantfile'

task default: [:la]

desc 'Lists all Rake tasks.'
task :list do
  puts "Tasks: \n- #{(Rake::Task.tasks).join("\n- ")}"
end

desc 'Lists all Rake tasks and descriptions.'
task :la do
  puts `rake -T`
end

desc 'Build 7-Iron Vagrant Box and put it in the build directory.'
task build: ['clean_kitchen', 'set:all', 'make:buildpaths', 'make:vagrantfile', 'make:readme', 'make:docs', 'make:cookbooks', 'make:ovf', 'packer:validate'] do
  Rake::Task['packer:build'].execute
  puts '[Built] clean Vagrant Box for deploy'
end

task :clean_kitchen do
  sh 'kitchen destroy'
  FileUtils.remove_dir('.kitchen') if File.exist?('.kitchen')
  puts ['[RAN] kitchen destroy and removed .kitchen directory']
end

namespace :set do
  desc 'Set all vars.'
  task all: ['set:version', 'set:git_vars', 'set:releasetag'] do
    puts '[SETTING] All vars.'
  end

  desc 'Set cookbook version from metadata.rb'
  task :version do
    require 'chef/cookbook/metadata'
    metadata_file = 'metadata.rb'
    # read in metadata
    metadata = Chef::Cookbook::Metadata.new
    metadata.from_file(metadata_file)
    # output cookbook version
    ENV['TAG'] = "#{metadata.version}"
    puts '[SET] Cookbook version to: ' + ENV['TAG']
  end
  desc 'Get branch and revision from git.'
  task :git_vars do
    # Set git branch and revision to use for the build filename.
    git_branch = `git rev-parse --abbrev-ref HEAD`
    ENV['BRANCH'] = git_branch.strip
    git_rev = `git rev-parse --short HEAD`
    ENV['REV'] = git_rev.strip
    # If any git variable is not present or detected, then set generic defaults.
    ENV['BRANCH'] = 'nobranch' if ENV['BRANCH'] == ''
    ENV['REV'] = '0' if ENV['REV'] == ''
    puts '[SET] Git vars for build. Branch = ' +  ENV['BRANCH'] + ' Revision = ' + ENV['REV']
  end
  desc 'Set Release Tag.'
  task releasetag: ['set:version'] do
    vtag = ENV['TAG']
    require 'erb'
    require 'ostruct'
    namespace = OpenStruct.new(releasetag: vtag)
    template = ENV['RELEASE_ERB']
    erb = ERB.new(File.read(template))
    results = erb.result(namespace.instance_eval { binding })
    filename = 'documentation/release_tag.txt'
    File.open(filename, 'w') { |file| file.write(results) }
    puts '[SET] Release tag file to: ' + vtag
  end
end

namespace :make do
  desc 'Make README.md'
  task readme: ['set:releasetag'] do
    sh "knife cookbook doc . --template #{ENV['README_ERB']}"
    puts '[MADE] README.md'
    vtag = ENV['TAG']
    require 'erb'
    require 'ostruct'
    namespace = OpenStruct.new(reltag: vtag)
    template = 'README.md'
    erb = ERB.new(File.read(template))
    results = erb.result(namespace.instance_eval { binding })
    filename = 'README.md'
    File.open(filename, 'w') { |file| file.write(results) }
    puts '[MADE] README.md with tag:' + vtag
    FileUtils.cp_r 'README.md', 'documentation/cookbook-guide/index.md', remove_destination: true
    puts '[MADE] documentation/cookbook-guide/index.md with tag:' + vtag
  end
  desc 'Make documentation'
  task docs: ['set:releasetag', 'make:readme'] do
    Dir.chdir 'documentation'
    sh 'mkdocs build --clean'
    Dir.chdir "#{ENV['PROJECT_PATH']}"
    puts '[MADE] documentation.'
  end
  desc 'Make documentation server'
  task docs_server: ['set:releasetag', 'make:readme'] do
    puts '[NOTE] If you need to keep using rake while running the server, you should start this command in a new terminal window.'
    Dir.chdir 'documentation'
    sh 'mkdocs serve'
    puts '[MADE] documentation server at: http://127.0.0.1:8000/'
  end
  desc 'Make Berks vendor cookbooks directory for packer build.'
  task cookbooks: ['make:docs'] do
    FileUtils.remove_dir("#{ENV['COOKBOOKS']}") if File.exist?("#{ENV['COOKBOOKS']}")
    sh "berks vendor #{ENV['COOKBOOKS']}"
    puts "[MADE] #{ENV['COOKBOOKS']}"
  end
  desc 'Make build paths.'
  task :buildpaths do
    FileUtils.mkdir_p("#{ENV['BUILD_PATH']}") unless File.exist?("#{ENV['BUILD_PATH']}")
    FileUtils.mkdir_p("#{ENV['BUILD_INPUT']}") unless File.exist?("#{ENV['BUILD_INPUT']}")
    FileUtils.mkdir_p("#{ENV['BUILD_OUTPUT']}") unless File.exist?("#{ENV['BUILD_OUTPUT']}")
    puts "[MADE/VERIFIED] build paths under #{ENV['BUILD_PATH']}"
  end
  desc 'Make Vagrantfile.'
  task vagrantfile:  ['set:version', 'set:git_vars', 'make:buildpaths'] do
    boxip = ENV['BOX_IP']
    boxname = ENV['BOX_NAME']
    vtag = ENV['TAG']
    btime = Time.now.asctime
    branch = ENV['BRANCH']
    rev = ENV['REV']
    require 'erb'
    require 'ostruct'
    namespace = OpenStruct.new(ip: boxip, name: boxname, version: vtag, branch: branch, buildrev: rev, buildtime: btime)
    template = ENV['VAGRANTFILE_ERB']
    erb = ERB.new(File.read(template))
    results = erb.result(namespace.instance_eval { binding })
    filename = "#{ENV['VAGRANTFILE_TPL']}"
    File.open(filename, 'w') { |file| file.write(results) }
    puts '[Generated] Vagrantfile template: ' + filename + ' with tag:' + vtag
  end
  desc 'Make virtualbox-ovf for packer to build from.'
  task :ovf do
    unless File.exist?("#{ENV['BUILD_INPUT']}box.ovf")
      puts "[DOWNLOAD] #{ENV['INPUT_BOX_URL']}"
      require 'open-uri'
      open("#{ENV['BUILD_INPUT']}box", 'wb') do |file|
        file << open("#{ENV['INPUT_BOX_URL']}").read
        puts "[Downloaded] #{ENV['INPUT_BOX_URL']} to #{ENV['BUILD_INPUT']}"
      end
      Dir.chdir "#{ENV['BUILD_INPUT']}"
      sh 'tar -xvf box'
      sh 'rm box'
      sh 'rm Vagrantfile'
      sh 'rm metadata.json'
      puts "[Built] #{ENV['BUILD_INPUT']}box.ovf"
      Dir.chdir "#{ENV['PROJECT_PATH']}"
    else
      puts "[NOTICE] Using the already existing file: #{ENV['BUILDS_INPUT']}box.ovf"
    end
  end
end

namespace :style do
  desc 'Run Ruby style checks'
  RuboCop::RakeTask.new(:ruby)
  desc 'Run Chef style checks'
  FoodCritic::Rake::LintTask.new(:chef) do |t|
    t.options = {
      fail_tags: ['any']
    }
  end
end

desc 'Run all style checks'
task lint: ['style:chef', 'style:ruby']

namespace :packer do
  desc 'Validate Packer template'
  task validate: ['set:git_vars'] do
    puts '[Validate] Packer template'
    sh "packer validate -var branch=#{ENV['BRANCH']} -var rev=#{ENV['REV']} -var input=#{ENV['BUILD_INPUT']} -var output=#{ENV['BUILD_OUTPUT']} -var cookbooks=#{ENV['COOKBOOKS']} -var vagrantfiletpl=#{ENV['VAGRANTFILE_TPL']} packer.json"
    puts '[Validated] Packer template'
  end
  desc 'Inspect Packer template'
  task :inspect do
    sh 'packer inspect packer.json'
  end
  desc 'Build from Packer template'
  task build: ['set:git_vars'] do
    puts '[Build] from Packer template'
    sh "packer build --force -var branch=#{ENV['BRANCH']} -var rev=#{ENV['REV']} -var input=#{ENV['BUILD_INPUT']} -var output=#{ENV['BUILD_OUTPUT']} -var cookbooks=#{ENV['COOKBOOKS']} -var vagrantfiletpl=#{ENV['VAGRANTFILE_TPL']} packer.json"
    puts '[Built] from Packer template'
  end
end

namespace :add do
  require 'erb'
  require 'ostruct'

  desc 'Add new spec file: Usage `rake add:spec name="Test Name" desc="Test Description"`'
  task :spec do
    if ENV['name']
      name = ENV['name']
      desc = ENV['desc']
      namespace = OpenStruct.new(test_name: name, test_desc: desc)
      template = ENV['SPEC_ERB']
      erb = ERB.new(File.read(template))
      results = erb.result(namespace.instance_eval { binding })
      filename = ENV['SPECS_PATH'] + name.downcase.strip.gsub(' ', '_').gsub(/[^\w-]/, '') + '_spec.rb'
      File.open(filename, 'w') { |file| file.write(results) }
      puts "[Added] new spec here: #{filename}"
    else
      puts 'Please pass a name like this: rake add:spec name="New Feature"'
    end
  end

  desc 'Add new recipe file: Usage `rake add:recipe name="Recipe Name"`'
  task :recipe do
    if ENV['name']
      name = ENV['name']
      namespace = OpenStruct.new(recipe_name: name)
      template = ENV['RECIPE_ERB']
      erb = ERB.new(File.read(template))
      results = erb.result(namespace.instance_eval { binding })
      filename = ENV['RECIPES_PATH'] + name.downcase.strip.gsub(' ', '_').gsub(/[^\w-]/, '') + '.rb'
      File.open(filename, 'w') { |file| file.write(results) }
      puts "[Added] new recipe here: #{filename}"
    else
      puts 'Please pass a name like this: rake add:recipe name="New Recipe"'
    end
  end

end
