localStorage['client_id'] = '2b9312964a1619d99082a76ad2d6d8c6'
localStorage['sc_id'] = location.hash.replace('#', '')

$ ->
  $('a').click(() ->
    play()
  )

  $('#track').keypress((e) ->
    if e.which == 13 #enter
      q = $('#track').val()
      url = "http://api.soundcloud.com/tracks.json?client_id=#{localStorage['client_id']}&q=#{q}&duration=long"
      $.get(url, (tracks) ->
        for track in tracks
          artwork = ''
          if track.artwork_url
            artwork = "<img src=\"#{track.artwork_url}\" width=100px/>"

          $('#tracks').append("""
            <tr>
              <td><a href=\"##{track.id}\">#{track.title}</a></td>
              <td>#{artwork}</td>
              <td>#{track.duration}</td>
            </tr>
          """)
      )
  )

  if location.hash
    play()
    url = "http://api.soundcloud.com/tracks/#{localStorage['sc_id']}.json?client_id=#{localStorage['client_id']}"
    $.get(url, (track) ->
      if localStorage['workloads']
        @workloads = JSON.parse(localStorage['workloads'])
      else
        @workloads = []
      workload = {
        sc_id: localStorage['sc_id']
        started: parseInt((new Date)/1000)
        title: track.title
        artwork_url: track.artwork_url
      }

      @workloads.unshift(workload)
      
      localStorage['workloads'] = JSON.stringify(@workloads)

      for workload in @workloads
        artwork = ''
        if workload.artwork_url
          artwork = "<img src=\"#{workload.artwork_url}\" width=100px/>"
        $('#workloads').append("""
          <tr>
            <td><a href=\"##{workload.sc_id}\">#{workload.title}</a></td>
            <td>#{artwork}</td>
            <td>#{workload.started}</td>
          </tr>
        """)
    )

play = () ->
    $("#playing").html("""
<iframe width="100%" height="400" scrolling="no" frameborder="no" src="https://w.soundcloud.com/player/?visual=true&url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F#{localStorage['sc_id']}&show_artwork=true&client_id=#{localStorage['client_id']}&auto_play=true"></iframe>
    """)
