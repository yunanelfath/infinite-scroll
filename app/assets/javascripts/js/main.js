var featuredScreenLoadRequest = function(){
  var url = "http://sandbox.10adx.com/api/devices/featured/?format=json"
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
  var url = "http://sandbox.10adx.com/api/devices/?format=json"
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
  var url = "http://sandbox.10adx.com/api/devices/filter/property_type/?format=json"
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
  var url = "http://sandbox.10adx.com/api/devices/filter/rotation/?format=json"
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
  var url = "http://sandbox.10adx.com/api/devices/filter/size/?format=json"
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
  var url = "http://sandbox.10adx.com/api/cities/?format=json"
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
  var url = "http://sandbox.10adx.com/api/devices/?"+params
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

var getDeviceDetail = function(stringId){
  if(stringId){
    var url = "http://sandbox.10adx.com/api/device/"+stringId+"/?"+$.param({format: 'json'})
    var token = getCookie('___adxLoginToken')
    if(token){
      $.ajax({
        url: url,
        method: "GET",
        headers: {
          "Authorization": JSON.parse(token).token
        },
        success: function(data){
          params = data
          params.imageLists = []
          dispatcher.dispatch({
            actionType: 'adx-global-attributes-setter',
            attributes: {deviceDetailContent: params}
          })
          getDeviceDetailImage(stringId, token)
        },
      })
    }else{
      alert('You have to login first.')
      Turbolinks.visit('sign-in')
    }
  }
}

var getDeviceDetailImage = function(id, token){
  var url = "http://sandbox.10adx.com/api/device/"+id+"/images/?"+$.param({format: 'json'})
  if(token){
    $.ajax({
      url: url,
      method: "GET",
      headers: {
        "Authorization": JSON.parse(token).token
      },
      success: function(data){
        params = AdxWrapperStore.deviceDetailContent
        params.imageLists = data
        dispatcher.dispatch({
          actionType: 'adx-global-attributes-setter',
          attributes: {deviceDetailContent: params}
        })
        getUnavailableDate(id, token)
      },
    })
  }
}

var getUnavailableDate = function(id, token){
  var dateNow = new Date()
  var dateMonth = dateNow.getMonth()
  if(dateNow.getMonth().toString().length === 1){
    dateMonth = "0"+dateNow.getMonth();
  }
  var url = "http://sandbox.10adx.com/api/device/"+id+"/unavailable-dates/"+dateMonth+"/"+dateNow.getUTCFullYear()+"/?"+$.param({format: 'json'})
  if(token){
    $.ajax({
      url: url,
      method: "GET",
      headers: {
        "Authorization": JSON.parse(token).token
      },
      success: function(data){

      },
    })
  }
}

var setCookie = function(key, value) {
    var expires = new Date();
    expires.setTime(expires.getTime() + (1 * 24 * 60 * 60 * 1000));
    document.cookie = key + '=' + value + ';expires=' + expires.toUTCString();
}

var  getCookie = function(key) {
    var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
    return keyValue ? keyValue[2] : null;
}

var eraseCookie= function(name) {
    setCookie(name, "", -1);
}

var checkIsLoggedIn = function(){
  cookie = getCookie('___adxLoginToken');
  if(cookie && cookie != ""){
    token = JSON.parse(cookie)
    dispatcher.dispatch({
      actionType: 'adx-global-attributes-setter',
      attributes: {isLoggedIn: {status: true, email: token.email}}
    })
  }else{
    dispatcher.dispatch({
      actionType: 'adx-global-attributes-setter',
      attributes: {isLoggedIn: {status: false, email: null}}
    })
  }
}
