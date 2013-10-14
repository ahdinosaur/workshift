self = this

Template.navbar.brand = ->
  user = Meteor.user()
  if user
    self.Houses.findOne(user.profile.house).name
  else
    self.Coop.name