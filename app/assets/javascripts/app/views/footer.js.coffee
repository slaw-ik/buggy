class App.Views.Footer extends Backbone.View

  className: ''
  template: HandlebarsTemplates['footer']

  render: ->
    @$el.html(@template())
    @