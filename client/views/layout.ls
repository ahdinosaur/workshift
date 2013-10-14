self = this

Handlebars.registerHelper('brand', ->
  user = Meteor.user()
  if user
    self.Houses.findOne(user.profile.house).name
  else
    self.Coop.name
)