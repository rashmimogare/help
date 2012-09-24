class App.TicketHistory extends App.ControllerModal
  constructor: ->
    super
    @fetch(@ticket_id)

  fetch: (@ticket_id) ->
    # get data
    App.Com.ajax(
      id:    'ticket_history',
      type:  'GET',
      url:   '/api/ticket_history/' + ticket_id,
      success: (data, status, xhr) =>
        # remember ticket
        @ticket = data.ticket

        # load user collection
        App.Collection.load( type: 'User', data: data.users )

        # load ticket collection
        App.Collection.load( type: 'Ticket', data: [data.ticket] )

        # load history_type collections
        App.Collection.load( type: 'HistoryType', data: data.history_types )

        # load history_object collections
        App.Collection.load( type: 'HistoryObject', data: data.history_objects )

        # load history_attributes collections
        App.Collection.load( type: 'HistoryAttribute', data: data.history_attributes )

        # load history collections
        App.Collection.deleteAll( 'History' )
        App.Collection.load( type: 'History', data: data.history )

        # render page
        @render()
    )

  render: ->

    @html App.view('agent_ticket_history')(
      objects: App.Collection.all( 'History' ),
    )

    @modalShow()
    @userPopups()
