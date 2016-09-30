var featuredScreenLoadRequest = function (){
  var api = ApiStore.getApiUrl('Device List Featured')
  var url = api.request.url+"?format=json"
  $.ajax({
    url: url,
    method: api.request.method,
    success: function(data){
      dispatcher.dispatch({
        actionType: 'featured-screen-set-items',
        items: data
      })
    },
  })
}
var deviceListLoadRequest = function (){
  var api = ApiStore.getApiUrl('Device List')
  var url = api.request.url+"?format=json"
  $.ajax({
    url: url,
    method: api.request.method,
    success: function(data){
      dispatcher.dispatch({
        actionType: 'featured-screen-set-items',
        items: data.results
      })
    },
  })
}
