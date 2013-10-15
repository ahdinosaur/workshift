self = this

if Meteor.isClient
  Accounts.ui.config({
    passwordSignupFields: 'USERNAME_AND_OPTIONAL_EMAIL'
  })

if Meteor.isServer
  Meteor.startup(->
    if Meteor.users.find().count() == 0
      Accounts.createUser({
        username: "dinosaur"
        password: "testme"
        profile: {
          name: "Michael Williams"
          house: "clo"
        }
      })
  )

  Meteor.publish('directory' (options={}) ->
    Meteor.users.find({}, {
      fields: {
        'profile.house': 1
      }
    })
  )