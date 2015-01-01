class App.Views.Projects extends Backbone.View

  template: HandlebarsTemplates['projects']

  events:
    'click .btn': 'newProject'

  newProject: ->


  initialize: ->
    @listenTo @collection, "reset", @render
    @collection.fetch({reset: true})
    @listenTo App.Vent, "project:create", @addToCollection
    @listenTo @collection, "add", @renderProject

  addToCollection: (model) ->
    @collection.add model

  render: ->
    @$el.html(@template())
    @collection.forEach @renderProject, @
    @

  renderProject: (model) ->
    v = new App.Views.Project({model: model})
    @$('ul').append(v.render().el)