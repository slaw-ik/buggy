class App.Views.Content extends Backbone.View

  className: 'row'
  template: HandlebarsTemplates['content']

  render: ->
    @$el.html(@template())
    @

  initialize: ->
    @listenTo App.Vent, "project:create", @renderEmpyView
    @listenTo App.Vent, "project:new", @renderNewProjectView
    @listenTo App.Vent, "project:show", @renderProjectDetails
    @listenTo App.Vent, "project:destroy", @renderEmpyView

  renderProjectDetails: (model) ->
    @swapMain(new App.Views.ProjectDetails({model: model}))

  renderEmpyView: ->
    @swapMain(new App.Views.Empty())
    Backbone.history.navigate("/projects")

  renderNewProjectView: ->
    @swapMain(new App.Views.NewProject({model: new App.Models.Project()}))
    Backbone.history.navigate("/projects/new")

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