self = this

Router.configure({
  layout: 'layout',
  notFoundTemplate: 'notFound',
  loadingTemplate: 'loading',
  renderTemplates: {
    'navbar': {to: 'navbar'}
  },
})

Router.map(->
  this.route('home', {
    path: '/',
    data: (->
      user = Meteor.user()
      return {
        house: if user then self.Houses.findOne(user.profile.house) else null,
        houses: if not user then Houses.find().fetch() else null
      }
    ),
    waitOn: Meteor.subscribe('houses'),
  })
  this.route('houses', {
    path: '/houses',
    data: (->
      return Houses.find().fetch()
    ),
    waitOn: Meteor.subscribe('houses'),
  })
  this.route('house', {
    path: '/house/:_id',
    data: (->
      return self.Houses.findOne(this.params._id)
    ),
    waitOn: Meteor.subscribe('houses'),
  })
  this.route('workshift', {
    path: '/workshift',
    data: (->
      return {
        workshifts: Workshifts.find()
      }
    ),
    waitOn: Meteor.subscribe('workshifts'),
  })
  this.route('signoff', {
    path: '/signoff',
    data: (->
      return {
        users: Meteor.users.find()
      }
    ),
    waitOn: Meteor.subscribe('users'),
  })
  this.route('preferences', {
    path: '/preferences',
    data: (->
      return {
        preferences: {}
      }
    ),
    #waitOn: Meteor.subscribe('preferencess'),
  })
)