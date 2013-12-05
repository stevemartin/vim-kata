require './lib/kata_chapter'

task :default => :build

desc 'Build Katas from sources'
task :build do
  FileUtils.rm_rf('build')
  Dir.glob('src/sections.yml').each do |chapter|
    puts "building #{chapter}"
    KataChapter.new(chapter).build
  end
end
namespace :refactoring do
  task :prepare_vimfiles do

    time = Time.now.to_i
    vim_orig_exists = File.exists? File.expand_path '~/.vim-orig'
    vim_orig_rc_exists = File.exists? File.expand_path '~/.vimrc-orig'

    if vim_orig_exists and vim_orig_rc_exists
      p "You have already run this"
    else
      Kernel.system("mv ~/.vim ~/.vim-orig")
      # Kernel.system("cp -r ~/.vim-orig ~/.vim-orig-#{time}")
      Kernel.system("cp -r src/refactoring/vim ~/.vim")

      Kernel.system("mv ~/.vimrc ~/.vimrc-orig")
      # Kernel.system("cp ~/.vimrc-orig ~/.vimrc-orig-#{time}")
      Kernel.system("cp src/refactoring/vim/vimrc ~/.vimrc")
    end
  end

  task :restore_vimfiles do

    vim_orig_exists = File.exists? File.expand_path '~/.vim-orig'
    vim_orig_rc_exists = File.exists? File.expand_path '~/.vimrc-orig'

    if vim_orig_exists and vim_orig_rc_exists
      Kernel.system("rm -rf ~/.vim")
      Kernel.system("rm -rf ~/.vimrc")
      Kernel.system("mv ~/.vim-orig ~/.vim")
      Kernel.system("mv ~/.vimrc-orig ~/.vimrc")
    else
      p "You have already run this or there is no original to restore"
    end

  end
end
