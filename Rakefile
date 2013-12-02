require './lib/kata_chapter'

task :default => :build

desc 'Build Katas from sources'
task :build_editing do
  FileUtils.rm_rf('build')
  Dir.glob('src/editing/sections.yaml').each do |chapter|
    puts "building #{chapter}"
    KataChapter.new(chapter).build
  end
end

task :build_refactoring do
  FileUtils.rm_rf('build')
  Dir.glob('src/refactoring/sections.yaml').each do |chapter|
    puts "building #{chapter}"
    KataChapter.new(chapter).build
  end
end
