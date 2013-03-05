namespace :db do
  desc "Fix posts in db"
  task :fix => :environment do
    posts = Post.all
    posts.each do |post|
      puts post.id if post.video.length > 250
      puts post.id if post.audio.length > 250
      puts post.id if post.sidebar_title.length > 250
      puts post.id if post.title.length > 250
    end


  end

end

namespace :pc do
  desc "reproccess thumbs"
  task :reproccess => :environment do
    Book.all.each {|b| b.cover.reprocess! if b.cover}
  end

end
