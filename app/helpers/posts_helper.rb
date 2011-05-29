module PostsHelper

  def author_information_for(post, partial = 'posts/member')
    render :partial => partial, :object => post.member
  end

end
