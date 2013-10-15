self = this

Handlebars.registerHelper('brand', ->
  user = Meteor.user()
  # BEGIN hack
  if user and user.profile.house
    house = self.Houses.findOne(user.profile.house)
    if house then return house.name
    # END hack
  return self.Org.abbr
)