User.create([
  {id: 1, fname: 'John', lname: 'Murphy', age: '27', password: 'password', username: 'john.murphy', avatar: File.new('C:\Users\John Murphy\Desktop\NYCDA\Projects\MobileResponsiveness\book.png')}
])

Post.create([
  {id: 1, body: 'Test workout description', calories: '504', category: 'cardio', title: 'Thursday run'}
])