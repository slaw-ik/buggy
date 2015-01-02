class App.Views.NewProject extends Backbone.View

  template: HandlebarsTemplates['new_project']

  events:
    "click button": "saveProject"

  initialize: ->
    @listenTo @model, 'sync', @render
    @model.fetch() unless @model.isNew()


  saveProject: (e) ->
    e.preventDefault()
    @model.set name: $('#name').val()
    @model.set description: $('#description').val()
    @model.save {},
      success: (model) -> App.Vent.trigger "project:create", model


  render: ->
    @$el.html(@template(@model.toJSON()))
    @