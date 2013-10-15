self = this

Router.configure({
  layout: 'layout'
  notFoundTemplate: 'notFound'
  loadingTemplate: 'loading'
  renderTemplates: {
    'navbar': {to: 'navbar'}
  }
})

Router.map(->
  @route('home' {
    path: '/'
    data: ->
      self.Houses.find()
    waitOn: ->
      Meteor.subscribe('houses')
    controller: 'HomeController'
    template: Template.houses
  }, ->
    user = Meteor.user()
    if user
      house = self.Houses.findOne(user.profile.house)
      @redirect('house', house)
    else
      @render('navbar', { to: 'navbar'})
      @render()
  )
  @route('houses' {
    path: '/houses'
    data: ->
      self.Houses.find()
    waitOn: ->
      Meteor.subscribe('houses')
  })
  @route('workshift' {
    path: '/workshift'
    data: ->
      {
        workshifts: Workshifts.find()
      }
    waitOn: ->
      Meteor.subscribe('workshifts')
  })
  @route('signoff' {
    path: '/signoff'
    data: ->
      {
        users: Meteor.users.find()
      }
    waitOn: ->
      Meteor.subscribe('directory')
  })
  @route('house/signoff' {
    path: '/:_id/signoff'
    data: ->
      {
        users: Meteor.users.find({
          'profile.house': @params._id
        })
      }
    waitOn: ->
      Meteor.subscribe('directory')
    template: Template.signoff
  })
  @route('preferences' {
    path: '/preferences'
    data: ->
      {
        preferences: {}
      }
    #waitOn: Meteor.subscribe('preferencess')
  })

  # do this route last as it matches the most
  @route('house' {
    path: '/:_id'
    data: ->
      self.Houses.findOne(@params._id)
    waitOn: ->
      Meteor.subscribe('houses')
  })
)