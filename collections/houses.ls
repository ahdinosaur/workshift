self = this

self.Houses = new Meteor.Collection('houses')

if Meteor.isServer
  Meteor.startup(->
    if self.Houses.find().count() == 0
      [{
        _id: "ath",
        name: "Afro House",
      }, {
        _id: "aca",
        name: "Andres Castro Arms",
      }, {
        _id: "caz"
        name: "Casa Zimbabwe",
      }, {
        _id: "clo",
        name: "Cloyne Court"
        description: "an awesome house full of beautiful people",
        managers: {}
      }, {
        _id: "con",
        name: "The Convent",
      }, {
        _id: "dav",
        name: "Davis",
      }, {
        _id: "euc",
        name: "Euclid",
      }, {
        _id: "fen",
        name: "Fenwick",
      }, {
        _id: "hip",
        name: "Hillegass Parker",
      }, {
        _id: "hoy",
        name: "Hoyt",
      }, {
        _id: "kid",
        name: "Kidd",
      }, {
        _id: "kng",
        name: "Kingman",
      }, {
        _id: "lot",
        name: "Lothlorien",
      }, {
        _id: "nsc",
        name: "Northside",
      }, {
        _id: "rid",
        name: "Ridge",
      }, {
        _id: "roc",
        name: "Rochdale",
      }, {
        _id: "she",
        name: "Sherman",
      }, {
        _id: "stb",
        name: "Stebbins",
      }, {
        _id: "wil",
        name: "Oscar Wilde",
      }, {
        _id: "wol",
        name: "Wolf"
      }].forEach((house) ->
        self.Houses.insert(house)
      )
  )

  Meteor.publish('houses', ->
    self.Houses.find()
  )