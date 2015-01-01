class App.Views.Content extends Backbone.View

  className: 'row'
  template: HandlebarsTemplates['content']

  render: ->
    @$el.html(@template())
    @

  initialize: ->
    @listenTo App.Vent, "project:create", @renderEmpyView

  renderEmpyView: ->
    @swapMain(new App.Views.Empty())
    Backbone.history.navigate("/projects")

  swapMain: (v) ->
    @changeCurrentMainView(v)
    @$('#main-area').html(@currentMainView.render().el)

  changeCurrentMainView: (v) ->
    @currentMainView.remove() if @currentMainView
    @currentMainView = v

  swapSide: (v) ->
    @changeCurrentContentView(v)
    @$('#sidebar-area').html(@currentSideView.render().el)

  changeCurrentContentView: (v) ->
    @currentSideView.remove() if @currentSideView
    @currentSideView = v