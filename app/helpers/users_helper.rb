module UsersHelper
   
   def gravatar_for(user, options = { :size => 100 })
         gravatar_image_tag(user.email.downcase, :alt => user.name,
                                                 :class => 'gravatar',
                                                 :gravatar => options)
   end

   def profilegravatar_for(user, options = { :size => 170 })
         gravatar_image_tag(user.email.downcase, :alt => user.name,
                                                 :class => 'gravatar',
                                                 :gravatar => options)
   end

   
   def smallgravatar_for(user, options = { :size => 25 })
         gravatar_image_tag(user.email.downcase, :alt => user.name,
                                                 :class => 'gravatar',
                                                 :gravatar => options)
   end
   
end

