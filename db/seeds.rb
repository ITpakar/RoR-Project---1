Code.create(
[
  {name: 'Test Match', default_innings: 2}, 
  {name: 'T20', default_innings: 1}, 
  {name: 'ODI', default_innings: 1}
])

# Admin Creation
admin = Admin.create(:email => 'simranjit.singh@mobiloitte.com', :password => '12345678', :password_confirmation => '12345678')
admin.build_profile.save(:validate => false)
admin = Admin.create(:email => 'tipping@example.com', :password => 'password', :password_confirmation => 'password')
admin.build_profile.save(:validate => false)