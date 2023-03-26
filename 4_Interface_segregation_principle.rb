# Code should not be forced to depend on methods that
# it doesn't use

# class Blog
#     def edit_post
#         puts "Post edited"
#     end

#     def delete_post
#         puts "Post deleted"
#     end

#     def create_post
#         puts "Post created"
#     end
# end

# blog = Blog.new
# blog.edit_post
# blog.delete_post
# blog.create_post

# Output
# Post edited
# Post deleted
# Post created


#*******************SOLUTION********************

# we can create a moderator class which provide access
# to different methods we want

require 'forwardable'

class Blog
    def edit_post
        puts "Post edited"
    end

    def delete_post
        puts "Post deleted"
    end

    def create_post
        puts "Post created"
    end
end

class Moderator
    extend Forwardable
    def_delegators :@blog, :edit_post

    def initialize(blog)
        @blog = blog
    end
end

moderator = Moderator.new(Blog.new)

moderator.edit_post # Post edited


moderator.delete_post # /home/suryanshgupta/Projects/SOLID_PRINCIPLE/4_Interface_segregation_principle.rb:62:in `<main>': undefined method `delete_post' for #<Moderator:0x000055a650026510 @blog=#<Blog:0x000055a650026678>> (NoMethodError)

