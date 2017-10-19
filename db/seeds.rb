User.create([
  {id: 1, fname: 'John', lname: 'Murphy', age: '27', password: 'password', username: 'john.murphy', avatar: File.new('C:\Users\John Murphy\Desktop\NYCDA\Projects\MobileResponsiveness\book.png')},
  {id: 2, fname: 'Sophie', lname: 'Bushman', age: '19', password: 'password', username: 'sophiebushman', avatar: File.new('C:\Users\John Murphy\Desktop\NYCDA\Projects\MobileResponsiveness\climbing.png')}
])

Post.create([
  {id: 1, body: 'Test workout description', calories: '504', category: 'cardio', title: 'Thursday run', user_id: 1}
])



# <% if @current_user %>


# 	<img src="<%= user.avatar.url %>">


# <% end %> 

#/Users/sophiebushman/Desktop/NYCDA/book.png
#/Users/sophiebushman/Downloads/headshot.jpg
#C:\Users\John Murphy\Desktop\NYCDA\Projects\MobileResponsiveness\book.png
#C:\Users\John Murphy\Desktop\NYCDA\Projects\MobileResponsiveness\climbing.png