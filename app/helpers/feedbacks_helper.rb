module FeedbacksHelper
    def display_rating_stars(rating)
       stars = ""
       (1..5).each do |i|
         if i <= rating
           stars += '<i class="fas fa-star"></i>'
         else
           stars += '<i class="far fa-star"></i>'
         end
       end
       stars.html_safe
    end
   end