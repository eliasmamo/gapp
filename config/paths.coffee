base =
  app:           "./app"
  vendor:        "./vendor"
  _public:       "./public"

paths =
  app_vendor_styles: [
                  "#{base.vendor}/styles/bootstrap/css/bootstrap.css"
  ]
  app_vendor_js:  [
                  "#{base.vendor}/scripts/**/*.js"
                  "#{base.vendor}/styles/**/*.js"
  ]

  app_styles:     "#{base.app}/assets/styles/**/*.scss"
  app_scripts:    "#{base.app}/**/*.coffee"
  app_templates:  "#{base.app}/**/*.jade"

  pub_vendor_js:      "#{base._public}/vendor/scripts"
  pub_vendor_styles:  "#{base._public}/vendor/syles"
  pub_app_scripts:    "#{base._public}/app/scripts"
  pub_app_styles:     "#{base._public}/vendor/syles"

module.exports = paths