namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'

    [Post, Book, Category, Course].each(&:delete_all)

    Post.populate 60..100 do |post|
      post.title = Populator.words(4..10).titleize
      post.body = Populator.sentences(2..15)
      post.published_at = 2.years.ago..Time.now
      post.video = [
        '<iframe width="100%" height="315" src="http://player.vimeo.com/video/5216980?title=0&amp;byline=0&amp;portrait=0&amp;autoplay=0" frameborder="0" allowfullscreen></iframe>',
        '<iframe width="100%" height="315" src="http://player.vimeo.com/video/18684332?title=0&amp;byline=0&amp;portrait=0&amp;autoplay=0" frameborder="0" allowfullscreen></iframe>',
        '<iframe width="100%" height="315" src="http://player.vimeo.com/video/26446787?title=0&amp;byline=0&amp;portrait=0&amp;autoplay=0" frameborder="0" allowfullscreen></iframe>',
        '<iframe width="100%" height="315" src="http://player.vimeo.com/video/292354?title=0&amp;byline=0&amp;portrait=0&amp;autoplay=0" frameborder="0" allowfullscreen></iframe>',
        nil,
        nil,
        nil,
        nil
        ]
      post.audio = [
        '<iframe width="100%" height="166" scrolling="no" frameborder="no" src="http://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F40484345%3Fsecret_token%3Ds-jNo8y&show_artwork=true&secret_url=true"></iframe>',
        '<iframe width="100%" height="166" scrolling="no" frameborder="no" src="http://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F43502573&show_artwork=true"></iframe>',
        '<iframe width="100%" height="166" scrolling="no" frameborder="no" src="http://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F43453295&show_artwork=true"></iframe>',
        nil,
        nil,
        nil,
        nil
        ]

      post.sidebar_title = ['links relacionados', 'informacion', nil]
      post.sidebar_body = "* [#{Faker::Internet.domain_word}](http://#{Faker::Internet.domain_name})\n* #{Faker::Internet.domain_word}](http://#{Faker::Internet.domain_name})\n* #{Faker::Internet.domain_word}](http://#{Faker::Internet.domain_name})\n"

    end


    Book.populate 10..20 do |book|
      book.title = Populator.words(2..6).titleize
      book.specification = "#{Faker::Company.name}\n#{Faker::Address.street_address}\n#{rand(1000)} páginas"
      book.body = Populator.sentences(2..15)
      book.points_of_sale = Populator.sentences(2..3)
      book.buy_online = Populator.sentences(2..3)
      book.section = [:oe, :te]
    end


    Category.populate 40..60 do |cat|
      cat.name = Populator.words(4..10).titleize
      cat.locale = [:es, :en, :cs, :it, :fr]
    end

    Course.populate 60..100 do |course|
      course.title = Populator.words(4..10).titleize
      course.category_id = Category.all.collect(&:id).sort_by{rand}.first
      course.body = Populator.sentences(2..15)
      course.specification = Populator.sentences(2..5)
      course.objective = Populator.sentences(2..5)
      course.summary = Populator.sentences(2..3)
    end



  end
end
