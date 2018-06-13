document.addEventListener 'turbolinks:load', ->
  currentPath = window.location.pathname
  switch currentPath
    when '/'
      $('#home-link').addClass 'active'
    when '/users/edit'
      $('#profile-link').addClass 'active'
    when '/users/sign_in'
      $('#sign-in-link').addClass 'active'
    when '/users/sign_up'
      $('#sign-up-link').addClass 'active'
  return