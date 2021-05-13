import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery"
import "popper.js"
import "bootstrap/dist/js/bootstrap.bundle.min"

import "stylesheets/application"
import "@fortawesome/fontawesome-free/css/all"
import "modules/datepicker"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
