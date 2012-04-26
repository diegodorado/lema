namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'

    [Post, Book].each(&:delete_all)

    Post.populate 20 do |post|
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

      post.sidebar_title = ['links relacionados', 'informacion']
      post.sidebar_body = [
        "* [link1](http://google.com)\n* [link2](http://google.com)\n* [link3](http://google.com)\n",
        nil
        ]

    end
    
  end
end
