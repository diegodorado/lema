namespace :db do
  desc "Fix posts in db"
  task :fix => :environment do
    posts = Post.all
    posts.each do |post|
      post.save
    end


  end
end
