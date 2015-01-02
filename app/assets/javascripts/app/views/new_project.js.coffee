class App.Views.NewProject extends Backbone.View

  template: HandlebarsTemplates['new_project']

  events:
    "click button": "saveProject"

  saveProject: (e) ->
    e.preventDefault()
    @model.set name: $('#name').val()
    @model.set description: $('#description').val()
    @model.save {},
      success: (model) -> App.Vent.trigger "project:create", model


  render: ->
    @$el.html(@template(@model.toJSON()))
    @