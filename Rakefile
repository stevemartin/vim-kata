require './lib/kata_chapter'

task :default => :build

desc 'Build Katas from sources'
task :build_replace do
  FileUtils.rm_rf('build')
  Dir.glob('src/transforms/replace/sections.yaml').each do |chapter|
    puts "building #{chapter}"
    KataChapter.new(chapter).build
  end
end

task :build_macro do
  FileUtils.rm_rf('build')
  Dir.glob('src/transforms/macros/sections.yaml').each do |chapter|
    puts "building #{chapter}"
    KataChapter.new(chapter).build
  end
end
