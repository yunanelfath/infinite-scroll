var featuredScreenLoadRequest = function(){
  var url = "https://sandbox.10adx.com/api/devices/featured/?format=json"
  $.ajax({
    url: url,
    method: "GET",
    success: function(data){
      dispatcher.dispatch({
        actionType: 'featured-screen-set-items',
        items: data
      })
    },
  })
}
var deviceListLoadRequest = function(){
  var url = "https://sandbox.10adx.com/api/devices/?format=json"
  $.ajax({
    url: url,
    method: "GET",
    crossDomain: true,
    success: function(data){
      dispatcher.dispatch({
        actionType: 'featured-screen-set-items',
        items: data.results
      })
    }
  })
}

var propertyTypeLoadRequest = function(){
  var url = "https://sandbox.10adx.com/api/devices/filter/property_type/?format=json"
  $.ajax({
    url: url,
    method: "GET",
    beforeSend: function(){
    },
    success: function(data){
      dispatcher.dispatch({
        actionType: 'screen-filter-device-set-type',
        items: data,
        type: 'propertyTypeLists'
      })
    },
  })
}
var rotationListLoadRequest = function(){
  var url = "https://sandbox.10adx.com/api/devices/filter/rotation/?format=json"
  $.ajax({
    url: url,
    method: "GET",
    success: function(data){
      dispatcher.dispatch({
        actionType: 'screen-filter-device-set-type',
        items: data,
        type: 'rotationLists'
      })
    },
  })
}

var sizeListLoadRequest = function(){
  var url = "https://sandbox.10adx.com/api/devices/filter/size/?format=json"
  $.ajax({
    url: url,
    method: "GET",
    success: function(data){
      dispatcher.dispatch({
        actionType: 'screen-filter-device-set-type',
        items: data,
        type: 'sizeLists'
      })
    },
  })
}

var cityListLoadRequest = function(){
  var url = "https://sandbox.10adx.com/api/cities/?format=json"
  $.ajax({
    url: url,
    method: "GET",
    success: function(data){
      dispatcher.dispatch({
        actionType: 'screen-filter-device-set-type',
        items: data,
        type: 'cityLists'
      })
    },
  })
}

var filterDevices = function(obj){
  obj.format = "json"
  params = $.param(obj)
  var url = "https://sandbox.10adx.com/api/devices/?"+params
  $.ajax({
    url: url,
    method: "GET",
    success: function(data){
      dispatcher.dispatch({
        actionType: 'featured-screen-set-items',
        items: data.results,
        onReset: true
      })
    },
  })
}
