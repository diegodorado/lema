namespace :db do
  desc "Fix posts in db"
  task :fix => :environment do
    posts = Post.all
    posts.each do |post|
      post.save
    end


  end

end

namespace :pc do
  desc "reproccess thumbs"
  task :reproccess => :environment do
    Book.all.each {|b| b.cover.reprocess! if b.cover}
  end

end
