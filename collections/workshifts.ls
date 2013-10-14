self = this

self.Workshifts = new Meteor.Collection('workshifts')

if Meteor.isServer
  Meteor.startup(->
    if self.Workshifts.find().count() == 0
      self.Workshifts.insert({
        name: "IKC",
        description: "intensive kitchen clean"
      })
  )

  Meteor.publish('workshifts', ->
    return self.Workshifts.find()
  )