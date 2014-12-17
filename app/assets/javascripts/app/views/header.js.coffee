class App.Views.Header extends Backbone.View

  className: 'container'
  template: HandlebarsTemplates['header']

  render: ->
    @$el.html(@template())
    @