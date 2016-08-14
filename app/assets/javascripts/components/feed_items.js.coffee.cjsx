FeedItems = React.createClass
  propTypes:
    items: React.PropTypes.array
    limit: React.PropTypes.number
    page: React.PropTypes.number
    assetPath: React.PropTypes.string

  getInitialState: ->
    {
      items: @props.items
      page: @props.page
      requesting: false
      completed: false
    }

  componentDidMount: ->
    $(window).on('scroll', $.proxy(@recordScroll, @))
    $(ReactDOM.findDOMNode(@)).find('#container-test').masonry(itemSelector: '.box',isAnimated: true,
      columnWidth: ((e)=>
        return e/4
      )
    )

  componentWillReceiveProps: (newProps) ->
    { limit } = @props
    { items, page } = @state

    if items.length > 0 && newProps.items.length > 0
      for item in newProps.items
        items.push(item)
    @setState(items: items, page: newProps.page, requesting: newProps.requesting)

  recordScroll: (event) ->
    _this = @
    elementUl = $(ReactDOM.findDOMNode(this)).find('ul')
    getLoadFeeds = _.debounce((event) =>
      unless _this.state.requesting
        nextPage = _this.state.page + 1
        $.ajax
          url: Routes.feeds_path({format: 'js',limit: _this.props.limit, page: nextPage})
          dataType: 'json'
          beforeSend: =>
            _this.setState(requesting: true)
          success: ((data)=>
            if data
              _this.componentWillReceiveProps({items: data, page: nextPage, requesting: false})
              $(ReactDOM.findDOMNode(_this)).find('#container-test').masonry('reload')
            else
              # _this.setState(completed: true) #stop ajax if is loaded all
              _this.setState(completed: false, requesting: false, page: 1) #set unlimited scroll
          )
    ,800)

    # console.log scrollY: event.currentTarget.scrollY, maxY: (event.currentTarget.scrollMaxY - 100)
    bottomLimit = if event.currentTarget.scrollMaxY == undefined then elementUl.outerHeight() else event.currentTarget.scrollMaxY
    bottomLimit = bottomLimit - 550
    scrollTop = if event.currentTarget.document.documentElement.scrollTop then event.currentTarget.document.documentElement.scrollTop else event.currentTarget.scrollY # IE 9 condition
    # console.log "scrollY: "+scrollTop+",  bottomLmit:" +bottomLimit # for ie
    # console.log scrollY: event.currentTarget.scrollY, maxY: (bottomLimit - 250)
    if scrollTop > bottomLimit
      getLoadFeeds(event)
      # console.log elementUl.outerHeight()
      # console.log _this.state.items.length

  onClickInfo: (value)->
    alert(value?.author)

  render: ->
    { limit } = @props
    { items, page, requesting, completed } = @state
    { onClickInfo } = @

    itemComponent = (index) =>
      key = Object.keys(index)
      item = index[key.toString()]

      title = if item.title == undefined then "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur"  else item.title
      count = if item.id == undefined then "40" else item.id
      author = if item.author == undefined then "Neque porro" else item.author
      <div className="box #{key.toString()}" onClick={onClickInfo.bind(@, item)}>
        <div className="container-content">
          <img src="#{@props.assetPath}"/>
          <div className="header">{title}</div>
          <div className="content">Neque porro quisquam est qui dolorem ipsum quia dolor sit amet</div>
          <div className="author">
            <div className="icon"></div>
            <div className="name">{author}</div>
          </div>
        </div>
        <div className="footer">
          <div className="footer-left">
            <div className="icon"></div>
            <span className="count">{count+"k"}</span>
          </div>
          <div className="footer-right">
            <span className="cat">entertainment</span>
          </div>
        </div>
      </div>

    <div className="test">
      <div id="container-test" style={width: '100%'}>
        {items.map(itemComponent)}
      </div>
      {
        if requesting && completed == false
          <div style={position: "fixed",bottom: 0,height: "20px",width: "300px", background: "#d07a61",left: "583px",color: "#fff",borderRadius: "15px"}>Loading ....</div>
      }
    </div>


window.FeedItems = FeedItems
